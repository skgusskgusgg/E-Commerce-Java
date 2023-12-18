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

	public List<FaqBoardVO> faqListPage(@Param("displayPost") int displayPost, @Param("postNum") int postNum);

	public int updateViewCount(int faqId);

	public void faqReplyInsert(FaqReplyVO rVO);

	public List<FaqReplyVO> faqReplyList(int faqId);

	public void faqReplyDelete(int reply_no);

	public void faqReplyUpdate(@Param("reply_no") int reply_no, @Param("comment") String comment);

	int getFaqReplyCount(@Param("faqId") int faqId);

	List<FaqReplyVO> getFaqRepliesByPage(@Param("faqId") int faqId, @Param("start") int start,
			@Param("pageSize") int pageSize);
}
