package com.product.domain;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class ProdReviewVO {
	private Long review_num;
	private Long prod_num;
	private String mem_id;
	private String title;
	private String content;
	private Long rating;
	private Timestamp create_date;
	private Timestamp update_date;
}
