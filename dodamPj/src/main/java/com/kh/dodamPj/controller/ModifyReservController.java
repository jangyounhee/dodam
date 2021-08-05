package com.kh.dodamPj.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.dodamPj.service.VolunteerService;
import com.kh.dodamPj.vo.VolunteerVo;

@RestController
@RequestMapping("/volunteer")
public class ModifyReservController {

	@Inject
	private VolunteerService volunteerService;
	

	// 예약 정보 변경
	@RequestMapping(value="/modifyReserv", method=RequestMethod.POST)
	public String modifyReserv(@RequestBody VolunteerVo volunteerVo) throws Exception {
		volunteerService.modifyReserv(volunteerVo);
		return "success";
	}
	
}
