package com.kh.dodamPj.dao;

import java.util.List;

import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AdminVo;
import com.kh.dodamPj.vo.AdoptVo;
import com.kh.dodamPj.vo.AnimalVo;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;

public interface AdminDao {
	public AdminVo login(String admin_id,String admin_pw);
	public List<MemberVo> listMember();
	public List<VolunteerVo> volunReservList(PagingDto pagingDto);
	// 보호중 동물 목록
	public List<AnimalVo> animalList(A_PagingDto aPagingDto);
	// 보호중 동물 등록하기
	public void insertAnimal(AnimalVo animalVo);
	// 첨부파일(보호중 동물)
	public void insertAttach(AnimalVo animalVo);
	// 보호중 동물 조회하기
	public AnimalVo selectAnimal(int a_no);
	// 보호중 동물 삭제하기
	public void deleteAnimal(int a_no);
	// 보호중 동물 정보 수정
	public void modifyAnimal(AnimalVo animalVo);
	// nextval 얻기(보호중 동물)
	public int getNextVal();
	// 첨부파일관련(보호중 동물)
	public String selectFile(int a_no);
	// 글갯수(보호중 동물)
	public int getCount(A_PagingDto aPagingDto);
	// 입양 동물 목록
	public List<AdoptVo> adoptList(A_PagingDto aPagingDto);
	// 입양 동물 등록
	public void insertPet(AdoptVo adoptVo);
	// 첨부파일(입양 동물)
	public void insertAttach2(AdoptVo adoptVo);
	// nextval 얻기(입양 동물)
	public int getNextVal2();
	// 첨부파일관련(입양 동물)
	public String selectFile2(int ad_no);
	// 입양 동물 조회
	public AdoptVo selectOnePet(int ad_no);
	// 입양 동물 정보 수정
	public void modifyPet(AdoptVo adoptVo);
	// 입양 동물 정보 삭제
	public void deletePet(int ad_no);
	// 글갯수(입양 동물)
	public int getCount2(A_PagingDto aPagingDto);

}
