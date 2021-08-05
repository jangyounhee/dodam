package com.kh.dodamPj.daoImpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dodamPj.dao.CustomerBoardDao;
import com.kh.dodamPj.vo.CustomerBoardVo;
import com.kh.dodamPj.vo.PagingDto;

@Repository
public class CustomerBoardDaoImpl implements CustomerBoardDao {
	
	private static final String NAMESPACE = "com.kh.dodamPj.customerboard.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<CustomerBoardVo> customerBoard(PagingDto pagingDto) {
		List<CustomerBoardVo> customerBoardVo = sqlSession.selectList(NAMESPACE + "customerBoard", pagingDto);
		return customerBoardVo;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}

	@Override
	public void insertArticle(CustomerBoardVo customerBoardVo) {
		sqlSession.insert(NAMESPACE + "insertArticle", customerBoardVo);
	}

	@Override
	public CustomerBoardVo selectByBno(int cb_no) {
		CustomerBoardVo customerBoardVo = sqlSession.selectOne(NAMESPACE + "selectByBno", cb_no);
		return customerBoardVo;
	}

	@Override
	public void updateArticle(CustomerBoardVo customerBoardVo) {
		sqlSession.update(NAMESPACE + "updateArticle", customerBoardVo);
	}

	@Override
	public void deleteArticle(int cb_no) {
		sqlSession.delete(NAMESPACE + "deleteArticle", cb_no);
	}

	@Override
	public void updateReply(CustomerBoardVo customerBoardVo) {
		sqlSession.insert(NAMESPACE + "updateReply", customerBoardVo);
	}

	@Override
	public void updateViewCnt(int cb_no) {
		sqlSession.update(NAMESPACE + "updateViewCnt", cb_no);
	}

	@Override
	public void insertReply(CustomerBoardVo customerBoardVo) {
		sqlSession.insert(NAMESPACE + "insertReply", customerBoardVo);
	}

}
