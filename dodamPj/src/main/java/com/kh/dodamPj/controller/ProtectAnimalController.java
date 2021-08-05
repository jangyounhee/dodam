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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dodamPj.service.AnimalService;
import com.kh.dodamPj.util.AnimalFileUploadUtil;
import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AnimalVo;

@Controller
@RequestMapping(value="/protect")
public class ProtectAnimalController {
	
	@Inject
	private AnimalService animalService;
	
	// 보호중인 동물 페이지
	@RequestMapping(value="/protectAnimal", method=RequestMethod.GET)
	public String protectAnimal(Model model, A_PagingDto aPagingDto) throws Exception {
		int count = animalService.getCount(aPagingDto);
		aPagingDto.setCount(count);
		List<AnimalVo> aList = animalService.animalList(aPagingDto);
		model.addAttribute("aList", aList);
		model.addAttribute("aPagingDto", aPagingDto);
		return "protect/protectAnimal";
	}
		
	// 보호중인 동물 상세 페이지
	@RequestMapping(value="/protectAnimalCont", method=RequestMethod.GET)
	public String protentAnimalContent(A_PagingDto aPagingDto, Model model, int a_no) throws Exception {
		AnimalVo animalVo = animalService.selectAnimal(a_no);
		model.addAttribute("animalVo", animalVo);
		return "protect/protectAnimalCont";
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
