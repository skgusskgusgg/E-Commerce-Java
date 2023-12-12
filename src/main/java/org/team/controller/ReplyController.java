package org.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.team.domain.ReplyContentVO;
import org.team.domain.ReplyVO;
import org.team.member.MemberVO;
import org.team.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reply/*")
@AllArgsConstructor
public class ReplyController {

    private ReplyService rService;
    
    @PostMapping(path = "/getReply", consumes= MediaType.APPLICATION_JSON_VALUE)
    public List<ReplyVO> getObjectReply(@RequestBody ReplyContentVO prepareContent) {

        return getReply(prepareContent);
    }
    
    @PostMapping(path = "/regist", consumes= MediaType.APPLICATION_JSON_VALUE)
    public List<ReplyVO> registReply(@RequestBody ReplyContentVO replyContent,
    										HttpSession session) {

    	MemberVO mVO = (MemberVO)session.getAttribute("mVO");
    	log.info("mVO:"+mVO);
    	int mVOId = mVO.getId();
        if (mVO.getId() != null) {
        	ReplyVO rVO = setRVO(replyContent,mVOId);
        	log.info("rVO:"+rVO);
            rService.regist(rVO);
            
            return getReply(replyContent);
        }
        return null;
    }
    
    @PostMapping(path = "/delete", consumes= MediaType.APPLICATION_JSON_VALUE)
    public List<ReplyVO> deleteReply(@RequestBody ReplyContentVO replyContent,
    										HttpSession session) {

    	MemberVO mVO = (MemberVO)session.getAttribute("mVO");
    	log.info("mVO:"+mVO);
    	int mVOId = mVO.getId();
    	int replyUserId = replyContent.getUser_id();
        if (mVOId == replyUserId) {
        	ReplyVO rVO = setRVO(replyContent,mVOId);
        	log.info("rVO:"+rVO);
            rService.delete(rVO);
            
            return getReply(replyContent);
        }
        return null;
    }
    
    @PostMapping(path = "/update", consumes= MediaType.APPLICATION_JSON_VALUE)
    public List<ReplyVO> updateReply(@RequestBody ReplyContentVO replyContent,
    										HttpSession session) {

    	MemberVO mVO = (MemberVO)session.getAttribute("mVO");
    	log.info("mVO:"+mVO);
    	int mVOId = mVO.getId();
        if (mVO.getId() != null) {
        	ReplyVO rVO = setRVO(replyContent,mVOId);
        	log.info("rVO:"+rVO);
            rService.update(rVO);

            return getReply(replyContent);
        }
        return null;
    }

    private ReplyVO setRVO(ReplyContentVO replyContent,int mVOId) {
    	ReplyVO rVO = new ReplyVO();
    	
    	rVO.setReply_id(replyContent.getReply_id());
    	rVO.setRcategory_id(replyContent.getRcategory_id());
    	rVO.setObject_id(replyContent.getObject_id());
    	rVO.setUser_id(mVOId);
    	rVO.setWriter_name(replyContent.getWriter());
    	rVO.setTitle(replyContent.getTitle());
    	rVO.setContent(replyContent.getContent());
    	rVO.setStar(replyContent.getStar());
    	
    	return rVO;
    }
    private List<ReplyVO> getReply(ReplyContentVO replyContent){
    	return rService.getObjectReplyList(replyContent);
    }
}
