package com.kh.dodamPj.dao;

import java.util.List;

import com.kh.dodamPj.vo.BoardVo;
import com.kh.dodamPj.vo.PagingDto;

public interface BoardDao {
	// 글쓰기
	public void insertArticle(BoardVo boardVo);
	// 조회
	public BoardVo selectByBno(int b_no);
	// 수정
	public void updateArticle(BoardVo boardVo);
	// 삭제
	public void deleteArticle(int b_no);
	// 자유게시판
	public List<BoardVo> freeBoard(PagingDto pagingDto);
	// 페이징
	public int getCount(PagingDto pagingDto);
	// 댓글수 변경
	public void updateCommentCnt(int b_no, int count);
	// 조회수 증가
	public void updateViewCnt(int b_no);
	
	// 게시글 삭제 시 댓글 삭제
	public void commentDeleteArticle(int b_no);

	// 동물게시판 댓글수 변경
	public void animalUpdateCommentCnt(int ab_no, int count);
}
