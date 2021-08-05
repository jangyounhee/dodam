package com.kh.dodamPj.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dodamPj.service.AnimalService;
import com.kh.dodamPj.service.LostService;
import com.kh.dodamPj.util.AnimalFileUploadUtil;
import com.kh.dodamPj.vo.AnimalVo;
import com.kh.dodamPj.vo.LostVo;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.PagingDto;

@Controller
@RequestMapping(value="/lostAnimal")
public class LostAnimalController {
	
	@Inject
	private LostService lostService;
	
	// 습득시 안내 페이지
	@RequestMapping(value="/infoGetAnimal", method=RequestMethod.GET)
	public String infoGetAnimal() throws Exception {
		return "lostAnimal/infoGetAnimal";
	}
	
	// 신고 목록 관련
	@RequestMapping(value="/reportList", method=RequestMethod.GET)
	public String reportList(Model model, PagingDto pagingDto) throws Exception {
		int count = lostService.getCount(pagingDto);
		pagingDto.setCount(count);
		List<LostVo> list = lostService.reportList(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "lostAnimal/reportAnimal";
	}
	
	// 신고서 작성 폼
	@RequestMapping(value="/reportAnimalForm", method=RequestMethod.GET)
	public String reportAnimalForm() throws Exception {
		return "lostAnimal/reportAnimalForm";
	}
	
	// 신고서 작성 내용 전송
	@RequestMapping(value="/reportRun", method=RequestMethod.POST)
	public String reportRun(LostVo lostVo, MultipartFile file, RedirectAttributes rttr, HttpSession session) throws Exception {
		String orgFileName = file.getOriginalFilename();
		String filePath = AnimalFileUploadUtil.uploadFile("E:/upload", orgFileName, file.getBytes());
		lostVo.setP_picture(filePath);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		lostVo.setUser_id(memberVo.getUser_id());
		lostService.reportRun(lostVo);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/lostAnimal/reportList";
	}
	
	// 신고서 상세 내용 확인
	@RequestMapping(value="/reportContent", method=RequestMethod.GET)
	public String reportContent(PagingDto pagingDto, Model model, int b_no, HttpSession session) throws Exception {
		LostVo lostVo = lostService.reportContent(b_no);
		model.addAttribute("lostVo", lostVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		return "lostAnimal/reportContent";
	}
	
	// 신고서 수정 내용 전송
	@RequestMapping(value="/reportModifyRun", method=RequestMethod.POST)
	public String reportModifyRun(LostVo lostVo, RedirectAttributes rttr) throws Exception {
		lostService.reportModifyRun(lostVo);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/lostAnimal/reportContent?b_no=" + lostVo.getB_no();
	}
	
	// 신고서 삭제 내용 전송
	@RequestMapping(value="/reportDeleteRun", method=RequestMethod.GET)
	public String reportDeleteRun(int b_no) throws Exception {
		lostService.reportDeleteRun(b_no);
		return "redirect:/lostAnimal/reportList";
	}

	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws Exception {
		System.out.println("file :" + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename :" + originalFilename);
		String filePath = AnimalFileUploadUtil.uploadFile("E:/upload", originalFilename, file.getBytes());
		return filePath;
	}
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		FileInputStream fis = new FileInputStream(fileName);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
	
}
