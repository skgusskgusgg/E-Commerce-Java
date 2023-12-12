package org.team.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.team.faq.FaqBoardVO;
import org.team.faq.FaqReplyVO;
import org.team.faq.FaqService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/faq/*")
@Log4j
public class FaqController {
	@Autowired
	private FaqService faqService;
	String uploadDir = "D:/sourceTree/project_1/src/main/webapp/resources/images/faq/";

	@GetMapping("/faqList")
	public void faqList(Model model) throws Exception {
		log.info("FAQList");
		List<FaqBoardVO> list = null;
		list = faqService.getList();
		int count = faqService.faqCount();
		for (int i = 0; i < count; i++) {
			List<String> imgFileNames = new ArrayList<>();
			if (list.get(i).getImg() != null) {
				imgFileNames.addAll(Arrays.asList(list.get(i).getImg().toString().split("/")));
				list.get(i).setImgFiles(imgFileNames);
				log.info(list.get(i));
			}
		}

		model.addAttribute("list", list);

	}

	@GetMapping("/faqDetail")
	public void faqDetail(@RequestParam("faqId") int faqId, Model model) throws Exception {
		log.info("faqDetail");
		FaqBoardVO faqVO = faqService.faqDetail(faqId);
		
		
		if (faqVO.getImg() != null) {
			List<String> imgFileNames = new ArrayList<>();
			imgFileNames.addAll(Arrays.asList(faqVO.getImg().toString().split("/")));
			log.info(imgFileNames);
			faqVO.setImgFiles(imgFileNames);
			log.info("==========");
			log.info(faqVO.getImgFiles().get(0));
		}
		List<FaqReplyVO> reply = faqService.faqReplyList(faqId);
		faqService.updateViewCount(faqId);
		
		model.addAttribute("faqDetail", faqVO);
		model.addAttribute("reply", reply);
	}

	@GetMapping("/writeFaq")
	public void writeForm() {
		log.info("writeFaq");
	}

	@PostMapping("/faqInsert")
	public String faqInsert(FaqBoardVO fVO, Model model, @RequestParam("files") MultipartFile[] files)
			throws Exception {
		log.info("FAQ Insert");

		StringBuilder imgPaths = new StringBuilder();
		log.info("성공");
		String firstImgPath = null;

		for (int i = 0; i < files.length; i++) {
			MultipartFile imgFile = files[i];
			String fileName = "img_" + imgFile.getOriginalFilename(); // 이미지 파일 이름 생성
			log.info("파일추가 : " + fileName);

			// 이미지 파일을 저장할 디렉토리 경로
			try {
				imgFile.transferTo(new File(uploadDir + fileName));
				log.info("복사성공" + imgFile);

				// 첫 번째 이미지 파일 경로 저장
				if (firstImgPath == null) {
					firstImgPath = fileName;
				}

				// 이미지 파일 경로를 StringBuilder에 추가
				imgPaths.append(fileName).append("/");
				log.info(imgPaths);

			} catch (IOException e) {
				e.printStackTrace();
				// 예외 처리 필요
			}
		}
		fVO.setImg(imgPaths.toString());

		faqService.faqInsert(fVO);

		return "redirect:/faq/faqListPage?page=1";
	}

	@GetMapping("/faqInsert")
	public void faqInsert() throws Exception {

	}

	@GetMapping("/faqEdit")
	public void getfaqEdit(@RequestParam("faqId") int faqId, Model model) throws Exception {
		FaqBoardVO faqVO = faqService.faqDetail(faqId);
		model.addAttribute("faqDetail", faqVO);
	}

	@PostMapping("/faqEdit")
	public String postfaqEdit(FaqBoardVO fVO) throws Exception {
		faqService.faqEdit(fVO);
		return "redirect:/faq/faqDetail?faqId=" + fVO.getFaqId();
	}

	@GetMapping("/faqDelete")
	public String getfaqDelete(@RequestParam("faqId") int faqId) throws Exception {
		faqService.faqDelete(faqId);
		return "redirect:/faq/faqListPage?page=1";
	}

	@PostMapping("/faqdeleteSelected2")
	public String deleteSelected2(@RequestParam("deleteList2") List<Integer> faq_ids) {
		for (Integer faqId : faq_ids) {
			faqService.faqDelete(faqId);
		}
		return "redirect:/faq/faqListPage?page=1";
	}

	@GetMapping("/faqListPage")
	public String faqListPage(@RequestParam(name = "page", defaultValue = "1") int page, Model model) throws Exception {
		log.info("faqListPage");
		// 게시물 총 개수
		int count = faqService.faqCount();
		log.info(count);

		// 한 페이지에 출력할 게시물 수
		int postNum = 7;
		log.info(postNum);

		// 하단 페이징 번호 ('게시물 총개수 % 한페이지에 출력할 게시물 수'의 올림)
		int pageNum = (int) Math.ceil((double) count / postNum);
		log.info(pageNum);

		// 출력할 게시물
		int displayPost = (page - 1) * postNum;
		log.info(displayPost);

		// 한번에 표시할 페이징 번호의 개수
		int pageNum_cnt = 7;

		// 표시되는 페이징 번호 중 마지막 번호
		int endPageNum = (int) (Math.ceil((double) page / (double) pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이징 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;

		List<FaqBoardVO> list = faqService.faqListPage(displayPost, postNum);
		
		
		for (FaqBoardVO faq : list) {
			String imagePath = faq.getImg();
			if (imagePath != null) {
				int index = imagePath.indexOf('/');
				String subImagePath = index != -1 ? imagePath.substring(0, index) : imagePath;
				faq.setImg(subImagePath);
			}
		}

		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", page); // 추가된 부분: 현재 페이지 정보 전달

		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		// 현재 페이지
		model.addAttribute("select", page);

		return "/faq/faqList"; // 뷰 페이지의 이름을 반환
	}

	@PostMapping("/faqDetail")
	public String faqInsert(FaqReplyVO rVO, @RequestParam("comment") String comment, @RequestParam("faq_number") int faqNo) throws Exception {
		log.info("faq Reply");
		
		rVO.setFaqId(faqNo);
		rVO.setComment(comment);
		faqService.faqReplyInsert(rVO);
		
		return "redirect:/faq/faqDetail?faqId=" + rVO.getFaqId();
	}
}
