
package com.kh.dodamPj.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dodamPj.service.BoardService;
import com.kh.dodamPj.util.AnimalFileUploadUtil;
import com.kh.dodamPj.vo.BoardVo;
import com.kh.dodamPj.vo.PagingDto;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Inject
	private BoardService boardSerivce;
	
	@RequestMapping(value="/freeBoard", method=RequestMethod.GET)
	public String freeBoard(Model model, PagingDto pagingDto) throws Exception { // 자유게시판
		int count = boardSerivce.getCount(pagingDto);
		pagingDto.setCount(count);
		List<BoardVo> list = boardSerivce.freeBoard(pagingDto); 
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "board/freeBoard";
	}
	
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public String writeForm() throws Exception { // 글쓰기폼
		return "board/writeForm"; 
	}
	
	@RequestMapping(value="/writeRun", method=RequestMethod.POST)
	public String writeRun(BoardVo boardVo, MultipartFile file) throws Exception { // 글쓰기폼->자유게시판
		String orgFileName = file.getOriginalFilename();
		String filePath = AnimalFileUploadUtil.uploadFile("G:/upload", orgFileName, file.getBytes());
		boardVo.setB_picture(filePath);
		boardSerivce.writeRun(boardVo);
		String name = boardVo.getUser_id();
		System.out.println("boardVo "+boardVo);
		System.out.println("name "+name);
		return "redirect:/board/freeBoard";
	}
	
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String content(int b_no, Model model) throws Exception {
		BoardVo boardVo = boardSerivce.content(b_no);
		model.addAttribute("boardVo", boardVo);
		return "board/content";
	}
	
	@RequestMapping(value="/modifyForm", method=RequestMethod.GET)
	public String modifyForm(int b_no, Model model, MultipartFile file) throws Exception { // 수정폼
		BoardVo boardVo = boardSerivce.content(b_no);
		model.addAttribute("boardVo", boardVo);
		return "board/modifyForm"; 
	}
	
	@RequestMapping(value="/modifyRun", method=RequestMethod.POST)
	public String modifuRun(BoardVo boardVo, MultipartFile file) throws Exception { // 수정폼->자유게시판
		String orgFileName = file.getOriginalFilename();
		String filePath = AnimalFileUploadUtil.uploadFile("G:/upload", orgFileName, file.getBytes());
		boardVo.setB_picture(filePath);
		boardSerivce.modifyRun(boardVo);
		System.out.println("boardVo" + boardVo);
		return "redirect:/board/freeBoard";
	}
	
	@RequestMapping(value="/deleteRun", method=RequestMethod.GET)
	public String deleteRun(int b_no) throws Exception { // 글삭제
		boardSerivce.commentDeleteRun(b_no);
		boardSerivce.deleteRun(b_no);
		return "redirect:/board/freeBoard";
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
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		System.out.println("file :" + fileName);
		FileInputStream fis = new FileInputStream(fileName);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
}
