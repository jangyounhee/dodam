package com.kh.dodamPj.dao;

import java.util.List;

import com.kh.dodamPj.vo.NoticeVo;
import com.kh.dodamPj.vo.PagingDto;

public interface NoticeDao {

	// 공지 등록
	public void insertArticle(NoticeVo noticeVo);
	// 글조회
	public NoticeVo selectByBno(int n_no);
	// 글수정
	public void updateArticle(NoticeVo noticeVo);
	// 글삭제
	public void deleteArticle(int n_no);
	// 글 리스트
	public List<NoticeVo> listAll(PagingDto pagingDto);
	// 글갯수
	public int getCount(PagingDto pagingDto);
	// 첨부파일 쓰기
	public void insertAttach(NoticeVo noticeVo);
	// nextval 얻기
	public int getNextVal();
	
	public String selectFile(int n_no);

			
}
