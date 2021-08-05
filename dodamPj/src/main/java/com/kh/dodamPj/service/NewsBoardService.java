package com.kh.dodamPj.service;

import java.util.List;


import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.NewsBoardVo;

public interface NewsBoardService {
	public List<NewsBoardVo> newsBoard(PagingDto pagingDto);
	public int getCount(PagingDto pagingDto);
	public void writeRun(NewsBoardVo newsBoardVo);
	public NewsBoardVo content(int ab_no);
	public void deleteRun(int ab_no);
	public void modifyRun(NewsBoardVo newsBoardVo);
}
