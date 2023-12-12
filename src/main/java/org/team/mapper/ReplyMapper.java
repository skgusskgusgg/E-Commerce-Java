package org.team.mapper;

import java.util.List;

import org.team.domain.ReplyContentVO;
import org.team.domain.ReplyVO;

public interface ReplyMapper {

	public void regist(ReplyVO rVO);

	public void delete(ReplyVO rVO);

	public void update(ReplyVO rVO);
	
	public List<ReplyVO> getObjectReplyList(ReplyContentVO replyContent);

}
 