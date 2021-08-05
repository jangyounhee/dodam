package com.kh.dodamPj.dao;

import java.util.List;

import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;

public interface VolunteerDao {

	public List<VolunteerVo> volunReservList(PagingDto pagingDto);
	public void reservVolun(VolunteerVo volunteerVo);
	public int getCount(PagingDto pagingDto);
	public boolean checkDateAndTime(VolunteerVo volunteerVo);
	public List<VolunteerVo> myReservation(String user_id);
	public void resultInsert(VolunteerVo volunteer);
	public boolean cancelReserv(int v_no, String user_id);
	public void modifyReserv(VolunteerVo volunteerVo);
}
