package com.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.message.service.MessageService;


@Controller
@RequestMapping("/certify/")
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("cellphone")
	public String cellphone(String tel, String rand) {
		String toNumber = tel;
		String randNumber = rand;
		System.out.println("toNumeber: " +toNumber + " randNumber: " + randNumber);
		
		messageService.sendMessage(toNumber, randNumber);
		
		return "certify/cellphone";
	}
	
}
