package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.faq.FAQBoardVO;

public interface FAQBoardMapper {
	public List<FAQBoardVO> getList();
	
	public void faqInsert(FAQBoardVO fVO);
	
	public FAQBoardVO faqDetail(int faqId);
	
	public void faqEdit(FAQBoardVO fVO);
	
	public void faqDelete(int faqId);
	
	public int faqCount();
	
	public List<FAQBoardVO> faqListPage(@Param("displayPost")int displayPost, @Param("postNum")int postNum);
}
