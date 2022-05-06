package com.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.common.security.domain.CustomUser;
import com.product.domain.ProdReviewVO;
import com.product.domain.ProductVO;
import com.product.domain.Product_ImgVO;
import com.product.domain.ReviewImgVO;
import com.product.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("list")
	public void list(HttpServletRequest request, Model model) {
		System.out.println("list get요청!!!");
		System.out.println("카테고리: " + request.getParameter("category"));
		
		Long category = 1L;
		
		if(request.getParameter("category") != null) {
			category = Long.parseLong(request.getParameter("category"));
		}
		
		int page = 1;
		
		if(request.getParameter("page")!=null) page = Integer.parseInt(request.getParameter("page"));
		
		//System.out.println("aa"+request.getParameter("page"));
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		list = productService.getProductByCategory(category, page);
		
		int totPage = productService.countPage(category);
		
		model.addAttribute("list", list);
		model.addAttribute("totPage", totPage);
	}
	
	@GetMapping("search")
	public void search() {
		System.out.println("search get요청!!!");
	}
	
	@GetMapping("searchFail")
	public void searchFail() {
		System.out.println("searchFail get요청!!!");
	}
	
	@GetMapping("detail_qna")
   public void goods(HttpServletRequest request, Model model) {
      String prod_num = request.getParameter("prod_num");
      List<Product_ImgVO> img = productService.getProdImg(prod_num);
      ProductVO prod = productService.getProdInfo(prod_num);
      System.out.println("goods get요청!!!");
      model.addAttribute("result", img);
      model.addAttribute("prod", prod);
   }

	// 상품 등록
	@GetMapping("prodRegi")
	public void prodRegi(){
		System.out.println("상품 등록 폼 요청");
	}
	
	// 상품 등록 처리
	@PostMapping("prodRegi")
	public String prodRegiPro(@AuthenticationPrincipal CustomUser customUser, ProductVO prdVo, Model model, String thumbNail, MultipartHttpServletRequest request){
		System.out.println("상품 등록 처리 요청");
		
		List<MultipartFile> mf = request.getFiles("multiFileList");
		
		// 파일의 확장자 분류
		for(int i = 0; i < mf.size(); i++) {
			String ct = mf.get(i).getContentType();
			String type = ct.substring(0, ct.indexOf("/"));
			if(!type.equals("image")) { // 파일이 이미지일 경우에만 저장
				System.out.println("이미지 파일이 아닙니다.");
				return "redirect:/product/prodRegi";
			}
		}
		
		// 서버에 파일 저장
		// #2. 파일 저장할 폴더 경로 찾아 ("save")
		String savePath = request.getRealPath("resources\\save");
		System.out.println(savePath);
		List<String> img_file_name_list = new ArrayList<String>();
		// #3-2. UUID + orgName 
		for(int i = 0; i < mf.size(); i++) {
			String orgName = mf.get(i).getOriginalFilename();
			UUID uuid = UUID.randomUUID();	// (UUID 형식 : eb877ddd-41d8-41cc-97f9-6c2795391581)
			String newName = uuid + orgName;
			img_file_name_list.add(newName);
			// 썸네일 이미지 특정
			if(orgName.equals(thumbNail)) {
				thumbNail = newName;
			}
			
			// #4. 파일을 실제로 저장 처리 : 내가 만든 파일명과 폴더 전체 경로를 연결해서 그쪽으로 파일을 이동해주는 개념
			String imgPath = savePath + "\\" + newName;
			File f = new File(imgPath);
			try {
				mf.get(i).transferTo(f);	// 예외 처리 필요
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		prdVo.setProd_seller(customUser.getUsername()); 
		
		// 이미지를 제외한 상품의 기본 정보 DB 등록
		int result = productService.prodReg(prdVo);
		// DB에서 방금 등록한 상품의 prdo_num 가져오기
		int prod_num = productService.getProdNum();
		System.out.println(prod_num);

		// 이미지 파일 DB 저장
		int imgResult = productService.imgFileSave(prod_num, img_file_name_list, savePath, thumbNail);
		
		// DB 저장 결과 view로 전달
		model.addAttribute("result", result);
		model.addAttribute("imgResult", imgResult);
		
		return "product/prodRegiPro";
	}
	
	// 리뷰 등록
	@PostMapping("reviewRegPro")
	public String reviewRegPro(MultipartHttpServletRequest request, ProdReviewVO reviewVO ,Model model) {
		System.out.println("리뷰 등록 처리 요청");
		
		// 리뷰 수정 요청 시에만 값이 들어감
		Long review_num = reviewVO.getReview_num();
		
		// ID 정보 세션 가져오기
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		// 리뷰 페이지를 호출할 때 mem_id와 prod_num 값이 있어야 함
		//reviewVO.setMem_id("test1");
		//reviewVO.setProd_num(28L);
		
		// 리뷰를 등록할 지 수정할 지 체크
		int imgExist = productService.checkImg(review_num);
		System.out.println("imgExist: " + imgExist);
		int revExist = productService.checkRev(review_num);
		System.out.println("revExist: " + revExist);
		
		int result;
		
		
		if(revExist>0) result = productService.revUpdate(reviewVO); // 리뷰 수정
		else { // 리뷰 등록
			// DB에 리뷰 저장
			result = productService.reviewReg(reviewVO);
			// 방금 저장한 리뷰 번호 가져오기
			review_num = new Long(productService.getReviewNum());
		}
		
		// 이미지 저장
		// #1. 넘어 온 파일 정보 꺼내기
		MultipartFile mf = request.getFile("img");
		
		// 파일의 확장자 분류
		String ct = mf.getContentType();
		String type = ct.substring(0, ct.indexOf("/"));
		if(!type.equals("image")) { // 파일이 이미지일 경우에만 저장
			System.out.println("이미지 파일이 아닙니다.");
		}else {
			
			// 서버에 파일 저장
			// #2. 파일 저장할 폴더 경로 찾아
			String savePath = request.getRealPath("resources\\reviewImg");
			
			// #3-2. UUID + orgName 
			String orgName = mf.getOriginalFilename();
			UUID uuid = UUID.randomUUID();	// (UUID 형식 : eb877ddd-41d8-41cc-97f9-6c2795391581)
			String newName = uuid + orgName;
			
			// #4. 파일을 실제로 저장 처리 : 내가 만든 파일명과 폴더 전체 경로를 연결해서 그쪽으로 파일을 이동해주는 개념
			String imgPath = savePath + "\\" + newName;
			File f = new File(imgPath);
			try {
				mf.transferTo(f);	// 예외 처리 필요
			}catch(IOException e) {
				e.printStackTrace();
			}

			// 이미지 VO 세팅
			ReviewImgVO reviewImgVO = new ReviewImgVO();
			reviewImgVO.setImg_file_addr(savePath);
			reviewImgVO.setImg_file_name(newName);
			reviewImgVO.setReview_num(review_num);
			
			// 리뷰 이미지 파일 DB 저장
			if(imgExist > 0) productService.revImgUpdate(reviewImgVO); // 이미지 수정
			else productService.revImgReg(reviewImgVO); // 이미지 등록
			model.addAttribute("imgName", newName);
		}
		model.addAttribute("result", result);
		
		return "product/reviewRegPro";
	}
	
	// 리뷰 삭제
	@PostMapping("reviewDelete")
	public String reviewDelete(ProdReviewVO reviewVO, HttpServletRequest request, Model model) {
		Long review_num = reviewVO.getReview_num();
		int result = productService.deleteReview(review_num);
		
		model.addAttribute("result", result);
		
		return "product/reviewDelete";
	}
	
	// 상품 이미지 불러오기
	@PostMapping("getImgAll")
	public ResponseEntity<List<Product_ImgVO>> getProdImg(String prod_num){
		return new ResponseEntity<>(productService.getProdImg(prod_num), HttpStatus.OK);
	}

}
