package com.kh.dodamPj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dodamPj.service.CustomerBoardService;
import com.kh.dodamPj.vo.CustomerBoardVo;
import com.kh.dodamPj.vo.PagingDto;

@Controller
@RequestMapping(value="/customerboard")
public class CustomerContorller {
	
	@Inject
	private CustomerBoardService customerBoardService;
	
	@RequestMapping(value="/customerBoard", method=RequestMethod.GET)
	public String newsBoard(Model model, PagingDto pagingDto, CustomerBoardVo customerBoardVo) throws Exception { // 문의게시판
		int count = customerBoardService.getCount(pagingDto);
		pagingDto.setCount(count);
		List<CustomerBoardVo> list = customerBoardService.customerBoard(pagingDto); 
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "customerboard/customerBoard";
	}
	
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public String writeForm() throws Exception { // 글쓰기폼
		return "customerboard/writeForm"; 
	}
	
	@RequestMapping(value="/writeRun", method=RequestMethod.POST)
	public String writeRun(CustomerBoardVo customerBoardVo) throws Exception { // 글쓰기폼 -> 문의게시판
		customerBoardService.writeRun(customerBoardVo);
		String name = customerBoardVo.getUser_id();
		System.out.println("customerBoardVo "+ customerBoardVo);
		System.out.println("name "+name);
		return "redirect:/customerboard/customerBoard";
	}
	
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String content(int cb_no, Model model) throws Exception {
		CustomerBoardVo customerBoardVo = customerBoardService.content(cb_no);
		model.addAttribute("customerBoardVo", customerBoardVo);
		return "customerboard/content";
	}
	
	@RequestMapping(value="/modifyForm", method=RequestMethod.GET)
	public String modifyForm(int cb_no, Model model) throws Exception { // 수정폼
		CustomerBoardVo customerBoardVo = customerBoardService.content(cb_no);
		model.addAttribute("customerBoardVo", customerBoardVo);
		return "customerboard/modifyForm"; 
	}
	
	@RequestMapping(value="/modifyRun", method=RequestMethod.POST)
	public String modifyRun(CustomerBoardVo customerBoardVo) throws Exception { // 수정폼->자유게시판
		customerBoardService.modifyRun(customerBoardVo);
		return "redirect:/customerboard/customerBoard";
	}
	
	@RequestMapping(value="/deleteRun", method=RequestMethod.GET)
	public String deleteRun(int cb_no) throws Exception { // 글삭제
		customerBoardService.deleteRun(cb_no);
		return "redirect:/customerboard/customerBoard";
	}
	
	// 고객센터 답글보기
	@RequestMapping(value="/replyContent", method=RequestMethod.GET)
	public String adminCustomerReplyContent(int cb_no, Model model) throws Exception {
		CustomerBoardVo customerBoardVo = customerBoardService.content(cb_no);
		model.addAttribute("customerBoardVo", customerBoardVo);
		return "customerboard/replyContent";
	}
}
