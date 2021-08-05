package com.kh.dodamPj.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dodamPj.dao.BoardDao;
import com.kh.dodamPj.service.BoardService;
import com.kh.dodamPj.vo.BoardVo;
import com.kh.dodamPj.vo.PagingDto;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDao boardDao;

	@Override
	public List<BoardVo> freeBoard(PagingDto pagingDto) { //자유게시판
		List<BoardVo> list = boardDao.freeBoard(pagingDto);
		return list;
	}

	@Override
	public void writeRun(BoardVo boardVo) { // 글쓰기
		boardDao.insertArticle(boardVo);
		String name = boardVo.getUser_id();
		System.out.println("name "+name);
	}

	@Override
	public void modifyRun(BoardVo boardVo) { // 수정하기
		boardDao.updateArticle(boardVo);
	}

	@Override
	public BoardVo content(int b_no) { // 목록
		BoardVo boardVo = boardDao.selectByBno(b_no);
		boardDao.updateViewCnt(b_no);
		return boardVo;
	}

	@Override
	public void deleteRun(int b_no) { // 삭제하기
		boardDao.deleteArticle(b_no);
	}

	@Override
	public int getCount(PagingDto pagingDto) { //페이징
		int count = boardDao.getCount(pagingDto);
		return count;
	}
	
	@Override
	public void commentDeleteRun(int b_no) { // 게시글 삭제 시 댓글 삭제
		boardDao.commentDeleteArticle(b_no);
	}


}
