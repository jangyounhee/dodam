package com.kh.dodamPj.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dodamPj.dao.VolunteerDao;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;

@Repository
public class VolunteerDaoImpl implements VolunteerDao {

	private static final String NAMESPACE = "com.kh.dodamPj.volunteer.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<VolunteerVo> volunReservList(PagingDto pagingDto) {
		List<VolunteerVo> list = 
				sqlSession.selectList(NAMESPACE + "volunReservList", pagingDto);
		return list;
	}

	@Override
	public void reservVolun(VolunteerVo volunteerVo) {
		sqlSession.insert(NAMESPACE + "reservVolun", volunteerVo);
		
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}

	@Override
	public boolean checkDateAndTime(VolunteerVo volunteerVo) {
		int count = sqlSession.selectOne(NAMESPACE + "checkDateAndTime", volunteerVo);
		System.out.println("count : " + count);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<VolunteerVo> myReservation(String user_id) {
		List<VolunteerVo> list = sqlSession.selectList(NAMESPACE + "myReservation", user_id);
		return list;
	}

	@Override
	public void resultInsert(VolunteerVo volunteer) {
		sqlSession.update(NAMESPACE+"resultUpdate", volunteer);
		
	}


	@Override
	public boolean cancelReserv(int v_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("v_no", v_no);
		int count = sqlSession.delete(NAMESPACE + "cancelReserv", map);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void modifyReserv(VolunteerVo volunteerVo) {
		sqlSession.update(NAMESPACE + "updateReserv", volunteerVo);
	}

}
