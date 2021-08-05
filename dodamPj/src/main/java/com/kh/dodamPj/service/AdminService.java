package com.kh.dodamPj.service;

import java.util.List;

import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AdminVo;
import com.kh.dodamPj.vo.AdoptVo;
import com.kh.dodamPj.vo.AnimalVo;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.NewsBoardVo;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;


public interface AdminService {

	//회원가입 처리
	public void joinRun(AdminVo adminVo);
	//로그인
	public AdminVo login(String admin_id,String admin_pw);
	//회원 정보 수정
	public void modifyRun(AdminVo AdminVo);
	//회원 탈퇴
	public void deleteRun(int admin_id);
			
	public List<MemberVo> listMember ();
			
	public List<VolunteerVo> volunReservList(PagingDto pagingDto);
	// 보호중 동물 목록
	public List<AnimalVo> animalList(A_PagingDto aPagingDto);
	// 보호중 동물 등록 내용 전송
	public void insertAnimalRun(AnimalVo animalVo);
	// 보호 동물 상세 내용
	public AnimalVo selectAnimal(int a_no);
	// 보호 동물 목록 삭제
	public void deleteAnimalRun(int a_no);
	// 보호 동물 정보 수정
	public void modifyAnimalRun(AnimalVo animalVo);
	// 첨부파일 관련(보호중 동물)
	public String selectFile(int a_no);
	// 글갯수(보호중 동물)
	public int getCount(A_PagingDto aPagingDto);
	// 입양 동물 목록
	public List<AdoptVo> adoptList(A_PagingDto aPagingDto);
	// 입양 동물 등록
	public void animalInsertRun(AdoptVo adoptVo);
	// 첨부파일 관련(입양 동물)
	public String selectFile2(int ad_no);
	// 입양 동물 조회
	public AdoptVo animalCont(int ad_no);
	// 입양 동물 정보 수정
	public void animalModifyRun(AdoptVo adoptVo);
	// 입양 동물 정보 삭제
	public void animalDeleteRun(int ad_no);
	// 글갯수(입양동물)
	public int getCount2(A_PagingDto aPagingDto);
	// 동물게시판 글쓰기
	public void writeRun(NewsBoardVo newsBoardVo);

}
