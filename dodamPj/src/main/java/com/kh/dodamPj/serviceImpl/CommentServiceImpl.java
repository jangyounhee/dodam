package com.kh.dodamPj.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dodamPj.dao.BoardDao;
import com.kh.dodamPj.dao.CommentDao;
import com.kh.dodamPj.service.CommentService;
import com.kh.dodamPj.vo.CommentVo;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Inject
	private CommentDao commentDao;
	
	@Inject
	private BoardDao boardDao;

	@Override
	public List<CommentVo> getCommentList(int b_no) {
		List<CommentVo> list = commentDao.getCommentList(b_no);
		return list;
	}

	@Transactional
	@Override
	public void insertComment(CommentVo commentVo) {
		commentDao.insertComment(commentVo);
		boardDao.updateCommentCnt(commentVo.getB_no(), 1);
	}

	@Transactional
	@Override
	public void deleteComment(int c_no, int b_no) {
		commentDao.deleteComment(c_no);
		boardDao.updateCommentCnt(b_no, -1);
	}
	
	@Override
	public void updateComment(CommentVo commentVo) {
		commentDao.updateComment(commentVo);
	}

	@Override
	public List<CommentVo> animalGetCommentList(int ab_no) {
		List<CommentVo> list = commentDao.animalGetCommentList(ab_no);
		return list;
	}

	@Override
	public void animalInsertComment(CommentVo commentVo) {
		commentDao.animalInsertComment(commentVo);
		boardDao.updateCommentCnt(commentVo.getAb_no(), 1);
	}

	@Override
	public void animalDeleteComment(int c_no, int ab_no) {
		commentDao.deleteComment(c_no);
		boardDao.animalUpdateCommentCnt(ab_no, -1);
	}

}
