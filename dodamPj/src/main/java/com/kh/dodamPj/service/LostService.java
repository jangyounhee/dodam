package com.kh.dodamPj.service;

import java.util.List;

import com.kh.dodamPj.vo.LostVo;
import com.kh.dodamPj.vo.PagingDto;

public interface LostService {

	// 목록
	public List<LostVo> reportList(PagingDto pagingDto);
	// 신고서 작성
	public void reportRun(LostVo lostVo);
	// 신고서 상세
	public LostVo reportContent(int b_no);
	// 신고서 수정
	public void reportModifyRun(LostVo lostVo);
	// 신고서 삭제
	public void reportDeleteRun(int b_no);
	// 글갯수 체크
	public int getCount(PagingDto pagingDto);
	// 첨부파일 관련
	public String selectFile(int b_no);
}
