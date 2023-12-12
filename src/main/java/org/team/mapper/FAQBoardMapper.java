package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.faq.FaqBoardVO;
import org.team.faq.FaqReplyVO;

public interface FaqBoardMapper {
	public List<FaqBoardVO> getList();
	
	public void faqInsert(FaqBoardVO fVO);
	
	public FaqBoardVO faqDetail(int faqId);
	
	public void faqEdit(FaqBoardVO fVO);
	
	public void faqDelete(int faqId);
	
	public int faqCount();
	
	public List<FaqBoardVO> faqListPage(@Param("displayPost")int displayPost, @Param("postNum")int postNum);
	
	public int updateViewCount(int faqId);
	
	public void faqReplyInsert(FaqReplyVO rVO);
	
	public List<FaqReplyVO> faqReplyList(int faqId);
}
