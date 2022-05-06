package com.member.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String addr;
	private String email;
	private int grade;
	private int point;
	private String joinDate;
	private String birthDate;
	private List<AuthVO> authList; // [{admin, 'ROLE_MEMBER'}, {admin, 'ROLE_ADMIN'}]
}
