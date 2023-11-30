package org.team.faq;

import java.util.List;

public interface FAQService {
	public List<FAQBoardVO> getList();
	
	public void faqInsert(FAQBoardVO fVO);
	
	public FAQBoardVO faqDetail(int faqId);
	
	public void faqEdit(FAQBoardVO fVO);
	
	public void faqDelete(int faqId);
	
	public int faqCount();
	
	public List<FAQBoardVO> faqListPage(int displayPost, int postNum);
}
