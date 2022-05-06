package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController { 	// 메인 페이지 컨트롤러

	@RequestMapping("/")
	public String home() {
		return "main/home";
	}
	
	@GetMapping("/intro")
	public String intro() {
		return "main/intro";
	}
	
	@GetMapping("/noticeList")
	public String noticeList() {
		return "main/notice/list";
	}
	
}
