package com.admin.mapper;

import java.util.List;

import com.admin.domain.FaqTempVO;
import com.admin.domain.FaqVO;
import com.admin.domain.OrderVO;
import com.admin.domain.QnaTempVO;
import com.admin.domain.QnaVO;

public interface AdminMapper {

	public void addQna(String cateName);
	
	public void addTempQna(String cateName);

	public void addFaq(String unreg);
	
	public void addTempFaq(String cateName);
	
	public List<QnaVO> selectCate();
	
	public List<QnaTempVO> selectTempCate();
	
	public List<FaqTempVO> selectTempCateFaq();

	public List<FaqVO> selectCateFaq();

	public void deleteQna(Integer idx);
	
	public void deleteTempQna(Integer idx);
	
	public void deleteQnaList(String cateName);
	

	public void deleteFaq(Integer idx);
	
	public void deleteTempFaq(Integer idx);
	
	public void deleteFaqList(String cateName);

	public void addOrder(OrderVO order);
	
}
