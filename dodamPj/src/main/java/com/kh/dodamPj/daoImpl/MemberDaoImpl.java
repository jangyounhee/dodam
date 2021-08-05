package com.kh.dodamPj.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.dodamPj.dao.MemberDao;
import com.kh.dodamPj.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String NAMESPACE = "com.kh.dodamPj.member.";

	@Inject
	private SqlSession sqlSession;
	
	@Autowired //패스워드 security용
	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);
	
	//회원가입
	@Override
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
	}
	
	//로그인
	@Override
	public MemberVo login(String user_id, String user_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return memberVo;
	}
	
	//정보 수정
	@Override
	public void updateMember(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "updateMember", memberVo);
	}
	
	//회원 탈퇴
	@Override
	public void deleteMember(String user_id) {
		sqlSession.delete(NAMESPACE + "deleteMember", user_id);
	}
	
	//아이디 중복체크
	@Override
	public boolean checkDupId(String user_id) {
		int count = sqlSession.selectOne(NAMESPACE + "checkDupId", user_id);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	//아이디 찾기
	@Override
	public MemberVo findId(String user_name, String phoneNum) {
		Map<String, String> map = new HashMap<>();
		map.put("user_name", user_name);
		map.put("phoneNum", phoneNum);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE+"findId", map);
		if(memberVo != null) {
			return memberVo;
		} else {
			MemberVo memberVo1 = new MemberVo();
			return memberVo1;
		}
	}
	
	//패스워드 찾기
	@Override
	public MemberVo findPw(String user_id, String user_name, String phoneNum) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_name", user_name);
		map.put("phoneNum", phoneNum);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE+"findPassword", map);
		return memberVo;
	}
	
	//패스워드 수정
	@Override
	public void updatePw(MemberVo memberVo) {
		sqlSession.update(NAMESPACE+"updatePassword", memberVo);
	}
	
	//마이페이지 21-07-14
	@Override
	public MemberVo selectMember(String user_id) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE+"selectMember", user_id);
		return memberVo;
	}

}
