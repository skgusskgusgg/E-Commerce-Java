package org.team.domain;

import lombok.Data;

@Data
public class ReplyContentVO {
	private int reply_id;
	private int rcategory_id;
	private int object_id;
	private int user_id;
	private String writer;
	private String title;
	private String content;
	private int star;
}