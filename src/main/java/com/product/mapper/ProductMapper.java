package com.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.product.domain.ProdReviewVO;
import com.product.domain.ProductVO;
import com.product.domain.Product_ImgVO;
import com.product.domain.ReviewImgVO;

public interface ProductMapper {

	public int RegisProd(ProductVO prdVo);

	public int getNumofProd();

	public int SaveImg(Product_ImgVO imgVO);

	public int reg_review(ProdReviewVO reviewVO);

	public int getNumOfReview();

	public void regRevImg(ReviewImgVO reviewImgVO);

	public List<ProdReviewVO> getListOfReview(@Param("page") int page, @Param("prodNum") Long prodNum);

	public String getCountOfReview(@Param("prodNum") Long prodNum);

	public ReviewImgVO getImgOfReview(@Param("reviewNum")Long reviewNum);

	public int imgCheck(Long review_num);

	public void updateImg(ReviewImgVO reviewImgVO);

	public int revCheck(Long review_num);

	public int updateRev(ProdReviewVO reviewVO);

	public int removeReview(Long review_num);

	public List<ProductVO> productListOfCategory(@Param("category") Long category, @Param("page") int page);

	public Product_ImgVO ThumbnailGetter(@Param("prod_num") Long prod_num);

	public int CountTotPage(Long category);

	public List<Product_ImgVO> getProdImg(String prod_num);

	public ProductVO getProdInfo(String prod_num);

}
