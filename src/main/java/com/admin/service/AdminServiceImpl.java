package com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.domain.FaqTempVO;
import com.admin.domain.FaqVO;
import com.admin.domain.OrderVO;
import com.admin.domain.QnaTempVO;
import com.admin.domain.QnaVO;
import com.admin.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminMapper adminMapper;

	@Override
	public void addQna(String cateName) {
		adminMapper.addQna(cateName);
	}
	
	@Override
	public void addTempQna(String cateName) {
		adminMapper.addTempQna(cateName);
	}
	
	@Override
	public void addFaq(String unreg) {
		adminMapper.addFaq(unreg);
	}
	
	@Override
	public void addTempFaq(String cateName) {
		adminMapper.addTempFaq(cateName);
	}

	@Override
	public List<QnaVO> getCate() {
		List<QnaVO> result = adminMapper.selectCate();
		return result;
	}
	@Override
	public List<QnaTempVO> getTempCate() {
		List<QnaTempVO> result = adminMapper.selectTempCate();
		return result;
	}
	
	@Override
	public List<FaqTempVO> getTempCateFaq() {
		List<FaqTempVO> result = adminMapper.selectTempCateFaq();
		return result;
	}
	
	@Override
	public List<FaqVO> getCateFaq() {
		List<FaqVO> result = adminMapper.selectCateFaq();
		return result;
	}

	@Override
	public void removeQna(Integer idx) {
		adminMapper.deleteQna(idx);
	}
	
	@Override
	public void removeTempQna(Integer idx) {
		adminMapper.deleteTempQna(idx);
	}
	
	@Override
	public void removeQnaList(String cateName) {
		adminMapper.deleteQnaList(cateName);
	}

	@Override
	public void removeFaq(Integer idx) {
		adminMapper.deleteFaq(idx);
	}
	
	@Override
	public void removeTempFaq(Integer idx) {
		adminMapper.deleteTempFaq(idx);
	}

	@Override
	public void removeFaqList(String cateName) {
		adminMapper.deleteFaqList(cateName);
	}

	@Override
	public void addOrder(OrderVO order) {
		adminMapper.addOrder(order);
	}
}
