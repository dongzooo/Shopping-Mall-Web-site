package com.admin.service;

import java.util.List;

import com.admin.domain.BoardVO;
import com.admin.domain.Criteria;

public interface BoardService {

	// 전체 글 가져오기 
	public List<BoardVO> getList(); 
	// 글 저장 
	public void register(BoardVO board); 
	// 글 하나 가져오기 
	public BoardVO get(Long board_no); 
	// 글 수정 
	public boolean modify(BoardVO board); 
	// 글 삭제 
	public boolean remove(Long board_no); 
	// 카테고리 결과 가져오기
	public List<BoardVO> categorySearch(BoardVO board); 
	// 전체 글의 개수 가져오기 
	public int getTotal(Criteria cri); 
	
	// 전체글 페이징처리해서 가져오기 
//	public List<BoardVO> getList(Criteria cri);
}
