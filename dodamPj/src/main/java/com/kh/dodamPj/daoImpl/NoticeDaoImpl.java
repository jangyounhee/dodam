package com.kh.dodamPj.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dodamPj.dao.NoticeDao;
import com.kh.dodamPj.vo.NoticeVo;
import com.kh.dodamPj.vo.PagingDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	private static final String NAMESPACE = "com.kh.dodamPj.notice.";
	
	@Inject
	SqlSession sqlSession;
	
	//공지 사항 등록
	@Override
	public void insertArticle(NoticeVo noticeVo) {
		sqlSession.insert(NAMESPACE+"insertArticle", noticeVo);
		System.out.println("dao impl noticeVo: "+ noticeVo);
	}
	//공지 사항 상세 보기
	@Override
	public NoticeVo selectByBno(int n_no) {
		NoticeVo noticeVo = sqlSession.selectOne(NAMESPACE+"selectByBno",n_no);
		return noticeVo;
	}
	//공지 사항 수정
	@Override
	public void updateArticle(NoticeVo noticeVo) {
		sqlSession.update(NAMESPACE+"updateArticle", noticeVo);

	}
	//공지사항 삭제
	@Override
	public void deleteArticle(int n_no) {
		sqlSession.delete(NAMESPACE+"deleteArticle", n_no);

	}
	//공지사항 리스트
	@Override
	public List<NoticeVo> listAll(PagingDto pagingDto) {
		List<NoticeVo> list = sqlSession.selectList(NAMESPACE+"listAll",pagingDto);
		return list;
	}
//	페이징 할때 필요한 전체 리스트 갯수 
	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		int stp = pagingDto.getStartPage();
		System.out.println("daoimp: "+stp);
		return count;
	}
	
//	첨부파일 등록 2012.07.13
	@Override
	public void insertAttach(NoticeVo noticeVo) {
		String[] files = noticeVo.getFiles();
		if (files != null && files.length > 0) {
			for (String file : files) {
				Map<String, Object> map = new HashMap<>();
				map.put("file_name", file);
				map.put("n_no", noticeVo.getN_no());
				sqlSession.insert(NAMESPACE + "insertAttach", map);
			}
		}
	}
	//첨부파일 할떄 필요 : 시퀀스 번호 2012.07.13
	@Override
	public int getNextVal() {
		int nextval = sqlSession.selectOne(NAMESPACE + "getNextVal");
		return nextval;
	}
	
	//자세히 보기시 첨부 파일 로딩 2012.07.13
	@Override
	public String selectFile(int n_no) {
		String file = sqlSession.selectOne(NAMESPACE+"selectFile", n_no);
		System.out.println("file: "+file );
		return file;
	}

}
