package org.team.faq;

import lombok.Data;

@Data
public class FAQBoardVO {
	private int faqId;
	private String faqTitle;
	private String faqContents;
	private String user_id;
	private String regdate;
	private String updateDate;
	private String img;
	private String viewCount;
}
