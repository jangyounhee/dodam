package com.kh.dodamPj.dao;

import java.util.List;

import com.kh.dodamPj.vo.CustomerBoardVo;
import com.kh.dodamPj.vo.PagingDto;

public interface CustomerBoardDao {
	// 문의게시판
	public List<CustomerBoardVo> customerBoard(PagingDto pagingDto);
	// 페이징
	public int getCount(PagingDto pagingDto);
	// 글쓰기
	public void insertArticle(CustomerBoardVo customerBoardVo);
	// 조회
	public CustomerBoardVo selectByBno(int cb_no);
	// 수정
	public void updateArticle(CustomerBoardVo customerBoardVo);
	// 삭제
	public void deleteArticle(int cb_no);
	// 답글쓰기(update)
	public void updateReply(CustomerBoardVo customerBoardVo);
	// 조회수 증가
	public void updateViewCnt(int cb_no);
	// 답글 쓰기
	public void insertReply(CustomerBoardVo customerBoardVo);
}
