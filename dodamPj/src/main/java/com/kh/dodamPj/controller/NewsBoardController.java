package com.kh.dodamPj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dodamPj.service.NewsBoardService;
import com.kh.dodamPj.vo.BoardVo;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.NewsBoardVo;

@Controller
@RequestMapping(value="/newsboard")
public class NewsBoardController {
	
	@Inject
	private NewsBoardService newsBoardSerivce;
	
	@RequestMapping(value="/newsBoard", method=RequestMethod.GET)
	public String newsBoard(Model model, PagingDto pagingDto) throws Exception { // 동물게시판
		int count = newsBoardSerivce.getCount(pagingDto);
		pagingDto.setCount(count);
		List<NewsBoardVo> list = newsBoardSerivce.newsBoard(pagingDto); 
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "newsboard/newsBoard";
	}
	
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String content(int ab_no, Model model) throws Exception {
		NewsBoardVo newsBoardVo = newsBoardSerivce.content(ab_no);
		model.addAttribute("newsBoardVo", newsBoardVo);
		return "newsboard/content";
	}
}
