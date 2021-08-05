package com.kh.dodamPj.service;

import java.util.List;

import com.kh.dodamPj.vo.NoticeVo;
import com.kh.dodamPj.vo.PagingDto;

public interface NoticeService {
//	공지사항 리스트
	public List<NoticeVo> listAll(PagingDto pagingDto);
//	공지 쓰기 (관리자 로그인 했을때만 가능) 2021/07/13 - 첨부파일 업로드 가능하게 만듦
	public void writeRun(NoticeVo noticeVo);
//	공지사항 자세히
	public NoticeVo content(int n_no);
//	공지 수정
	public void modifyRun(NoticeVo noticeVo);
//	공지 삭제
	public void deleteRun(int n_no);

	//공지 리스트 페이징 할때 쓸 전체 리스트 갯수
	public int getCount(PagingDto pagingDto);
	//공지 사항 자세히 눌렀을때 첨부파일도 같이 로딩
	public String selectFile(int n_no);
}
