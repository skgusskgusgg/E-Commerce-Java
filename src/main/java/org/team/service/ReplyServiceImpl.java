package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.ReplyContentVO;
import org.team.domain.ReplyVO;
import org.team.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Override
	public void regist(ReplyVO rVO) {
		mapper.regist(rVO);
	}
	
	@Override
	public void delete(ReplyVO rVO) {
		mapper.delete(rVO);
	}
	
	@Override
	public void update(ReplyVO rVO) {
		mapper.update(rVO);
	}
	
	@Override
	public List<ReplyVO> getObjectReplyList(ReplyContentVO replyContent){
		return mapper.getObjectReplyList(replyContent);
	}
}
