package com.admin.domain;

import lombok.Data;

@Data
public class OrderVO {
	private int order_num;
	private String mem_id;
	private String delivery_addr;
	private String receiver_name;
	private String receiver_tel;
	private int prod_num;
}
