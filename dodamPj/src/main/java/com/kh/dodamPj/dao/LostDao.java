package com.kh.dodamPj.dao;

import java.util.List;

import com.kh.dodamPj.vo.LostVo;
import com.kh.dodamPj.vo.PagingDto;

public interface LostDao {
	
	// 신고된 동물 목록
	public List<LostVo> reportList(PagingDto pagingDto);
	// 신고서 작성
	public void insertReport(LostVo lostVo);
	// 신고서 조회
	public LostVo reportContent(int b_no);
	// 신고서 수정
	public void updateReport(LostVo lostVo);
	// 신고서 삭제
	public void deleteReport(int b_no);
	// 조회수 증가
	public void updateViewcnt(int b_no);
	// 첨부파일
	public void insertAttach(LostVo lostVo);
	// 글갯수
	public int getCount(PagingDto pagingDto);
	// nextval 얻기
	public int getNextVal();
	// 첨부파일관련
	public String selectFile(int b_no);
}
