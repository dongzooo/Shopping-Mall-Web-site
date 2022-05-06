package com.admin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FaqBoardVO {

	private Long board_no; 
	private String board_title; 
	private String board_content;
	private Date create_date; 
	private Date update_date;
	private String category;
	
	public void setCategory(String category){
		this.category = category.trim();
	}
	
}






