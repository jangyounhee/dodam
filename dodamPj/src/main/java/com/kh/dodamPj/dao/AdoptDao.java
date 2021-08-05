package com.kh.dodamPj.dao;

import java.util.List;

import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AdoptVo;
import com.kh.dodamPj.vo.ApplyUserVo;
import com.kh.dodamPj.vo.PagingDto;

public interface AdoptDao {
	
	// 입양 동물 목록
	public List<AdoptVo> adoptList(A_PagingDto aPagingDto);
	// 입양 동물 조회
	public AdoptVo selectOnePet(int ad_no);
	// 입양 신청 목록
	public List<ApplyUserVo> applyList(PagingDto pagingDto);
	// 입양 신청 등록
	public void insertApply(ApplyUserVo applyUserVo);
	// 입양 상담 시간 중복 확인
	public boolean checkDupTime(String adopt_date, String adopt_time);
	// 입양 신청 상세
	public ApplyUserVo selectApply(int au_no);
	// 입양 신청 수정
	public void modifyApply(ApplyUserVo applyUserVo);
	// 입양 신청 삭제
	public void deleteApply(int au_no);
	// 글 갯수얻기(동물목록)
	public int getCount(A_PagingDto aPagingDto);
	// 글 갯수 얻기(예약 신청)
	public int getCountApply(PagingDto pagingDto);
}
