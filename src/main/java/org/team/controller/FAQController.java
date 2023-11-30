package org.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.faq.FAQBoardVO;
import org.team.faq.FAQService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/faq/*")
@Log4j
public class FAQController {
	@Autowired
	private FAQService FAQservice;

	@GetMapping("/faqList")
	public void faqList(Model model) {
		log.info("FAQList");
		List<FAQBoardVO> list = null;
		list = FAQservice.getList();
		model.addAttribute("list", list);
	}

	@GetMapping("/faqDetail")
	public void faqDetail(@RequestParam("faqId") int faqId, Model model) throws Exception {
		log.info("faqDetail");
		FAQBoardVO faqVO = FAQservice.faqDetail(faqId);
		model.addAttribute("faqDetail", faqVO);
	}

	@GetMapping("/writeFAQs")
	public void writeForm() {

	}

	@PostMapping("/faqInsert")
	public String faqInsert(FAQBoardVO fVO, Model model) throws Exception {
		log.info("FAQ Insert");
		FAQservice.faqInsert(fVO);
		return "redirect:/faq/faqList";
	}

	@GetMapping("/faqInsert")
	public void faqInsert() {

	}

	@GetMapping("/faqEdit")
	public void getfaqEdit(@RequestParam("faqId") int faqId, Model model) throws Exception {
		FAQBoardVO faqVO = FAQservice.faqDetail(faqId);
		model.addAttribute("faqDetail", faqVO);
	}

	@PostMapping("/faqEdit")
	public String postfaqEdit(FAQBoardVO fVO) throws Exception {
		FAQservice.faqEdit(fVO);
		return "redirect:/faq/faqDetail?faqId=" + fVO.getFaqId();
	}
	
	@GetMapping("/faqDelete")
	public String getfaqDelete(@RequestParam("faqId") int faqId) throws Exception {
		FAQservice.faqDelete(faqId);
		return "redirect:/faq/faqList";
	}
	
	@GetMapping("/faqListPage")
	public String faqListPage(@RequestParam(name = "page", defaultValue = "1") int page, Model model) throws Exception {
	    log.info("faqListPage");

	    int count = FAQservice.faqCount();
	    log.info(count);
	    int postNum = 7;
	    log.info(postNum);
	    int pageNum = (int) Math.ceil((double) count / postNum);
	    log.info(pageNum);
	    int displayPost = (page - 1) * postNum; // 수정된 부분: 페이지 계산 로직 변경
	    if (displayPost < 1) {
	    	displayPost = 1;
	    }
	    log.info(displayPost);
	    List<FAQBoardVO> list = FAQservice.faqListPage(displayPost, postNum);
	    model.addAttribute("list", list);
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", page); // 추가된 부분: 현재 페이지 정보 전달

	    return "faq/faqList"; // 뷰 페이지의 이름을 반환
	}
}
