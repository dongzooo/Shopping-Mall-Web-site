package com.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.product.domain.ProductVO;
import com.product.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/pay/")
public class PayController {
	@Autowired
	ProductService productService;

	@GetMapping("kg")
	public void kg(String prod_num, String orderQnt, String prod_price, Model model) {
		
		log.info(prod_price);
		log.info(Integer.parseInt(prod_price) * Integer.parseInt(orderQnt));
		
		System.out.println("naverPay get요청!!!");
		System.out.println("가격: " + (Integer.parseInt(prod_price) * Integer.parseInt(orderQnt)) + "수량: "+orderQnt);
		ProductVO prod = productService.getProdInfo(prod_num);
		model.addAttribute("prod_num", prod_num);
		model.addAttribute("prod_name", prod.getProd_name());
		model.addAttribute("orderQnt", orderQnt);
		model.addAttribute("price", prod_price);
	}

}
