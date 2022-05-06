package com.admin.mapper;

import java.util.List;

import com.admin.domain.BoardVO;
import com.admin.domain.Criteria;

public interface AdminBoardMapper {

	// 글 전체 가져오기 
	public List<BoardVO> getList(); 
	
	// 글 DB에 저장  
	public int insert(BoardVO vo);
	
	public BoardVO read(Long board_no);
	
	// 페이징처리해서 전체 글 가져오기 
//	public List<BoardVO> getListWithPaging(Criteria cri); 
	
	// 전체 글의 개수 가져오기 
	public int getTotalCount(Criteria cri);
	
	// 글 삭제 
	public int delete(Long board_no);
	
	// 글 수정 
	public int update(BoardVO vo);
	
	// 카테고리 검색 결과
	public List<BoardVO> getCategoryList(BoardVO board); 
	
	
	
	
}
