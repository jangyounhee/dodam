package com.kh.dodamPj.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dodamPj.dao.AnimalDao;
import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AnimalVo;

@Repository
public class AnimalDaoImpl implements AnimalDao {
	
	private final String NAMESPACE = "com.kh.dodamPj.animal.";
	
	@Inject
	private SqlSession sqlSession;

	// 보호중 동물 리스트
	@Override
	public List<AnimalVo> animalList(A_PagingDto aPagingDto) {
		List<AnimalVo> aList = sqlSession.selectList(NAMESPACE + "animalList", aPagingDto);
		return aList;
	}
	
	// 보호 동물 조회
	@Override
	public AnimalVo selectAnimal(int a_no) {
		AnimalVo animalVo = sqlSession.selectOne(NAMESPACE + "selectAnimal", a_no);
		return animalVo;
	}
	
	// 글갯수
	@Override
	public int getCount(A_PagingDto aPagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", aPagingDto);
		return count;
	}

}
