package com.kh.dodamPj.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dodamPj.service.AdminService;
import com.kh.dodamPj.service.AdoptService;
import com.kh.dodamPj.service.AnimalService;
import com.kh.dodamPj.service.BoardService;
import com.kh.dodamPj.service.CustomerBoardService;
import com.kh.dodamPj.service.MemberService;
import com.kh.dodamPj.service.NewsBoardService;
import com.kh.dodamPj.service.NoticeService;
import com.kh.dodamPj.service.VolunteerService;
import com.kh.dodamPj.util.AnimalFileUploadUtil;
import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AdoptVo;
import com.kh.dodamPj.vo.AnimalVo;
import com.kh.dodamPj.vo.BoardVo;
import com.kh.dodamPj.vo.CustomerBoardVo;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.NewsBoardVo;
import com.kh.dodamPj.vo.NoticeVo;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	@Inject
	private BoardService boardService;
	@Inject
	private NoticeService noticeService;
	@Inject
	private MemberService memberService;
	@Inject
	private VolunteerService volunteerService;
	@Inject
	private AnimalService animalService;
	@Inject
	private AdoptService adoptService;
	@Inject
	private CustomerBoardService customerBoardService;
	@Inject
	private NewsBoardService newsBoardService;
	
	//관리자 로그인 상태에서 공지사항 목록
	@RequestMapping(value="/noticeList",method=RequestMethod.GET)
	public String menu1(Model model,PagingDto pagingDto) throws Exception{
		int count = noticeService.getCount(pagingDto); //페이징
		pagingDto.setCount(count); //페이징
//		int stp = pagingDto.getStartPage(); // startPage 확인용
//		System.out.println("pDto: "+stp); // startPage 확인용
		System.out.println("pDto: "+pagingDto);
		List<NoticeVo> list = noticeService.listAll(pagingDto);
		model.addAttribute("noticeList", list);
		model.addAttribute("pagingDto1", pagingDto);
		return "/admin/adminNoticeList";
	}
	
	// 관리자 페이지로 이동 요청 오면 관리자 페이지로 이동 
	@RequestMapping(value="/adminPage",method=RequestMethod.GET)
	public String adminPage(NoticeVo noticeVo,Model model,PagingDto pagingDto) throws Exception{
		//공지 사항 리스트 붙혀서 이동
		List<NoticeVo> list = noticeService.listAll(pagingDto);
		model.addAttribute("noticeList", list);
		return "/admin/adminPage"; 
	}
	
	//회원 관리 페이지인데 나중에 동물 등록으로 변경
	@RequestMapping(value = "/memberManagement", method = RequestMethod.GET)
	public String memberManagement(Model model) throws Exception {
		List<MemberVo> memberList = adminService.listMember();
		model.addAttribute("memberList", memberList);
		return "/admin/memberManagement";
	}
	
	// 봉사활동 리스트 보기 : 관리자 페이지 --2021-07-19
	@RequestMapping(value = "/adminReservation_status", method = RequestMethod.GET)
	public String adminReservation_status(Model model,PagingDto pagingDto) throws Exception {
		List<VolunteerVo> volunList = volunteerService.volunReservList(pagingDto);		
		model.addAttribute("volunList", volunList);
		return "/admin/adminReservation_status";
	}
	
	//봉사활동 승인 and 거부 하기 : 비동기로 처리 --2021-07-19 : 봉사활동 테이블에 result 컬럼 추가 
	@RequestMapping(value = "/adminReservation_statusUpdate", method = RequestMethod.GET)
	@ResponseBody
	public String adminReservation_statusUpdate(VolunteerVo volunteer,Model model,PagingDto pagingDto) throws Exception {
		volunteerService.resultInsert(volunteer);		
		return "success";
	}
	
	// 로그아웃 하는거
	@RequestMapping("/logout")
	public String logout(HttpSession session,RedirectAttributes rttr) {
	   session.invalidate();
	   return "redirect:/"; // 로그아웃을 누르면 mainPage.jsp로 리다이렉트
	}
	
	// 보호중인 동물 페이지
	@RequestMapping(value="/adminProtectList", method=RequestMethod.GET)
	public String adminProtectAnimal(Model model, A_PagingDto aPagingDto) throws Exception {
		int count = adminService.getCount(aPagingDto);
		aPagingDto.setCount(count);
		List<AnimalVo> aList = animalService.animalList(aPagingDto);
		model.addAttribute("aList", aList);
		model.addAttribute("aPagingDto", aPagingDto);
		return "admin/adminProtectList";
	}
			
	// 보호중인 동물 등록 페이지
	@RequestMapping(value="/protectAnimalForm", method=RequestMethod.GET)
	public String protectAnimalForm() throws Exception {
		return "admin/protectAnimalForm";
	}
			
	// 보호중인 동물 등록 내용 전송
	@RequestMapping(value="/insertAnimalRun", method=RequestMethod.POST)
	public String insertAnimalRun(AnimalVo animalVo, MultipartFile file, RedirectAttributes rttr) throws Exception {
		String orgFileName = file.getOriginalFilename();
		String filePath = AnimalFileUploadUtil.uploadFile("E:/upload", orgFileName, file.getBytes());
		animalVo.setA_picture(filePath);
		adminService.insertAnimalRun(animalVo);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/admin/adminProtectList";
	}
			
	// 보호중인 동물 상세 페이지
	@RequestMapping(value="/adminProtectCont", method=RequestMethod.GET)
	public String protectAnimalContent(A_PagingDto aPagingDto, Model model, int a_no) throws Exception {
		AnimalVo animalVo = adminService.selectAnimal(a_no);
		model.addAttribute("animalVo", animalVo);
		return "admin/adminProtectCont";
	}
			
	// 보호중인 동물 수정 페이지
	@RequestMapping(value="/adminProtectModiForm", method=RequestMethod.GET)
	public String adminProtectModiForm(Model model, int a_no) throws Exception {
		AnimalVo animalVo = adminService.selectAnimal(a_no);
		model.addAttribute("animalVo", animalVo);
		return "admin/adminProtectModiForm";
	}
					
	// 보호중인 동물 수정 정보 전송
	@RequestMapping(value="/adminProtectModiRun", method=RequestMethod.POST)
	public String adminProtectModiRun(AnimalVo animalVo, RedirectAttributes rttr) throws Exception {
		adminService.modifyAnimalRun(animalVo);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/admin/adminProtectList";
	}
			
	// 보호중인 동물 삭제 내용 전송
	@RequestMapping(value="/adminDeleteProtectRun", method=RequestMethod.GET)
	public String adminDeleteProtectRun(int a_no) throws Exception {
		adminService.deleteAnimalRun(a_no);
		return "redirect:/admin/adminProtectList";
	}
					
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		FileInputStream fis = new FileInputStream(fileName);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
		
	// 입양 신청 페이지(동물 목록)
	@RequestMapping(value="/adoptList", method=RequestMethod.GET)
	public String adminAdoptList(Model model, A_PagingDto aPagingDto) throws Exception {
		int count = adminService.getCount2(aPagingDto);
		aPagingDto.setCount(count);
		List<AdoptVo> adList = adoptService.adoptList(aPagingDto);
		model.addAttribute("adList", adList);
		model.addAttribute("aPagingDto", aPagingDto);
		return "admin/adminAdoptList";
	}
		
	// 입양 동물 등록 페이지
	@RequestMapping(value="/animalInsertForm", method=RequestMethod.GET)
	public String animalInsertForm() throws Exception {
		return "admin/animalInsertForm";
	}
			
	// 입양 동물 등록 정보 전송
	@RequestMapping(value="/animalInsertRun", method=RequestMethod.POST)
	public String animalInsertRun(AdoptVo adoptVo, MultipartFile file, RedirectAttributes rttr) throws Exception {
		String orgFileName = file.getOriginalFilename();
		String filePath = AnimalFileUploadUtil.uploadFile("E:/upload", orgFileName, file.getBytes());
		adoptVo.setAd_picture(filePath);
		adminService.animalInsertRun(adoptVo);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/admin/adoptList";
	}
		
	// 입양 동물 상세정보 페이지
	@RequestMapping(value="/adminAnimalCont", method=RequestMethod.GET)
	public String animalCont(A_PagingDto aPagingDto, Model model, int ad_no) throws Exception {
		AdoptVo adoptVo = adminService.animalCont(ad_no);
		//System.out.println("adoptVo" + adoptVo);
		model.addAttribute("adoptVo", adoptVo);
		return "admin/adminAnimalCont";
	}
		
	// 입양 동물 수정 페이지
	@RequestMapping(value="/animalModiForm", method=RequestMethod.GET)
	public String animalModiForm(Model model, int ad_no) throws Exception {
		AdoptVo adoptVo = adminService.animalCont(ad_no);
		model.addAttribute("adoptVo", adoptVo);
		return "admin/animalModiForm";
	}
			
	// 입양 동물 수정 정보 전송
	@RequestMapping(value="/animalModifyRun", method=RequestMethod.POST)
	public String animalModifyRun(AdoptVo adoptVo, RedirectAttributes rttr) throws Exception {
		adminService.animalModifyRun(adoptVo);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/admin/adoptList";
	}
			
	// 입양 동물 정보 삭제
	@RequestMapping(value="/animalDeleteRun", method=RequestMethod.GET)
	public String animalDeleteRun(int ad_no, RedirectAttributes rttr) throws Exception {
		adminService.animalDeleteRun(ad_no);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/admin/adoptList";
	}
	
	// 관리자 페이지 고객센터
	@RequestMapping(value = "/adminCustomerBoard", method = RequestMethod.GET)
	public String adminCustomerBoard(Model model,PagingDto pagingDto) throws Exception {
		int count = customerBoardService.getCount(pagingDto);
		pagingDto.setCount(count);
		List<CustomerBoardVo> list = customerBoardService.customerBoard(pagingDto); 
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "/admin/adminCustomerBoard";
	}
		
	// 고객센터 내용보기
	@RequestMapping(value = "/adminCustomerContent", method=RequestMethod.GET)
	public String adminCustomerContent(int cb_no, Model model) throws Exception {
		CustomerBoardVo customerBoardVo = customerBoardService.content(cb_no);
		model.addAttribute("customerBoardVo", customerBoardVo);
		return "admin/adminCustomerContent";
	}
		
	// 고객센터 답글달기
	@RequestMapping(value="/adminCustomerReplyForm", method=RequestMethod.GET)
	public String adminCustomerReplyForm(int cb_no,Model model) throws Exception { // 답글폼
		CustomerBoardVo customerBoardVo = customerBoardService.content(cb_no);
		customerBoardVo.setRe_group(cb_no);
		model.addAttribute("customerBoardVo", customerBoardVo);
		return "admin/adminCustomerReplyForm"; 
	}
		
	@RequestMapping(value="/adminCustomerReplyRun", method=RequestMethod.POST)
	public String adminCustomerReplyForm(CustomerBoardVo customerBoardVo) throws Exception { // 답글폼 -> 문의게시판
		customerBoardService.replyWriteRun(customerBoardVo);
		return "redirect:/admin/adminCustomerBoard";
	}
		
	// 고객센터 답글보기
	@RequestMapping(value="/adminCustomerReplyContent", method=RequestMethod.GET)
	public String adminCustomerReplyContent(int cb_no, Model model) throws Exception {
		CustomerBoardVo customerBoardVo = customerBoardService.content(cb_no);
		model.addAttribute("customerBoardVo", customerBoardVo);
		return "admin/adminCustomerReplyContent";
	}
		
	// 고객센터 글삭제
	@RequestMapping(value="/adminCustomerDeleteRun", method=RequestMethod.GET)
	public String adminCustomerDeleteRun(int cb_no) throws Exception { // 글삭제
		customerBoardService.deleteRun(cb_no);
		return "redirect:/admin/adminCustomerBoard";
	}
		
	// 동물게시판 리스트
	@RequestMapping(value="/adminNewsBoard", method=RequestMethod.GET)
	public String newsBoard(Model model, PagingDto pagingDto) throws Exception { // 동물게시판
		int count = newsBoardService.getCount(pagingDto);
		pagingDto.setCount(count);
		List<NewsBoardVo> list = newsBoardService.newsBoard(pagingDto); 
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "admin/adminNewsBoard";
	}
		
	// 동물게시판 글쓰기
	@RequestMapping(value="/adminNewsBoardWriteForm", method=RequestMethod.GET)
	public String adminNewsBoardWriteForm() throws Exception { // 글쓰기폼
		return "admin/adminNewsBoardWriteForm"; 
	}
		
	@RequestMapping(value="/adminNewsBoardWriteRun", method=RequestMethod.POST)
	public String adminNewsBoardWriteRun(NewsBoardVo newsBoardVo, MultipartFile file) throws Exception { // 글쓰기폼->자유게시판
		System.out.println("file "+ file);
		String orgFileName = file.getOriginalFilename();
		String filePath = AnimalFileUploadUtil.uploadFile("G:/upload", orgFileName, file.getBytes());
		newsBoardVo.setAb_picture(filePath);
		newsBoardService.writeRun(newsBoardVo);
		String name = newsBoardVo.getUser_id();
		System.out.println("newsBoardVo "+ newsBoardVo);
		System.out.println("name " + name);
		return "redirect:/admin/adminNewsBoard";
	}
		
	// 동물게시판 글삭제
	@RequestMapping(value="/adminNewsBoardDeleteRun", method=RequestMethod.GET)
	public String adminNewsBoardDeleteRun(int ab_no) throws Exception { // 글삭제
		newsBoardService.deleteRun(ab_no);
		return "redirect:/admin/adminNewsBoard";
	}
		
	// 동물게시판 글수정
	@RequestMapping(value="/adminNewsBoardModifyForm", method=RequestMethod.GET)
	public String modifyForm(int ab_no, Model model) throws Exception { // 수정폼
		NewsBoardVo newsBoardVo = newsBoardService.content(ab_no);
		model.addAttribute("newsBoardVo", newsBoardVo);
		return "admin/adminNewsBoardModifyForm"; 
	}
		
	@RequestMapping(value="/adminNewsBoardModifyRun", method=RequestMethod.POST)
	public String modifyRun(NewsBoardVo newsBoardVo) throws Exception { // 수정폼->동물게시판
		newsBoardService.modifyRun(newsBoardVo);
		return "redirect:/admin/adminNewsBoard";
	}
		
	// 동물게시판 상세보기
	@RequestMapping(value="/adminNewsBoardContent", method=RequestMethod.GET)
	public String adminNewsBoardContent(int ab_no, Model model) throws Exception {
		NewsBoardVo newsBoardVo = newsBoardService.content(ab_no);
		model.addAttribute("newsBoardVo", newsBoardVo);
		return "admin/adminNewsBoardContent";
	}
		
	// 관리자 페이지 자유게시판
	 @RequestMapping(value = "/adminFreeBoard", method = RequestMethod.GET)
	public String adminForeeBoard(Model model,PagingDto pagingDto) throws Exception {
		int count = boardService.getCount(pagingDto);
		pagingDto.setCount(count);
		String key = pagingDto.getKeyword();
		System.out.println("key: "+ key);
		List<BoardVo> list = boardService.freeBoard(pagingDto); 
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "/admin/adminFreeBoard";
	 }
	 
	 // 관리자 자유게시판 상세
	 @RequestMapping(value="/adminFreeBoardContent", method=RequestMethod.GET)
	 public String adminFreeBoardContent(int b_no, Model model) throws Exception {
	 	BoardVo boardVo = boardService.content(b_no);
	 	model.addAttribute("boardVo", boardVo);
	 	return "admin/adminFreeBoardContent";
	 }
	 	
	//관리자 페이지 자유게시판 게시글 삭제 (비동기)21-07-22
	@RequestMapping(value="/adminDeleteRun", method=RequestMethod.GET)
	@ResponseBody
	public String deleteRun(int b_no) throws Exception { // 글삭제
		boardService.commentDeleteRun(b_no);
		boardService.deleteRun(b_no);
		return "redirect:/admin/adminFreeBoard";
	}

	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws Exception {
		System.out.println("file :" + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename :" + originalFilename);
		String filePath = AnimalFileUploadUtil.uploadFile("G:/upload", originalFilename, file.getBytes());
		return filePath;
	}
}
