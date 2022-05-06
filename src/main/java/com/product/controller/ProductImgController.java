package com.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.product.domain.Product_ImgVO;
import com.product.service.ProductService;

@RestController
@RequestMapping("/thumbnail")
public class ProductImgController {
	@Autowired
	ProductService productService;
	
	@GetMapping(value="imgs/{prod_num}", produces= {MediaType.APPLICATION_XML_VALUE,
			  										  MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Product_ImgVO> getThumbnail(@PathVariable("prod_num") Long prod_num){
		return new ResponseEntity<>(productService.getThumbImg(prod_num), HttpStatus.OK);
	}
	
}
