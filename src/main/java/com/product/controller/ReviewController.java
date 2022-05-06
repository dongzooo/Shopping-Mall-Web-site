package com.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.product.domain.ProdReviewVO;
import com.product.domain.ReviewImgVO;
import com.product.service.ProductService;

@RestController
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	ProductService productService;
	
	// 특정 상품 리뷰 개수
	@GetMapping(value="pages/{prodNum}", produces= {MediaType.APPLICATION_XML_VALUE,
													 MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> getReviewCount(@PathVariable("prodNum") Long prodNum){
		System.out.println("prdoNum: " + prodNum);
		return new ResponseEntity<>(productService.getReviewCount(prodNum), HttpStatus.OK);
	}
	
	// 특정 상품 리뷰 목록 불러오기
	@GetMapping(value="pages/{prodNum}/{page}", produces= {MediaType.APPLICATION_XML_VALUE,
															MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProdReviewVO>> getReviewList(@PathVariable("page") int page,
													  		@PathVariable("prodNum") Long prodNum){

		return new ResponseEntity<>(productService.getReviewList(page, prodNum), HttpStatus.OK);
	}
	
	// 리뷰 이미지 불러오기
	@GetMapping(value="imgs/{reviewNum}", produces= {MediaType.APPLICATION_XML_VALUE,
													  MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewImgVO> getReviewImg(@PathVariable("reviewNum") Long reviewNum){
		return new ResponseEntity<>(productService.getReviewImg(reviewNum), HttpStatus.OK);
	}
}
