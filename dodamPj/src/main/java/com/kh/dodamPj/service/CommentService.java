package com.kh.dodamPj.service;

import java.util.List;

import com.kh.dodamPj.vo.CommentVo;

public interface CommentService {
	public List<CommentVo> getCommentList(int b_no);
	public void insertComment(CommentVo commentVo);
	public void deleteComment(int c_no, int b_no);
	public void updateComment(CommentVo commentVo);
	
	// 동물게시판 목록, 댓글쓰기, 삭제
	public List<CommentVo> animalGetCommentList(int ab_no);
	public void animalInsertComment(CommentVo commentVo);
	public void animalDeleteComment(int c_no, int ab_no);

}
