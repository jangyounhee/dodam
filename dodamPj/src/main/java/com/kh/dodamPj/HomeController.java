package com.kh.dodamPj;

import java.io.FileInputStream;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.dodamPj.service.AdminService;
import com.kh.dodamPj.service.BoardService;
import com.kh.dodamPj.service.MemberService;
import com.kh.dodamPj.service.NoticeService;
import com.kh.dodamPj.util.AnimalFileUploadUtil;
import com.kh.dodamPj.vo.BoardVo;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.NoticeVo;
import com.kh.dodamPj.vo.PagingDto;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private BoardService boardService;
	@Inject
	private NoticeService noticeService;
	@Inject
	private AdminService adminService;
	@Inject
	private MemberService memberService;
	@Autowired // 패스워드 security용
//	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, PagingDto pagingDto) {
		List<BoardVo> list = boardService.freeBoard(pagingDto);
		List<NoticeVo> noticeList = noticeService.listAll(pagingDto);
		model.addAttribute("list", list); // 자유 게시판 리스트
		model.addAttribute("noticeList", noticeList); // 공지사항 리스트
		return "/main/main";
	}

	@RequestMapping(value = "/funny", method = RequestMethod.GET)
	public String funny() {
		return "/user/funny";
	}

	@RequestMapping(value = "/maps/map", method = RequestMethod.GET)
	public String map() {
		return "/user/map";
	}

	// 로그인 처리 (관리자 로그인 포함)
	@RequestMapping(value = "/memberLoginRun", method = RequestMethod.POST)
	public String loginRun(String user_id, String user_pw, RedirectAttributes rttr, HttpSession session)
			throws Exception {
		MemberVo memberVo = memberService.login(user_id, user_pw);
//			암호화 된 패스워드 == 입력한 패스워드 일치 하는지 함수 사용으로 확인
//		boolean chkPw = passwordEncoder.matches(user_pw, memberVo.getUser_pw());// 암호화--21.07.16
		rttr.addFlashAttribute("msgLogin", "success");
//			System.out.println("vo 비번: "+ chkPw);
//			System.out.println("id "+user_id);
//			System.out.println("pw "+user_pw);
		String msg = null;
		String page = null;
		// Vo에 정보 확인후 널값이 아니면 메인 화면으로 이동
		if (memberVo != null) { //&& chkPw == true
			msg = "success";

			int level = memberVo.getAuth_level(); // memberVo에 관리자 레벨 0 , 1 확인용
			// 관리자 레벨이 1이면 관리자 페이지로 이동
			if (level == 1) {
				// 인터 셉트 걸릴수도 있으니 걸리면 서블릿 컨텍스트에 path 확인해보고 리디렉션횟수 많다고 뜨면 매핑 이름 변경
				session.setAttribute("loginVo", memberVo);
				page = "redirect:/admin/adminPage";
			} else {
				session.setAttribute("loginVo", memberVo);
				page = "redirect:/main/main";
			}
		} else {
			// Vo에 로그인 정보가 없으면 로그인 페이지로 리디렉션
			msg = "fail";
			page = "redirect:/user/memberLogin";
		}
		rttr.addFlashAttribute("msg", msg);
		return page; // 로그인이 되면 home.jsp로 리다이렉트
	}
		
}