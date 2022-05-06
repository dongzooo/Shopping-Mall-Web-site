package com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.domain.BoardVO;
import com.admin.domain.Criteria;
import com.admin.mapper.AdminBoardNoticeMapper;
import com.admin.mapper.AdminReplyMapper2;

@Service
public class AdminBoardNoticeServiceImpl implements AdminBoardNoticeService {

	@Autowired
	private AdminBoardNoticeMapper boardMapper;
	@Autowired
	private AdminReplyMapper2 replyMapper;
	
	
	@Override
	public void register(BoardVO board) {
		//System.out.println("service register : " + board);
		int result = boardMapper.insertSelectKey(board);
		System.out.println("register result : " + result);
	}

	@Override
	public BoardVO get(Long bno) {
		return boardMapper.read(bno); 
	}

	@Override
	public boolean modify(BoardVO board) {
		return boardMapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		// 해당 글의 댓글들 모두 삭제 
		replyMapper.deleteReply(bno);
		// 본문 글도 삭제 
		return boardMapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		//return boardMapper.getList();
		System.out.println(cri);
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}
	
	
	
	
	
}
