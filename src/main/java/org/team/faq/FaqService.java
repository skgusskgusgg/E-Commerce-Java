package org.team.faq;

import java.util.List;

public interface FaqService {
	public List<FaqBoardVO> getList();
	
	public void faqInsert(FaqBoardVO fVO);
	
	public FaqBoardVO faqDetail(int faqId);
	
	public void faqEdit(FaqBoardVO fVO);
	
	public void faqDelete(int faqId);
	
	public int faqCount();
	
	public List<FaqBoardVO> faqListPage(int displayPost, int postNum);
	
	public int updateViewCount(int faqId);
	
	public void faqReplyInsert(FaqReplyVO rVO);
	
	public List<FaqReplyVO> faqReplyList(int faqId);
	
	public void faqReplyDelete(int reply_no);
	
	public void faqReplyUpdate(int reply_no, String comment);
	
	int getFaqReplyCount(int faqId);
	
	List<FaqReplyVO> getFaqRepliesByPage(int faqId, int start, int pageSize);


}
