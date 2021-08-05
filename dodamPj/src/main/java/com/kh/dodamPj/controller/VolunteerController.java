package com.kh.dodamPj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dodamPj.service.MemberService;
import com.kh.dodamPj.service.VolunteerService;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;

@Controller
@RequestMapping(value="/volunteer")
public class VolunteerController {

	@Inject
	private VolunteerService volunteerService;
	@Inject
	private MemberService MemberService;
	
	@RequestMapping(value="/reservationForm", method=RequestMethod.GET)
	public String reservationForm() throws Exception {
		return "volunteer/reservation_form";
	}
	
	// 나의 예약 정보
	@RequestMapping(value="/myReservation", method=RequestMethod.GET)
	public String myReservation(HttpSession session, Model model) throws Exception {
		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		List<VolunteerVo> list = 
				volunteerService.myReservation(user_id);
		model.addAttribute("list", list);
		return "volunteer/my_reservation";
	}

	// 예약 목록
	@RequestMapping(value="/volunReservList", method=RequestMethod.GET)
	public String volunReservList(Model model, PagingDto pagingDto) throws Exception {
		int count = volunteerService.getCount(pagingDto);
		pagingDto.setCount(count);
		System.out.println("pagingDto:" + pagingDto);
		List<VolunteerVo> list = volunteerService.volunReservList(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		System.out.println("list : " + list);
		return "volunteer/reservation_status";	
	}
	
	// 봉사활동 예약
	@RequestMapping(value="/reservVolun", method=RequestMethod.POST)
	public String reservVolun(VolunteerVo volunteerVo, RedirectAttributes rttr,
			HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		volunteerVo.setUser_id(memberVo.getUser_id());
		volunteerService.reservVolun(volunteerVo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/volunteer/myReservation";
	} 
	
	// 날짜 시간 장소 중복체크 
	@RequestMapping(value="/checkDateAndTime", method=RequestMethod.GET)
	@ResponseBody
	public String checkDateAndTime(VolunteerVo volunteerVo, RedirectAttributes rttr) throws Exception {
		boolean result = volunteerService.checkDateAndTime(volunteerVo);
		return String.valueOf(result);
	}
	
	// 봉사활동 예약 취소 
	@RequestMapping(value="/cancelReserv", method=RequestMethod.GET)
	public String cancelReserv(int v_no, HttpSession session,
			RedirectAttributes rttr) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		boolean result = volunteerService.cancelReserv(v_no, user_id);
		rttr.addFlashAttribute("msgCancel", String.valueOf(result));
		System.out.println(result);
		return "redirect:/volunteer/myReservation";
	}
	

}
