package com.admin.service;

import java.util.List;

import com.admin.domain.FaqBoardVO;
import com.admin.domain.TempCategoryVO;
import com.admin.domain.Criteria;
import com.admin.domain.FaqCategoryVO;

public interface BoardFAQService {
	// 전체 글 가져오기 
	public List<FaqBoardVO> getList(); 
	// 글 저장 
	public void register(FaqBoardVO board); 
	// 글 하나 가져오기 
	public FaqBoardVO get(Long board_no); 
	// 글 수정 
	public boolean modify(FaqBoardVO board); 
	// 글 삭제 
	public boolean remove(Long board_no); 
	// 카테고리 검색 결과 가져오기
	public List<FaqBoardVO> categorySearch(FaqBoardVO board); 
	// 카테고리 목록 가져오기
	public List<FaqCategoryVO> getCategory(); 
	// 카테고리 
	public List<TempCategoryVO> getTempCategory(); 
	// 전체 글의 개수 가져오기
	public int getTotal(Criteria cri); 
	
	
	
	// 전체글 페이징처리해서 가져오기 
//	public List<FaqVO> getList(Criteria cri);
}
