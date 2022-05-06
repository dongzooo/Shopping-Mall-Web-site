package com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.domain.Criteria;
import com.admin.domain.ReplyPageDTO;
import com.admin.domain.ReplyVO2;
import com.admin.mapper.AdminReplyMapper2;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminReplyServiceImpl2 implements ReplyService2 {

	@Autowired
	private AdminReplyMapper2 replyMapper;
	
	
	@Override
	public int register(ReplyVO2 vo) {
		log.info("register vo : " + vo);
		return replyMapper.insert(vo);
	}

	@Override
	public int addReply(ReplyVO2 vo) {
		log.info("addReply vo : " + vo);
		// 기존에 댓글에 달린 답글들이 있다면, 
		// 그 답글들의 step 을 하나씩 올려주고, 
		replyMapper.updateStep(vo); 
		// 방금 받은 데이터 추가 
		vo.setStep(vo.getStep()+1);
		vo.setLev(vo.getLev()+1);
		log.info("addReply vo : " + vo);
		int result = replyMapper.addReReply(vo);
		
		return result;
	}
	
	@Override
	public ReplyVO2 get(Long reply_no) {
		log.info("get reply_no : " + reply_no);
		return replyMapper.read(reply_no);
	}

	@Override
	public int modify(ReplyVO2 vo) {
		log.info("modify vo : " + vo);
		return replyMapper.update(vo);
	}

	@Override
	public int remove(Long reply_no) {
		log.info("remove reply_no : " + reply_no);
		return replyMapper.delete(reply_no);
	}

	@Override
	public List<ReplyVO2> getList(Long board_no, Criteria cri) {
		log.info("get reply list board_no : " + board_no);
		log.info("get reply list cri : " + cri);
		return replyMapper.getListWithPaging(board_no, cri);
	}

	// #3. 댓글 페이징 DTO 로 리턴해주는 댓글 목록 조회 
	@Override
	public ReplyPageDTO getListPage(Long board_no, Criteria cri) {
		// ReplyPageDTO 객체생성해서 리턴 
		// 생성자 매개변수 1 : 전체 댓글의 개수 조회해서 넣기 
		// 생성자 매개변수 2 : 해당 페이지에 보여줄 댓글 목록 가져와 담기 
		return new ReplyPageDTO(replyMapper.getRepCount(board_no), replyMapper.getListWithPaging(board_no, cri));
	}


	
	
}
