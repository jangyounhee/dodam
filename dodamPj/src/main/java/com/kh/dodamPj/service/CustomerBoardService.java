package com.kh.dodamPj.service;

import java.util.List;

import com.kh.dodamPj.vo.CustomerBoardVo;
import com.kh.dodamPj.vo.PagingDto;

public interface CustomerBoardService {
	public List<CustomerBoardVo> customerBoard(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public void writeRun(CustomerBoardVo customerBoardVo);
	public CustomerBoardVo content(int cb_no);
	public void modifyRun(CustomerBoardVo customerBoardVo);
	public void deleteRun(int cb_no);
	public void replyRun(CustomerBoardVo customerBoardVo);
	public void replyWriteRun(CustomerBoardVo customerBoardVo);
}
