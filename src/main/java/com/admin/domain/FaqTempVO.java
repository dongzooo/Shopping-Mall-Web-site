package com.admin.domain;

import lombok.Data;

@Data
public class FaqTempVO {
	private Long category_num;
	private String category_type;
	private String category_name;
	
	public void setCategory_name(String category_name){
		this.category_name = category_name.trim();
	}
}
