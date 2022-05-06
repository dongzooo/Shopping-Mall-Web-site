package com.admin.domain;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO2 {

	private Long reply_no; 
	private Long board_no; 
	private String reply; 
	private String replyer; 
	private Timestamp replyDate; 
	private Long grp; 
	private Integer step;
	private Integer lev;
	
}
