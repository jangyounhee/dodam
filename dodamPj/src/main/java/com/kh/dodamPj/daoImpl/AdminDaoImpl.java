package com.kh.dodamPj.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dodamPj.dao.AdminDao;
import com.kh.dodamPj.vo.A_PagingDto;
import com.kh.dodamPj.vo.AdminVo;
import com.kh.dodamPj.vo.AdoptVo;
import com.kh.dodamPj.vo.AnimalVo;
import com.kh.dodamPj.vo.MemberVo;
import com.kh.dodamPj.vo.PagingDto;
import com.kh.dodamPj.vo.VolunteerVo;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	private static final String NAMESPACE = "com.kh.dodamPj.admin.";

	@Inject
	private SqlSession sqlSession;

	@Override
	public AdminVo login(String admin_id, String admin_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("admin_id", admin_id);
		map.put("admin_pw", admin_pw);
		AdminVo adminVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return adminVo;
	}

	@Override
	public List<MemberVo> listMember() {
			List<MemberVo> memberList = sqlSession.selectList(NAMESPACE+"listMember");
		return memberList;
	}

	@Override
	public List<VolunteerVo> volunReservList(PagingDto pagingDto) {
		List<VolunteerVo> list = 
				sqlSession.selectList(NAMESPACE + "volunReservList", pagingDto);
		System.out.println("dao실행");
		return list;
	}
	
	// 보호중 동물 리스트
	@Override
	public List<AnimalVo> animalList(A_PagingDto aPagingDto) {
		List<AnimalVo> aList = sqlSession.selectList(NAMESPACE + "animalList", aPagingDto);
		return aList;
	}
			
	// 보호중 동물 목록 추가
	@Override
	public void insertAnimal(AnimalVo animalVo) {
		sqlSession.insert(NAMESPACE + "insertAnimal", animalVo);
	}
			
	// 첨부파일 추가
	@Override
	public void insertAttach(AnimalVo animalVo) {
		String[] files = animalVo.getFiles();
		if(files != null && files.length > 0) {
			for(String file : files) {
				Map<String, Object> map = new HashMap<>();
				map.put("file_name", file);
				map.put("a_no", animalVo.getA_no());
				sqlSession.insert(NAMESPACE + "insertAttach", map);
			}
		}
	}
			
	// 보호 동물 조회
	@Override
	public AnimalVo selectAnimal(int a_no) {
		AnimalVo animalVo = sqlSession.selectOne(NAMESPACE + "selectAnimal", a_no);
		return animalVo;
	}
			
	// 보호중 동물 목록 삭제
	@Override
	public void deleteAnimal(int a_no) {
		sqlSession.delete(NAMESPACE + "deleteAnimal", a_no);
	}
			
	// 보호 동물 정보 수정
	@Override
	public void modifyAnimal(AnimalVo animalVo) {
		sqlSession.update(NAMESPACE + "updateAnimal", animalVo);
	}
			
	// 첨부파일 nextval
	@Override
	public int getNextVal() {
		int nextVal = sqlSession.selectOne(NAMESPACE + "getNextVal");
		return nextVal;
	}
			
	// 첨부파일 관련
	@Override
	public String selectFile(int a_no) {
		String file = sqlSession.selectOne(NAMESPACE + "selectFile", a_no);
		return file;
	}

	// 글갯수
	@Override
	public int getCount(A_PagingDto aPagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", aPagingDto);
		return count;
	}

	// 입양 동물 목록
	@Override
	public List<AdoptVo> adoptList(A_PagingDto aPagingDto) {
		List<AdoptVo> adList = sqlSession.selectList(NAMESPACE + "adoptList", aPagingDto);
		return adList;
	}

	// 입양 동물 추가
	@Override
	public void insertPet(AdoptVo adoptVo) {
		sqlSession.insert(NAMESPACE + "insertPet", adoptVo);
	}

	// 입양 동물 추가 시 첨부파일
	@Override
	public void insertAttach2(AdoptVo adoptVo) {
		String[] files = adoptVo.getFiles();
		if(files != null && files.length > 0) {
			for(String file : files) {
				Map<String, Object> map = new HashMap<>();
				map.put("file_name", file);
				map.put("ad_no", adoptVo.getAd_no());
				sqlSession.insert(NAMESPACE + "insertAttach2", map);
			}
		}
	}
	
	// 입양 동물 추가 시 첨부파일 nextval
	@Override
	public int getNextVal2() {
		int nextVal = sqlSession.selectOne(NAMESPACE + "getNextVal2");
		return nextVal;
	}
	
	// 입양 동물 추가 시 첨부파일 관련
	@Override
	public String selectFile2(int ad_no) {
		String file = sqlSession.selectOne(NAMESPACE + "selectFile2", ad_no);
		return file;
	}
	
	// 입양 동물 조회
	@Override
	public AdoptVo selectOnePet(int ad_no) {
		AdoptVo adoptVo = sqlSession.selectOne(NAMESPACE + "selectOnePet", ad_no);
		return adoptVo;
	}
	
	// 입양 동물 정보 수정
	@Override
	public void modifyPet(AdoptVo adoptVo) {
		sqlSession.update(NAMESPACE + "modifyPet", adoptVo);
	}
		
	// 입양 동물 정보 삭제
	@Override
	public void deletePet(int ad_no) {
		sqlSession.delete(NAMESPACE + "deletePet", ad_no);
	}
	
	// 입양 동물 글갯수
	@Override
	public int getCount2(A_PagingDto aPagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount2", aPagingDto);
		return count;
	}
	
}
