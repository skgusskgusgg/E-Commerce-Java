package org.team.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.team.faq.FaqBoardVO;
import org.team.faq.FaqReplyVO;
import org.team.faq.FaqService;
import org.team.member.MemberVO;

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
	public void faqDetail(@RequestParam("faqId") int faqId,
			@RequestParam(name = "replyPage", defaultValue = "1") int replyPage, Model model) {
		log.info("faqDetail");

		FaqBoardVO faqVO = faqService.faqDetail(faqId);

		if (faqVO.getImg() != null) {
			List<String> imgFileNames = Arrays.asList(faqVO.getImg().toString().split("/"));
			log.info(imgFileNames);
			faqVO.setImgFiles(new ArrayList<>(imgFileNames));
			log.info("==========");
		}

		// 댓글 페이징
		int replyCount = faqService.getFaqReplyCount(faqId);
		int replyPageSize = 5;
		int replyButtonCount = 5;

		// replyPageNum 계산
		int replyPageNum = (int) Math.ceil((double) replyCount / replyPageSize);

		// replyEndPageNum 계산
		int replyEndPageNum = calculateEndPageNum(replyPage, replyCount, replyButtonCount);

		// replyStartPageNum 계산
		int replyStartPageNum = replyEndPageNum - (replyButtonCount - 1);

		// 첫 번째 페이지 처리
		if (replyStartPageNum <= 0) {
			replyStartPageNum = 1;
		}

		int endPageNum_tmp = (int) (Math.ceil((double) replyCount / (double) replyButtonCount));

		// replyEndPageNum이 실제 끝 페이지를 초과하지 않도록 보정
		replyEndPageNum = Math.min(replyEndPageNum, endPageNum_tmp);

		List<FaqReplyVO> reply = Collections.emptyList();

		// 댓글이 있는 경우에만 조회
		if (replyCount > 0) {
			reply = faqService.getFaqRepliesByPage(faqId, (replyPage - 1) * replyPageSize, replyPageSize);
		}

		// 서비스 계층에서 뷰 카운트 업데이트 처리
		faqService.updateViewCount(faqId);

		model.addAttribute("faqDetail", faqVO);
		model.addAttribute("reply", reply);
		model.addAttribute("replyPageNum", replyPageNum);
		model.addAttribute("replyCurrentPage", replyPage);
		model.addAttribute("replyStartPageNum", replyStartPageNum);
		model.addAttribute("replyEndPageNum", replyEndPageNum);
		model.addAttribute("replySelect", replyPage);

	}

	private int calculateEndPageNum(int replyPage, int replyCount, int replyButtonCount) {
		return (int) (Math.ceil((double) replyPage / (double) replyButtonCount) * replyButtonCount);
	}

	@GetMapping("/writeFaq")
	public void writeForm() {
		log.info("writeFaq");
	}

	@PostMapping("/faqInsert")
	public String faqInsert(FaqBoardVO fVO, Model model, @RequestParam("files") MultipartFile[] files,
			HttpSession session) throws Exception {
		log.info("FAQ Insert");
		MemberVO memberVO = (MemberVO) session.getAttribute("mVO");
		StringBuilder imgPaths = new StringBuilder();
		log.info("성공");

		for (int i = 0; i < files.length; i++) {
			MultipartFile imgFile = files[i];
			String fileName = "img_" + imgFile.getOriginalFilename(); // 이미지 파일 이름 생성
			log.info("파일추가 : " + fileName);

			// 이미지 파일을 저장할 디렉토리 경로
			try {
				imgFile.transferTo(new File(uploadDir + fileName));
				log.info("복사성공" + imgFile);

				// 이미지 파일 경로를 StringBuilder에 추가
				imgPaths.append(fileName).append("/");
				log.info(imgPaths);

			} catch (IOException e) {
				e.printStackTrace();
				// 예외 처리 필요
			}
		}

		fVO.setImg(imgPaths.toString());
		fVO.setUser_id(memberVO.getId());
		faqService.faqInsert(fVO);

		return "redirect:/faq/faqListPage?page=1";
	}

	@GetMapping("/faqInsert")
	public void faqInsert() throws Exception {

	}

	@GetMapping("/faqEdit")
	public void getfaqEdit(@RequestParam("faqId") int faqId, Model model) throws Exception {
		log.info("GET Edit");
		FaqBoardVO faqVO = null;
		faqVO = faqService.faqDetail(faqId);
		log.info(faqVO);
		if (faqVO.getImg() != null) {
			List<String> imgFileNames = new ArrayList<>();
			imgFileNames.addAll(Arrays.asList(faqVO.getImg().toString().split("/")));
			log.info(imgFileNames);
			faqVO.setImgFiles(imgFileNames);
			log.info("==========");
		}

		model.addAttribute("faqDetail", faqVO);
	}

	@PostMapping("/faqEdit")
	public String postfaqEdit(@RequestParam(value = "files", required = false) List<MultipartFile> files,
			@RequestParam("originalImg_faq") String originalImg_faq, @ModelAttribute("faqDetail") FaqBoardVO fVO)
			throws IOException {
		System.out.println("POST Edit");
		log.info(fVO);
		StringBuilder imgPaths = new StringBuilder();
		String temp_img = originalImg_faq;

		if (files != null && !files.isEmpty()) {
			for (MultipartFile imgFile : files) {
				if (imgFile != null && !imgFile.isEmpty()) {
					String fileName = "img_" + imgFile.getOriginalFilename(); // 이미지 파일 이름 생성

					try {
						imgFile.transferTo(new File(uploadDir + fileName));
						System.out.println("복사 성공: " + fileName);

						imgPaths.append(fileName).append("/");
					} catch (IOException e) {
						e.printStackTrace();
						// 예외 처리 필요
					}
					fVO.setImg(imgPaths.toString());
					log.info(fVO.getImg());
					log.info("A");
				} else {
					fVO.setImg(temp_img);
					log.info(fVO.getImg());
					log.info("B: temp_img = " + temp_img); // 디버깅용 로그 추가
				}

			}
		}

		if (fVO.getImg() != null) {
			List<String> imgFileNames = new ArrayList<>();
			imgFileNames.addAll(Arrays.asList(fVO.getImg().toString().split("/")));
			log.info(imgFileNames);
			fVO.setImgFiles(imgFileNames);
			log.info("==========");
		}

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

	@PostMapping("/faqReplyInsert")
	public String faqReplyInsert(FaqReplyVO rVO, @RequestParam("comment") String comment,
			@RequestParam("faq_number") int faqNo, HttpSession session) throws Exception {
		log.info("faq Reply");

		MemberVO memberVO = (MemberVO) session.getAttribute("mVO");
		if (memberVO != null) {
			rVO.setUser_id(memberVO.getId());
		}
		rVO.setFaqId(faqNo);
		rVO.setComment(comment);
		faqService.faqReplyInsert(rVO);

		return "redirect:/faq/faqDetail?faqId=" + rVO.getFaqId();
	}

	@PostMapping("/faqReplyDelete")
	public String faqReplyDelete(@RequestParam("reply_no") int reply_no, FaqReplyVO rVO) throws Exception {
		faqService.faqReplyDelete(reply_no);
		return "redirect:/faq/faqDetail?faqId=" + rVO.getFaqId();
	}

	@PostMapping("/faqReplyUpdate")
	public String faqReplyUpdate(@RequestParam("reply_no") int reply_no, @RequestParam("comment") String comment,
			FaqReplyVO rVO) {
		faqService.faqReplyUpdate(reply_no, comment);
		return "redirect:/faq/faqDetail?faqId=" + rVO.getFaqId();
	}
}
