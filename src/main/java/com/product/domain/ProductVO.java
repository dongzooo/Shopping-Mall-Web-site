package com.product.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductVO {
	private Long prod_num;
	private Long category_code;
	private String prod_name;
	private String prod_seller;
	private Long prod_price;
	private Long prod_stock;
	private String prod_desc;
	private Timestamp prod_regist_date;
	private Long prod_hits;
	private Long prod_sale_status;
}
