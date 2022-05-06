package com.admin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FaqCategoryVO {

	private Long faq_cate_num; 
	private String faq_cate_name; 
	
	public void setFaq_cate_name(String faq_cate_name){
		this.faq_cate_name = faq_cate_name.trim();
	}
}






