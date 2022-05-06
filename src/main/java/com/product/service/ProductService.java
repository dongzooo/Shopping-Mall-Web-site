package com.product.service;

import java.util.List;

import com.product.domain.ProdReviewVO;
import com.product.domain.ProductVO;
import com.product.domain.Product_ImgVO;
import com.product.domain.ReviewImgVO;

public interface ProductService {

	public int prodReg(ProductVO prdVo);
	
	public int getProdNum();

	public int imgFileSave(int prod_num, List<String> img_file_name_list, String savePath, String thumbNail);

	public int reviewReg(ProdReviewVO reviewVO);

	public int getReviewNum();

	public void revImgReg(ReviewImgVO reviewImgVO);

	public List<ProdReviewVO> getReviewList(int page, Long prodNum);

	public String getReviewCount(Long prodNum);

	public ReviewImgVO getReviewImg(Long reviewNum);

	public int checkImg(Long review_num);

	public void revImgUpdate(ReviewImgVO reviewImgVO);

	public int checkRev(Long review_num);

	public int revUpdate(ProdReviewVO reviewVO);

	public int deleteReview(Long review_num);
	
	// 카테고리에 해당하는 상품 목록 가져오기
	public List<ProductVO> getProductByCategory(Long category, int page);
	// 썸네일 이미지 가져오기
	public Product_ImgVO getThumbImg(Long prod_num);
	// 해당 카테고리의 상품 총 개수
	public int countPage(Long category);
	// 상품 이미지 전부 불러오기
	public List<Product_ImgVO> getProdImg(String prod_num);

	public ProductVO getProdInfo(String prod_num);

}
