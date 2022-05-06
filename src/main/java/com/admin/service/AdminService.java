package com.admin.service;

import java.util.List;

import com.admin.domain.FaqTempVO;
import com.admin.domain.FaqVO;
import com.admin.domain.OrderVO;
import com.admin.domain.QnaTempVO;
import com.admin.domain.QnaVO;

public interface AdminService {
	// qna 카테고리 추가
	public void addQna(String cateName);
	//qna temp 카테고리추가
	public void addTempQna(String cateName);
	// faq 카테고리 추가
	public void addFaq(String unreg);
	//faq temp 카테고리 추기
	public void addTempFaq(String cateName);
	// qna 카테고리 리스트 불러오기
	public List<QnaVO> getCate();
	// qna카테고리 temp 리스트 불러오기
	public List<QnaTempVO> getTempCate();
	// faq카테고리 리스트 불러오기
	public List<FaqTempVO> getTempCateFaq();
	// faq카테고리 temp 리스트 불러오기
	public List<FaqVO> getCateFaq();
	//qna카테고리 삭제
	public void removeQna(Integer idx);
	//qna카테고리 temp삭제
	public void removeTempQna(Integer idx);
	// 카테고리 삭제시 리스트 데이터도 삭제
	public void removeQnaList(String cateName);
	//faq카테고리 삭제
	public void removeFaq(Integer idx);
	//faq카테고리 temp 삭제
	public void removeTempFaq(Integer idx);
	// 카테고리 삭제시 리스트 데이터도 삭제
	public void removeFaqList(String cateName);
	// 주문 내역 저장
	public void addOrder(OrderVO order);

}
