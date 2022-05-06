package com.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.member.domain.AuthVO;
import com.member.domain.MemCouponVO;
import com.member.domain.MemberVO;

public interface MemberMapper {
	// 아이디 중복 검사
	public int idCount(String id);
	
	//회원 추가 
	public int addMember(MemberVO member);
	
	// 회원 한명 정보 가져오기 
	public MemberVO getMember(String id); 
	
	// 회원 리스트 가져오기
	public List<MemberVO> getMemberList();
	
	// 회원 삭제 
	public int deleteMember(String id);

	// 회원 정보 수정
	public int updateMember(MemberVO member);
	
	// 회원 정보 수정 AdminPage용
	public int updateMemberAdmin(MemberVO member);

	public int getPoint(String id);

	public void modiAuth(@Param("seller") String seller, @Param("id") String id);

	public void saveCoupon(MemCouponVO coupon);
}
