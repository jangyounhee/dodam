package com.kh.dodamPj.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dodamPj.dao.AdoptDao;
import com.kh.dodamPj.service.AdoptService;
import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AdoptVo;
import com.kh.dodamPj.vo.ApplyUserVo;
import com.kh.dodamPj.vo.PagingDto;

@Service
public class AdoptServiceImpl implements AdoptService {

	@Inject
	private AdoptDao adoptDao;
	
	// 입양 동물 목록
	@Override
	public List<AdoptVo> adoptList(A_PagingDto aPagingDto) {
		List<AdoptVo> adList = adoptDao.adoptList(aPagingDto);
		return adList;
	}

	// 입양 동물 상세 정보
	@Override
	public AdoptVo animalCont(int ad_no) {
		AdoptVo adoptVo = adoptDao.selectOnePet(ad_no);
		return adoptVo;
	}
	
	// 입양 예약 신청서 작성
	@Override
	public void insertApplyRun(ApplyUserVo applyUserVo) {
		adoptDao.insertApply(applyUserVo);		
	}
	
	// 입양 예약 신청시 예약 시간 중복 확인
	@Override
	public boolean checkDupTime(String adopt_date, String adopt_time) {
		return adoptDao.checkDupTime(adopt_date, adopt_time);
	}

	// 입양 신청 목록
	@Override
	public List<ApplyUserVo> applyList(PagingDto pagingDto) {
		List<ApplyUserVo> auList = adoptDao.applyList(pagingDto);
		return auList;
	}

	// 입양 신청 상세
	@Override
	public ApplyUserVo selectApply(int au_no) {
		ApplyUserVo applyUserVo = adoptDao.selectApply(au_no);
		return applyUserVo;
	}
	
	// 입양 신청서 수정
	@Override
	public void modifyApplyRun(ApplyUserVo applyUserVo) {
		adoptDao.modifyApply(applyUserVo);		
	}

	// 입양 신청서 삭제
	@Override
	public void deleteApplyRun(int au_no) {
		adoptDao.deleteApply(au_no);		
	}
	
	// 글갯수얻기(동물목록)
	@Override
	public int getCount(A_PagingDto aPagingDto) {
		int count = adoptDao.getCount(aPagingDto);
		return count;
	}
	
	// 글갯수얻기(신청서목록)
	@Override
	public int getCountApply(PagingDto pagingDto) {
		int countApply = adoptDao.getCountApply(pagingDto);
		return countApply;
	}

	
}
