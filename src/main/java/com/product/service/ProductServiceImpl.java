package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.domain.ProdReviewVO;
import com.product.domain.ProductVO;
import com.product.domain.Product_ImgVO;
import com.product.domain.ReviewImgVO;
import com.product.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductMapper productMapper;
	
	@Override
	public int prodReg(ProductVO prdVo) {
		int result = productMapper.RegisProd(prdVo);
		return result;
	}

	@Override
	public int getProdNum() {
		int result = productMapper.getNumofProd();
		return result;
	}

	@Override
	public int imgFileSave(int prod_num, List<String> img_file_name_list, String savePath, String thumbNail) {
		int result = 0;
		// prod_num Long타입으로 형변환
		Long prod_numL = new Long(prod_num);
		
		// 이미지 파일 수 만큼 반복
		for(int i = 0; i < img_file_name_list.size(); i++) {
			String is_thumbnail = "n";
			// 반복 마다 Product_ImgVO 객체 생성
			Product_ImgVO imgVO = new Product_ImgVO();
			// 썸네일 이미지 체크
			if(img_file_name_list.get(i).equals(thumbNail)) {
				is_thumbnail = "y";
			}
			imgVO.setProd_num(prod_numL);
			imgVO.setImg_file_name(img_file_name_list.get(i));
			imgVO.setImg_file_addr(savePath);
			imgVO.setImg_is_thumbnail(is_thumbnail);
			// 이미지 파일 저장 쿼리 실행
			result = productMapper.SaveImg(imgVO);
			// 저장 실패 시 종료
			if(result != 1) return 0;
		}
		return result;
	}

	@Override
	public int reviewReg(ProdReviewVO reviewVO) {
		int result = productMapper.reg_review(reviewVO);
		return result;
	}

	@Override
	public int getReviewNum() {
		int num = productMapper.getNumOfReview();
		return num;
	}

	@Override
	public void revImgReg(ReviewImgVO reviewImgVO) {
		productMapper.regRevImg(reviewImgVO);
	}

	@Override
	public List<ProdReviewVO> getReviewList(int page, Long prodNum) {
		return productMapper.getListOfReview(page, prodNum);
	}

	@Override
	public String getReviewCount(Long pageNum) {
		return productMapper.getCountOfReview(pageNum);
	}

	@Override
	public ReviewImgVO getReviewImg(Long reviewNum) {
		return productMapper.getImgOfReview(reviewNum);
	}

	@Override
	public int checkImg(Long review_num) {
		return productMapper.imgCheck(review_num);
	}

	@Override
	public void revImgUpdate(ReviewImgVO reviewImgVO) {
		productMapper.updateImg(reviewImgVO);
	}

	@Override
	public int checkRev(Long review_num) {
		return productMapper.revCheck(review_num);
	}

	@Override
	public int revUpdate(ProdReviewVO reviewVO) {
		return productMapper.updateRev(reviewVO);
	}

	@Override
	public int deleteReview(Long review_num) {
		return productMapper.removeReview(review_num);
	}

	@Override
	public List<ProductVO> getProductByCategory(Long category, int page) {
		return productMapper.productListOfCategory(category, page);
	}

	@Override
	public Product_ImgVO getThumbImg(Long prod_num) {
		return productMapper.ThumbnailGetter(prod_num);
	}

	@Override
	public int countPage(Long category) {
		return productMapper.CountTotPage(category);
	}

	@Override
	public List<Product_ImgVO> getProdImg(String prod_num) {
		return productMapper.getProdImg(prod_num);
	}

	@Override
	public ProductVO getProdInfo(String prod_num) {
		return productMapper.getProdInfo(prod_num);
	}

}
