package com.admin.mapper;

import java.util.List;

import com.admin.domain.FaqBoardVO;
import com.admin.domain.TempCategoryVO;
import com.admin.domain.Criteria;
import com.admin.domain.FaqCategoryVO;

public interface AdminBoardFAQMapper {

	// 글 전체 가져오기 
	public List<FaqBoardVO> getList(); 
	
	// 카테고리 전체 가져오기 
	public List<FaqCategoryVO> getCategoryData(); 
	
	// 카테고리 전체 가져오기 
	public List<TempCategoryVO> getTempCategoryData(); 
	
	// 글 DB에 저장  
	public int insert(FaqBoardVO vo);
	
	public FaqBoardVO read(Long board_no);
	
	// 페이징처리해서 전체 글 가져오기 
//	public List<FaqVO> getListWithPaging(Criteria cri); 
	
	// 전체 글의 개수 가져오기 
	public int getTotalCount(Criteria cri);
	
	// 글 삭제 
	public int delete(Long board_no);
	
	// 글 수정 
	public int update(FaqBoardVO vo);
	
	// 카테고리 검색 결과
	public List<FaqBoardVO> getCategoryList(FaqBoardVO board); 
	
	
	
	
}
