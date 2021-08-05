package com.kh.dodamPj.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
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

import com.kh.dodamPj.service.BoardService;
import com.kh.dodamPj.service.NoticeService;

import com.kh.dodamPj.util.AnimalFileUploadUtil;

import com.kh.dodamPj.util.MyFileUploadUtil;
import com.kh.dodamPj.vo.NoticeVo;
import com.kh.dodamPj.vo.PagingDto;

@Controller
@RequestMapping(value="notice")
public class NoticeController {
	
	private static final String RE = "redirect:";
	
	@Inject
	private NoticeService noticeService;
	
	//공지사항 리스트
	//페이징 처리 완료 함 // 검색 기능 추가 21-07-14
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
		return "/notice/noticeList";
	}
	
	// 오시는길 페이지 이동
	@RequestMapping(value="/map", method=RequestMethod.GET)
	public String map() throws Exception {
		return "/notice/map";
	}

	// 보호절차 페이지 이동
	@RequestMapping(value="/procedure",method=RequestMethod.GET)
	public String procedure() throws Exception{
		return "/notice/procedure";	
	}
	
	
	//공지사항 작성 폼으로 이동
	@RequestMapping(value="/noticeWriteForm",method=RequestMethod.GET)
	public String noticeWriteForm() throws Exception{
		
		return "/notice/noticeWriteForm";
		
	}
	
	//공지사항 작성 처리
		@RequestMapping(value="/noticeModifyForm",method=RequestMethod.GET)
		public String noticeModifyForm(int n_no, Model model) throws Exception{
			NoticeVo noticeVo =noticeService.content(n_no);
			System.out.println("content noticeVo: " +noticeVo);
			System.out.println(n_no);
			model.addAttribute("noticeVo", noticeVo);
			return "/notice/noticeModifyForm";
			
		}
	//공지사항 작성 처리
	@RequestMapping(value="/noticeWriteRun",method=RequestMethod.POST)
	public String noticeWriteRun(NoticeVo noticeVo,MultipartFile file, RedirectAttributes rttr,HttpSession session) throws Exception{
		String orgFileName = file.getOriginalFilename();
		String filePath = AnimalFileUploadUtil.uploadFile("E:/upload", orgFileName, file.getBytes());
		System.out.println("noticeVo: "+noticeVo);
		noticeVo.setN_pic(filePath);
		noticeService.writeRun(noticeVo);
		rttr.addFlashAttribute("msg", "success");
		return RE+"/admin/adminPage";
		
	}
	//공지사항 수정 처리
	@RequestMapping(value="/noticeModifyRun",method=RequestMethod.POST)
	public String noticeModifyRun(NoticeVo noticeVo, RedirectAttributes rttr,HttpSession session) throws Exception{
		System.out.println("noticeVo: "+noticeVo);
		noticeService.modifyRun(noticeVo);
		rttr.addFlashAttribute("msg", "success");
		return RE+"/notice/noticeModify";
		
	}
	//공지 상세보기
	@RequestMapping(value="/content",method=RequestMethod.GET)
	public String content(int n_no, Model model) throws Exception{
		NoticeVo noticeVo =noticeService.content(n_no);

		String file = noticeService.selectFile(n_no);
		noticeVo.setN_filepath(file);
		String filepath = noticeVo.getN_filepath();
		System.out.println("fileName String: "+filepath);
		System.out.println("content noticeVo: " +noticeVo);
		System.out.println(n_no);
		model.addAttribute("noticeVo", noticeVo);
		return "/notice/notice_content";
	}
	
	//공지사항 삭제
	@RequestMapping(value="/noticeDeleteRun", method=RequestMethod.GET)
	public String deleteRun(int n_no, RedirectAttributes rttr) throws Exception {
		noticeService.deleteRun(n_no);
		rttr.addFlashAttribute("msgDelete", "success");
		return RE+"/notice/noticeModify";
	}

	//첨부파일 업로드 비동기 2012.07.13
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST,
			produces="application/text;charset=utf-8")
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws Exception {
//		System.out.println("file:" + file);
		String originalFilename = file.getOriginalFilename();
//		System.out.println("orinalFilename:" + originalFilename);
		String filePath = MyFileUploadUtil.uploadFile("D:/upload", originalFilename, file.getBytes());
		return filePath;
	}

	
	// 썸네일 이미지 요청 + 공지사항 자세히 눌렀을떄 해당 첨부파일 로딩 2012.07.13
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		try {
			FileInputStream fis = new FileInputStream(fileName);
			byte[] bytes = IOUtils.toByteArray(fis);
			fis.close();
			return bytes;
		} catch (FileNotFoundException e) {
			System.out.println("이미지 요청 에러");
			return null;
		}

	}
	
	// 첨부파일 삭제 2012.07.13
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String fileName) throws Exception {
		MyFileUploadUtil.deleteFile(fileName);
		return "success";
	}

}
