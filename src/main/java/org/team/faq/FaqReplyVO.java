package org.team.faq;

import lombok.Data;

@Data
public class FaqReplyVO {
	private String reply_no;
	private int faqId;
	private int user_id;
	private String comment;
	private String wDate;
	private String user_name;
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	
	
}
