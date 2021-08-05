package com.kh.dodamPj.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dodamPj.dao.LostDao;
import com.kh.dodamPj.vo.LostVo;
import com.kh.dodamPj.vo.PagingDto;

@Repository
public class LostDaoImpl implements LostDao {

	private final String NAMESPACE = "com.kh.dodamPj.lost.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 분실신고 목록
	@Override
	public List<LostVo> reportList(PagingDto pagingDto) {
		List<LostVo> list = sqlSession.selectList(NAMESPACE + "reportList", pagingDto);
		return list;
	}
	
	// 분실 신고서 작성
	@Override
	public void insertReport(LostVo lostVo) {
		sqlSession.insert(NAMESPACE + "insertReport", lostVo);
	}
	
	// 분실 신고서 수정
	@Override
	public void updateReport(LostVo lostVo) {
		sqlSession.update(NAMESPACE + "updateReport", lostVo);
		
	}
	
	// 분실 신고서 삭제
	@Override
	public void deleteReport(int b_no) {
		sqlSession.delete(NAMESPACE + "deleteReport", b_no);		
	}
	
	// 분실 신고서 상세보기
	@Override
	public LostVo reportContent(int b_no) {
		LostVo lostVo = sqlSession.selectOne(NAMESPACE + "reportContent", b_no);
		return lostVo;
	}

	// 신고 목록 조회수 증가
	@Override
	public void updateViewcnt(int b_no) {
		sqlSession.update(NAMESPACE + "updateViewcnt", b_no);
	}

	// 이미지 첨부
	@Override
	public void insertAttach(LostVo lostVo) {
		String[] files = lostVo.getFiles();
		if(files != null && files.length > 0) {
			for(String file : files) {
				Map<String, Object> map = new HashMap<>();
				map.put("file_name", file);
				map.put("b_no", lostVo.getB_no());
				sqlSession.insert(NAMESPACE + "insertAttach", map);
			}
		}
	}
	
	// 글갯수 체크
	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}
	
	// 첨부파일 때문에 nextval 구하는..
	@Override
	public int getNextVal() {
		int nextVal = sqlSession.selectOne(NAMESPACE + "getNextVal");
		return nextVal;
	}

	// 역시 첨부파일 때문에 만들어진 @_@
	@Override
	public String selectFile(int b_no) {
		String file = sqlSession.selectOne(NAMESPACE + "selectFile", b_no);
		return file;
	}

}
