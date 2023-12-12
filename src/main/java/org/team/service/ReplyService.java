package org.team.service;

import java.util.List;

import org.team.domain.ReplyContentVO;
import org.team.domain.ReplyVO;

public interface ReplyService {

	public void regist(ReplyVO rVO);
	
	public void delete(ReplyVO rVO);
	
	public void update(ReplyVO rVO);
	
	public List<ReplyVO> getObjectReplyList(ReplyContentVO replyContent);
	
	

}
