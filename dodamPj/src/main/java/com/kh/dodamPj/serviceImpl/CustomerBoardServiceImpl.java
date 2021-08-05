package com.kh.dodamPj.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dodamPj.dao.CustomerBoardDao;
import com.kh.dodamPj.service.CustomerBoardService;
import com.kh.dodamPj.vo.CustomerBoardVo;
import com.kh.dodamPj.vo.PagingDto;

@Service
public class CustomerBoardServiceImpl implements CustomerBoardService {
	
	@Inject
	private CustomerBoardDao customerBoardDao;

	@Override
	public List<CustomerBoardVo> customerBoard(PagingDto pagingDto) {
		List<CustomerBoardVo> list = customerBoardDao.customerBoard(pagingDto);
		return list;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = customerBoardDao.getCount(pagingDto);
		return count;
	}

	@Override
	public void writeRun(CustomerBoardVo customerBoardVo) {
		customerBoardDao.insertArticle(customerBoardVo);
	}

	@Override
	public CustomerBoardVo content(int cb_no) {
		CustomerBoardVo customerBoardVo = customerBoardDao.selectByBno(cb_no);
		customerBoardDao.updateViewCnt(cb_no);
		return customerBoardVo;
	}

	@Override
	public void modifyRun(CustomerBoardVo customerBoardVo) {
		customerBoardDao.updateArticle(customerBoardVo);
	}

	@Override
	public void deleteRun(int cb_no) {
		customerBoardDao.deleteArticle(cb_no);
	}

	@Override
	public void replyRun(CustomerBoardVo customerBoardVo) {
		customerBoardDao.updateReply(customerBoardVo);
	}

	@Override
	public void replyWriteRun(CustomerBoardVo customerBoardVo) {
		customerBoardDao.insertReply(customerBoardVo);
	}

}
