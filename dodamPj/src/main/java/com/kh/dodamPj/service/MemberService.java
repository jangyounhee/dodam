package com.kh.dodamPj.service;

import com.kh.dodamPj.vo.MemberVo;

public interface MemberService {
	//회원가입 처리
	public void joinRun(MemberVo memberVo);
	//로그인
	public MemberVo login(String user_id, String user_pw);
	//회원 정보 수정
	public void modifyRun(MemberVo memberVo);
	//회원 탈퇴
	public void deleteRun(int user_id);
	//아이디 중복 체크
	public boolean checkDupId(String user_id);
	//마이페이지
	public MemberVo selectMember(String user_id);
	//아이디 찾기
	public MemberVo findId(String user_name,String phoneNum);
	//비밀번호 찾기
	public MemberVo findPw(String user_id,String user_name,String phoneNum);
	//비밀번호 수정 21-07-14
	public void updatePw(MemberVo memberVo);
	//이메일발송

	public void sendEmail(MemberVo vo, String div) throws Exception;


//	public void passwordCheck(String user_pw);
	
	
	

}
