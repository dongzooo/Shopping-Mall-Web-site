package com.member.service;

import java.util.List;

import com.member.domain.MemCouponVO;
import com.member.domain.MemberVO;

public interface MemberService {
	// 아이디 중복 검사
	int idAvail(String id);

	// 회원 추가(가입처리) 
	public int addMember(MemberVO member); 
	
	// 회원정보 가져오기 
	public MemberVO getMember(String id); 
	
	// 회원정보 가져오기 
	public List<MemberVO> getMemberList(); 
	
	// 회원 정보 수정 처리 
	public int modifyMember(MemberVO member); 
	
	// 회원 정보 수정(adminPage용)
	public int MemberModi(MemberVO member);
	
	// 회원 탈퇴 처리 
	public int deleteMember(MemberVO member);
	
	// 회원 보유 포인트 조회
	int getPoint(String id);
	
	// 회원 판매자 등록 여부 수정
	void modiAuth(String seller, String id);
	
	// 쿠폰 지급 저장
	void saveCoupon(MemCouponVO coupon);

}
