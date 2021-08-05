
package com.kh.dodamPj.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dodamPj.vo.BoardVo;
import com.kh.dodamPj.vo.PagingDto;

public interface BoardService {
	public List<BoardVo> freeBoard(PagingDto pagingDto);
	public void writeRun(BoardVo boardVo);
	public BoardVo content(int b_no);
	public void modifyRun(BoardVo boardVo);
	public void deleteRun(int b_no);
	public int getCount(PagingDto pagingDto);

//	public Map<String, Object> upload(MultipartFile img);

	public void commentDeleteRun(int b_no); 

}
