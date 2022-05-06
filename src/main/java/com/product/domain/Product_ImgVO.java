package com.product.domain;

import lombok.Data;

@Data
public class Product_ImgVO {
	private Long prod_num;
	private String img_file_name;
	private String img_file_addr;
	private String img_is_thumbnail;
}
