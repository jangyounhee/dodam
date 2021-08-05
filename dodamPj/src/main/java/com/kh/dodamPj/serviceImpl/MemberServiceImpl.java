package com.kh.dodamPj.serviceImpl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.dodamPj.controller.MailHandler;
import com.kh.dodamPj.controller.TempKey;
import com.kh.dodamPj.dao.MemberDao;
import com.kh.dodamPj.service.MemberService;
import com.kh.dodamPj.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;

	@Autowired //패스워드 security용
	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);

	@Override
	public void joinRun(MemberVo memberVo) {
		memberDao.insertMember(memberVo);
	}

	@Override
	public void modifyRun(MemberVo memberVo) {
		// TODO Auto-generated method stub
	}

	@Override
	public void deleteRun(int user_id) {
		// TODO Auto-generated method stub
	}

	@Override
	public MemberVo login(String user_id, String user_pw) {
		MemberVo memberVo = memberDao.login(user_id, user_pw);
		return memberVo;
	}

	@Override
	public boolean checkDupId(String user_id) {
		return memberDao.checkDupId(user_id);
	}

	@Override
	public MemberVo findId(String user_name, String phoneNum) {
		MemberVo memberVo = memberDao.findId(user_name, phoneNum);
		return memberVo;
	}

	@Override
	public MemberVo findPw(String user_id, String user_name, String phoneNum) {
		MemberVo memberVo = memberDao.findPw(user_id, user_name, phoneNum);
		return memberVo;
	}

	@Override
	public void updatePw(MemberVo memberVo) {
		memberDao.updatePw(memberVo);
	}

	@Override
	public MemberVo selectMember(String user_id) {
		MemberVo memberVo = memberDao.selectMember(user_id);
		return memberVo;
	}

	@Override
	public void sendEmail(MemberVo vo, String div) {
		
	}

}
