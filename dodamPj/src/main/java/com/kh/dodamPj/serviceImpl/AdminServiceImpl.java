package com.kh.dodamPj.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dodamPj.dao.AdminDao;
import com.kh.dodamPj.dao.AdoptDao;
import com.kh.dodamPj.dao.AnimalDao;
import com.kh.dodamPj.dao.NewsBoardDao;
import com.kh.dodamPj.dao.VolunteerDao;
import com.kh.dodamPj.service.AdminService;
import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AdminVo;
import com.kh.dodamPj.vo.AdoptVo;
import com.kh.dodamPj.vo.AnimalVo;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.NewsBoardVo;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDao adminDao;
	@Inject
	private VolunteerDao volunteerDao;
	@Inject
	private AnimalDao animalDao;
	@Inject
	private AdoptDao adoptDao;
	@Inject
	private NewsBoardDao newsBoardDao;

	@Override
	public void joinRun(AdminVo adminVo) {
		// TODO Auto-generated method stub
	}

	@Override
	public AdminVo login(String admin_id, String admin_pw) {
		AdminVo adminVo = adminDao.login(admin_id, admin_pw);
		return adminVo;
	}

	@Override
	public void modifyRun(AdminVo AdminVo) {
		// TODO Auto-generated method stub
	}

	@Override
	public void deleteRun(int admin_id) {
		// TODO Auto-generated method stub
	}

	@Override
	public List<MemberVo> listMember() {
		List<MemberVo> memberList = adminDao.listMember();
		return memberList;
	}

	@Override
	public List<VolunteerVo> volunReservList(PagingDto pagingDto) {
		List<VolunteerVo> list = volunteerDao.volunReservList(pagingDto);
		System.out.println("service실행");
		return list;
	}
	
	// 보호중 동물 목록
	@Override
	public List<AnimalVo> animalList(A_PagingDto aPagingDto) {
		List<AnimalVo> aList = animalDao.animalList(aPagingDto);
		return aList;
	}
			
	// 보호중 동물 등록 내용 및 첨부파일 전송
	@Transactional
	@Override
	public void insertAnimalRun(AnimalVo animalVo) {
		int nextVal = adminDao.getNextVal();
		animalVo.setA_no(nextVal);
		adminDao.insertAnimal(animalVo);
		adminDao.insertAttach(animalVo);
	}
			
	// 보호 동물 상세 내용
	@Override
	public AnimalVo selectAnimal(int a_no) {
		AnimalVo animalVo = animalDao.selectAnimal(a_no);
		return animalVo;
	}
			
	// 보호중 동물 목록 삭제
	@Override
	public void deleteAnimalRun(int a_no) {
		adminDao.deleteAnimal(a_no);
	}
			
	// 보호중 동물 정보 수정
	@Override
	public void modifyAnimalRun(AnimalVo animalVo) {
		adminDao.modifyAnimal(animalVo);
	}
			
	// 첨부파일 관련
	@Override
	public String selectFile(int a_no) {
		String file = adminDao.selectFile(a_no);
		return file;
	}

	// 글갯수
	@Override
	public int getCount(A_PagingDto aPagingDto) {
		int count = adminDao.getCount(aPagingDto);
		return count;
	}
	
	// 입양 동물 목록
	@Override
	public List<AdoptVo> adoptList(A_PagingDto aPagingDto) {
		List<AdoptVo> adList = adoptDao.adoptList(aPagingDto);
		return adList;
	}
	
	// 입양 동물 등록 및 첨부파일
	@Transactional
	@Override
	public void animalInsertRun(AdoptVo adoptVo) {
		int nextVal2 = adminDao.getNextVal2();
		adoptVo.setAd_no(nextVal2);
		adminDao.insertPet(adoptVo);
		adminDao.insertAttach2(adoptVo);
	}

	// 첨부파일 관련
	@Override
	public String selectFile2(int ad_no) {
		String file2 = adminDao.selectFile2(ad_no);
		return file2;
	}
	
	// 입양 동물 상세 정보
	@Override
	public AdoptVo animalCont(int ad_no) {
		AdoptVo adoptVo = adoptDao.selectOnePet(ad_no);
		return adoptVo;
	}
		
	// 입양 동물 정보 수정
	@Override
	public void animalModifyRun(AdoptVo adoptVo) {
		adminDao.modifyPet(adoptVo);		
	}

	// 입양 동물 정보 삭제
	@Override
	public void animalDeleteRun(int ad_no) {
		adminDao.deletePet(ad_no);		
	}
	
	// 글갯수(입양동물)
	@Override
	public int getCount2(A_PagingDto aPagingDto) {
		int count = adminDao.getCount2(aPagingDto);
		return count;
	}

	@Override
	public void writeRun(NewsBoardVo newsBoardVo) { // 동물게시판 글쓰기
		newsBoardDao.insertArticle(newsBoardVo);
		String name = newsBoardVo.getUser_id();
		System.out.println("name "+name);
	}
}
