package com.kh.dodamPj.serviceImpl;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dodamPj.dao.VolunteerDao;
import com.kh.dodamPj.service.VolunteerService;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;

@Service
public class VolunteerServiceImpl implements VolunteerService {

	@Inject
	private VolunteerDao volunteerDao;

	@Override
	public List<VolunteerVo> volunReservList(PagingDto pagingDto) {
		List<VolunteerVo> list = volunteerDao.volunReservList(pagingDto);
		return list;
	}

	@Override
	public void reservVolun(VolunteerVo volunteerVo) {
		volunteerDao.reservVolun(volunteerVo);
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = volunteerDao.getCount(pagingDto);
		return count;
	}

	@Override
	public boolean checkDateAndTime(VolunteerVo volunteerVo) {
		System.out.println("checkService...");
		return volunteerDao.checkDateAndTime(volunteerVo);
	}

	@Override
	public void resultInsert(VolunteerVo volunteer) {
		volunteerDao.resultInsert(volunteer);		
	}

	@Override
	public List<VolunteerVo> myReservation(String user_id) {
		List<VolunteerVo> list = volunteerDao.myReservation(user_id);
		return list;
	}

	@Override
	public boolean cancelReserv(int v_no, String user_id) {
		boolean result = volunteerDao.cancelReserv(v_no, user_id);
		return result;
	}

	@Override
	public void modifyReserv(VolunteerVo volunteerVo) {
		volunteerDao.modifyReserv(volunteerVo);
		
	}

//	@Override
//	public boolean checkDateAndTime(String v_date, String v_time) {
//		return volunteerDao.checkDateAndTime(v_date, v_time, String v_place);
//	}

}