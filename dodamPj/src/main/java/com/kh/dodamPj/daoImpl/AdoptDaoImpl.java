package com.kh.dodamPj.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dodamPj.dao.AdoptDao;
import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AdoptVo;
import com.kh.dodamPj.vo.ApplyUserVo;
import com.kh.dodamPj.vo.PagingDto;

@Repository
public class AdoptDaoImpl implements AdoptDao {

	private final String NAMESPACE = "com.kh.dodamPj.adopt.";
	
	@Inject
	private SqlSession sqlSession;

	// 입양 동물 목록
	@Override
	public List<AdoptVo> adoptList(A_PagingDto aPagingDto) {
		List<AdoptVo> adList = sqlSession.selectList(NAMESPACE + "adoptList", aPagingDto);
		return adList;
	}

	// 입양 동물 조회
	@Override
	public AdoptVo selectOnePet(int ad_no) {
		AdoptVo adoptVo = sqlSession.selectOne(NAMESPACE + "selectOnePet", ad_no);
		return adoptVo;
	}

	// 입양 신청자 입양 신청 등록
	@Override
	public void insertApply(ApplyUserVo applyUserVo) {
		sqlSession.insert(NAMESPACE + "insertApply", applyUserVo);
	}
	
	// 입양 상담 시간 예약 중복 확인
	@Override
	public boolean checkDupTime(String adopt_date, String adopt_time) {
		Map<String, String> map = new HashMap<>();
		map.put("adopt_date", adopt_date);
		map.put("adopt_time", adopt_time);
		int count = sqlSession.selectOne(NAMESPACE + "checkDupTime", map);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	// 입양 신청 목록
	@Override
	public List<ApplyUserVo> applyList(PagingDto pagingDto) {
		List<ApplyUserVo> auList = sqlSession.selectList(NAMESPACE + "applyList", pagingDto);
		return auList;
	}
	
	// 입양 신청 상세
	@Override
	public ApplyUserVo selectApply(int au_no) {
		ApplyUserVo applyUserVo = sqlSession.selectOne(NAMESPACE + "selectApply", au_no);
		return applyUserVo;
	}
	
	// 입양 신청서 수정
	@Override
	public void modifyApply(ApplyUserVo applyUserVo) {
		sqlSession.update(NAMESPACE + "updateApply", applyUserVo);
	}
	
	// 입양 신청서 삭제
	@Override
	public void deleteApply(int au_no) {
		sqlSession.delete(NAMESPACE + "deleteApply", au_no);
	}

	// 글갯수(동물목록)
	@Override
	public int getCount(A_PagingDto aPagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", aPagingDto);
		return count;
	}
	
	// 글갯수(신청서 목록)
	@Override
	public int getCountApply(PagingDto pagingDto) {
		int countApply = sqlSession.selectOne(NAMESPACE + "getCountApply", pagingDto);
		return countApply;
	}


}
