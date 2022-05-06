package com.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.common.security.domain.CustomUser;
import com.member.domain.MemberVO;
import com.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/")
public class MemberController {	// 회원 관련 컨트롤러

	@Autowired
	private MemberService memberService; 

	@GetMapping("login")
	public void login(String error, String logout, Model model, HttpServletRequest request) {
		log.info("login form!!!");
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		String referrer = request.getHeader("Referer"); 
		request.getSession().setAttribute("prevPage", referrer);
		
		if(error != null) {
			model.addAttribute("error", "올바른 정보를 입력해주세요!"); 
			error = null;
		}
	}
	
	@GetMapping("signup")
	public void signup() {
		log.info("signup 폼 요청!");
	}
	
	// 회원 가입 로직 처리
	@PostMapping("signup")
	public String signupPro(@ModelAttribute("member") MemberVO vo, Model model) {
		log.info(vo);
		// 서비스 클래스와 맵퍼를 작성하되, 안 될 경우 아랫 부분에 주석으로
		// 에러 문구 작성 (키워드 작성)
		int result = memberService.addMember(vo);
		model.addAttribute("result", result);
		
		// 또한, 회원 가입 폼에서 받아온 데이터에 대한 로그를 해당 메서드에 작성한다.
		
		// 만약 회원 가입 처리가 잘 수행된다면 로그인 페이지로 이동하도록 구현 (redirect)
		
		return "member/signupPro";
	}
		
	// 아이디 중복 확인 요청
	@RequestMapping("idAvail")
	public String idAvail(String id, Model model) {
		System.out.println("id 중복확인 요청");
		
		// id 값이 DB에 존재하는지 체크해서 view 결과 전달
		int result = memberService.idAvail(id);
		model.addAttribute("result", result);
		model.addAttribute("trialId", id);
		
		return "member/idAvail";
	}
	
	// 응답 데이터의 한글깨짐 방지
	@RequestMapping("ajaxIdAvail")
	public ResponseEntity<String> ajaxIdAvail(String id){
		System.out.println("ajax id Avail 요청 " + id);
		int result = memberService.idAvail(id);
		String resStr = "";
		if(result == 1) {
			resStr = "이미 존재합니다";
		}else {
			resStr = "사용 가능합니다";
		}
		
		// 헤더정보 세팅
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type", "text/html;charset=utf-8"); // 한글 깨짐 방지 헤더 정보
		
		return new ResponseEntity<String>(resStr, responseHeader, HttpStatus.OK);
		// body에 전송할 데이터, 헤더객체, http 상태코드 (ok = 200, created = 201)
	}
	
	@GetMapping("delete")
	public void delete() {
		log.info("delete 폼 요청!");
	}
	
	@PostMapping("delete")
	public String deletePro(@AuthenticationPrincipal CustomUser customUser, Authentication auth, MemberVO member, Model model) {
		log.info("delete 처리 요청!!");
		member.setId(customUser.getUsername());
		int result = memberService.deleteMember(member);
		log.info("delete result : " + result);
		model.addAttribute("result", result);
		
		return "member/deletePro";
	}
	
	@GetMapping("modify")
	public void modify(Authentication auth, Model model) {
		log.info("modify폼 요청!!");
		CustomUser customUser = (CustomUser)auth.getPrincipal();
		log.info(customUser);
		MemberVO member = memberService.getMember(customUser.getUsername()); 
		model.addAttribute("member", member);
	}
	
	@PostMapping("modify")
	public String modifyPro(@AuthenticationPrincipal CustomUser customUser, MemberVO member, Model model) { // pw, age, email
		log.info("modify 처리 요청!!");
		
		member.setId(customUser.getUsername());
		int result = memberService.modifyMember(member); 
		log.info("result modify : " + result);

		model.addAttribute("result", result);
		
		return "member/modifyPro";
	}
	
	// 접근 제한시 처리할 경로  : 로그인은 했지만 권한없을때 요청되는 경로
	@GetMapping("accessError")
	public void accessDenied(Authentication auth, Model model) {
		// 사용자 정보가 필요한경우 Authentication 타입 매개변수 추가 
		log.info("accessDenied : " + auth); 
		
		model.addAttribute("msg", "access denied"); 
	}
	
}
