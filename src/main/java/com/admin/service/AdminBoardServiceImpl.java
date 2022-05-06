package com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.domain.BoardVO;
import com.admin.domain.Criteria;
import com.admin.mapper.AdminBoardMapper;
import com.admin.mapper.AdminReplyMapper2;

@Service
public class AdminBoardServiceImpl implements BoardService {

	@Autowired
	private AdminBoardMapper boardMapper;
	
	@Autowired
	private AdminReplyMapper2 replyMapper;
	
//	@Override
//	public List<BoardVO> getList(Criteria cri) {
//		//return boardMapper.getList();
//		System.out.println(cri);
//		return boardMapper.getListWithPaging(cri);
//	}
	
	@Override
	public List<BoardVO> getList() {
		return boardMapper.getList();
	}
	
	@Override
	public List<BoardVO> categorySearch(BoardVO board) {
		return boardMapper.getCategoryList(board);
	}
	
	@Override
	public void register(BoardVO board) {
		//System.out.println("service register : " + board);
		int result = boardMapper.insert(board);
		System.out.println("register result : " + result);
	}

	@Override
	public BoardVO get(Long board_no) {
		return boardMapper.read(board_no); 
	}
	@Override
	public boolean remove(Long board_no) {
		// 해당 글의 댓글들 모두 삭제 
		replyMapper.deleteReply(board_no);
		// 본문 글도 삭제 
		return boardMapper.delete(board_no) == 1;
	}

	@Override
	public boolean modify(BoardVO board) {
		return boardMapper.update(board) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}
	
	
	
	
	
}
