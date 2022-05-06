package com.admin.domain;

import lombok.Data;

@Data
public class QnaVO {
	private String qna_cate_num;
	private String qna_cate_name;
	
	public void setQna_cate_name(String qna_cate_name){
		this.qna_cate_name = qna_cate_name.trim();
	}
}
