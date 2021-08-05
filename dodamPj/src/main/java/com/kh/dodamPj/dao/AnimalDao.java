package com.kh.dodamPj.dao;

import java.util.List;

import com.kh.dodamPj.vo.AnimalVo;
import com.kh.dodamPj.vo.A_PagingDto;

public interface AnimalDao {
	
	// 보호중 동물 목록
	public List<AnimalVo> animalList(A_PagingDto aPagingDto);
	// 보호중 동물 조회하기
	public AnimalVo selectAnimal(int a_no);
	// 글갯수
	public int getCount(A_PagingDto aPagingDto);
}
