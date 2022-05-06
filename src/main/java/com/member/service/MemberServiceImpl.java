package com.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.member.domain.AuthVO;
import com.member.domain.MemCouponVO;
import com.member.domain.MemberVO;
import com.member.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;


// 서비스 구현 클래스 : 기능 구현 
@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	// 비밀번호 암호화해줄 객체 주입 
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;  

	@Autowired
	private MemberMapper memberMapper;
	
	// 아이디 중복 검사 구현
	@Override
	public int idAvail(String id) {		
		int count = memberMapper.idCount(id);
		return count;
	}

	// 회원 추가(가입처리) 구현 
	@Override
	public int addMember(MemberVO member) {
		// 비번 암호화 
		member.setPw(bCryptPasswordEncoder.encode(member.getPw()));
		// DB 접근해서 추가 
		int result = memberMapper.addMember(member);
		return result;
	}
	
	// 회원 정보 가져오기 
	@Override
	public MemberVO getMember(String id) { 
		MemberVO member = memberMapper.getMember(id);
		return member;
	}
	
	// 회원정보 수정 처리 구현 
	@Override
	public int modifyMember(MemberVO member) {
		int result = 0; 
		
		member.setPw(bCryptPasswordEncoder.encode(member.getPw()));
		result = memberMapper.updateMember(member);
		
		return result; // 컨트롤러에서 갱신된 레코드수 돌려주기 
	}
	
	// 회원 정보 수정(adminPage용)
	public int MemberModi(MemberVO member) {
		return memberMapper.updateMemberAdmin(member);
	}

	// 회원 탈퇴 처리 구현 
	@Override
	public int deleteMember(MemberVO member) {
		int result = 0; 
		MemberVO dbMember = getMember(member.getId());
		if(bCryptPasswordEncoder.matches(member.getPw(), dbMember.getPw())) {
			result = 1; 
			int deleteRes = memberMapper.deleteMember(member.getId()); 
			log.info("delete member result : " + deleteRes);  
		}
		
		return result;
	}

	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = memberMapper.getMemberList();
		return memberList;
	}
	
	// 회원 보유 포인트 조회
	@Override
	public int getPoint(String id) {
		return memberMapper.getPoint(id);
	}

	@Override
	public void modiAuth(String seller, String id) {
		memberMapper.modiAuth(seller, id);
	}

	@Override
	public void saveCoupon(MemCouponVO coupon) {
		memberMapper.saveCoupon(coupon);
	}

	
	

	
	

	
}
