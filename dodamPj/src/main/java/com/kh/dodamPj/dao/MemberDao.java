package com.kh.dodamPj.dao;

import com.kh.dodamPj.vo.MemberVo;

public interface MemberDao {
	//회원 가입
	public void insertMember(MemberVo memberVo);
	//로그인
	public MemberVo login(String user_id, String user_pw);
	//정보 수정- 아직
	public void updateMember(MemberVo memberVo);
	//회원 탈퇴- 아직
	public void deleteMember(String user_id);
	//아이디 중복 체크
	public boolean checkDupId(String user_id);
	//마이페이지 21-07-14
	public MemberVo selectMember(String user_id);
	//아이디 찾기
	public MemberVo findId(String user_name,String phoneNum);
	//패스워드 찾기
	public MemberVo findPw(String user_id,String user_name,String phoneNum);
	//패스워드 수정 - 아직
	public void updatePw(MemberVo memberVo);

}
