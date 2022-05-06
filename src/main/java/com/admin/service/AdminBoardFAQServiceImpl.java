package com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.domain.FaqBoardVO;
import com.admin.domain.TempCategoryVO;
import com.admin.domain.Criteria;
import com.admin.domain.FaqCategoryVO;
import com.admin.mapper.AdminBoardFAQMapper;
import com.admin.mapper.AdminBoardMapper;
import com.admin.mapper.AdminReplyMapper2;

@Service
public class AdminBoardFAQServiceImpl implements BoardFAQService {

	@Autowired
	private AdminBoardFAQMapper boardMapper;
	
	@Autowired
	private AdminReplyMapper2 replyMapper;
	
//	@Override
//	public List<FaqVO> getList(Criteria cri) {
//		//return boardMapper.getList();
//		System.out.println(cri);
//		return boardMapper.getListWithPaging(cri);
//	}
	
	@Override
	public List<FaqBoardVO> getList() {
		System.out.println("여기");
		return boardMapper.getList();
	}
	
	@Override
	public List<FaqCategoryVO> getCategory() {
		return boardMapper.getCategoryData();
	}
	
	@Override
	public List<TempCategoryVO> getTempCategory() {
		return boardMapper.getTempCategoryData();
	}
	
	@Override
	public List<FaqBoardVO> categorySearch(FaqBoardVO board) {
		return boardMapper.getCategoryList(board);
	}
	
	@Override
	public void register(FaqBoardVO board) {
		//System.out.println("service register : " + board);
		int result = boardMapper.insert(board);
		System.out.println("register result : " + result);
	}

	@Override
	public FaqBoardVO get(Long board_no) {
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
	public boolean modify(FaqBoardVO board) {
		return boardMapper.update(board) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}
	
	
	
	
	
}
