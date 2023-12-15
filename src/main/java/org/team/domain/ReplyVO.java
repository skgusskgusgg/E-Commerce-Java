package org.team.domain;

import lombok.Data;

@Data
public class ReplyVO {
	private int reply_id;
	private int rcategory_id;
	private int object_id;
	private int user_id;
	private String writer_name;
	private String title;
	private String content;
	private String regdate;
	private String updatedate;
	private int star;
	private String product_name;
	private String img;
}