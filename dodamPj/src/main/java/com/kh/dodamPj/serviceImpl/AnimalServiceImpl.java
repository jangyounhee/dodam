package com.kh.dodamPj.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dodamPj.dao.AnimalDao;
import com.kh.dodamPj.service.AnimalService;
import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AnimalVo;

@Service
public class AnimalServiceImpl implements AnimalService {

	@Inject
	private AnimalDao animalDao;
	
	// 보호중 동물 목록
	@Override
	public List<AnimalVo> animalList(A_PagingDto aPagingDto) {
		List<AnimalVo> aList = animalDao.animalList(aPagingDto);
		return aList;
	}
		
	// 보호 동물 상세 내용
	@Override
	public AnimalVo selectAnimal(int a_no) {
		AnimalVo animalVo = animalDao.selectAnimal(a_no);
		return animalVo;
	}
		
	// 글갯수
	@Override
	public int getCount(A_PagingDto aPagingDto) {
		int count = animalDao.getCount(aPagingDto);
		return count;
	}

}
