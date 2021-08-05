package com.kh.dodamPj.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dodamPj.dao.LostDao;
import com.kh.dodamPj.service.LostService;
import com.kh.dodamPj.vo.LostVo;
import com.kh.dodamPj.vo.PagingDto;

@Service
public class LostServiceImpl implements LostService {

	@Inject
	private LostDao lostDao;
	
	// 신고 목록
	@Override
	public List<LostVo> reportList(PagingDto pagingDto) {
		List<LostVo> list = lostDao.reportList(pagingDto);
		return list;
	}
	
	// 신고서 작성 및 첨부파일 전송
	@Transactional
	@Override
	public void reportRun(LostVo lostVo) {
		int nextval = lostDao.getNextVal();
		lostVo.setB_no(nextval);
		lostDao.insertReport(lostVo);
		lostDao.insertAttach(lostVo);
	}
	
	// 신고서 상세 보기
	@Override
	public LostVo reportContent(int b_no) {
		LostVo lostVo = lostDao.reportContent(b_no);
		lostDao.updateViewcnt(b_no);
		return lostVo;
	}

	// 신고서 수정 전송
	@Override
	public void reportModifyRun(LostVo lostVo) {
		lostDao.updateReport(lostVo);
	}

	// 신고서 삭제 전송
	@Override
	public void reportDeleteRun(int b_no) {
		lostDao.deleteReport(b_no);		
	}

	// 글갯수 체크
	@Override
	public int getCount(PagingDto pagingDto) {
		int count = lostDao.getCount(pagingDto);
		return count;
	}

	// 첨부파일 관련
	@Override
	public String selectFile(int b_no) {
		String file = lostDao.selectFile(b_no);
		return file;
	}

}
