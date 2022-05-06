package com.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sellerPage/*")
public class SellerController {

	@GetMapping("sellerPageMainMenu")
	public void sellerPageMainMenu() {
		log.info("sellerPageMainMenu 호출!");
	}
	
	
}
