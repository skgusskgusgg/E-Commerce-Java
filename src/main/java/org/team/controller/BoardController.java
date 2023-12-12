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
import org.team.board.BoardService;
import org.team.board.BoardVO;
import org.team.faq.FaqBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	@Autowired
	private BoardService bs;
	String uploadDir = "D:/sourceTree/project_1/src/main/webapp/resources/images/board/";
	
	@GetMapping("/boardList")
	public void boardList(Model model) throws Exception {
		log.info("boardList");
		List<BoardVO> list = null;
		list = bs.getList();
		int count = bs.boardCount();
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

	@GetMapping("/boardDetail")
	public void boardDetail(@RequestParam("board_id") int board_id, Model model) throws Exception {
		log.info("boardDetail");
		BoardVO boardVO = bs.boardDetail(board_id);
		
		bs.updateView(board_id);
		model.addAttribute("boardDetail", boardVO);
	}

	@GetMapping("/boardWrite")
	public void writeForm() {
		log.info("boardWrite");
	}

	@PostMapping("/boardInsert")
	public String boardInsert(BoardVO bVO, Model model, @RequestParam("files") MultipartFile[] files) throws Exception {
		log.info("boardInsert");

		StringBuilder imgPaths = new StringBuilder();
		String firstImgPath = null;

		for (int i = 0; i < files.length; i++) {
			MultipartFile imgFile = files[i];
			String fileName = "img_" + imgFile.getOriginalFilename(); // 이미지 파일 이름 생성
			log.info("파일추가 : " + fileName);
			
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

		bVO.setImg(imgPaths.toString());
		
		bs.boardInsert(bVO);
		return "redirect:/board/boardList";
	}

	@GetMapping("/boardInsert")
	public void boardInsert() throws Exception {

	}

	@GetMapping("/boardEdit")
	public void getboardEdit(@RequestParam("board_id") int board_id, Model model) throws Exception {
		BoardVO boardVO = bs.boardDetail(board_id);
		model.addAttribute("boardDetail", boardVO);
	}

	@PostMapping("/boardEdit")
	public String postboardEdit(BoardVO bVO) throws Exception {
		bs.boardEdit(bVO);
		return "redirect:/board/boardDetail?board_id=" + bVO.getBoard_id();
	}

	@GetMapping("/boardDelete")
	public String getboardDelete(@RequestParam("board_id") int board_id) throws Exception {
		bs.boardDelete(board_id);
		return "redirect:/board/boardListPage?page=1";
	}

	@PostMapping("/deleteSelected")
	public String deleteSelected(@RequestParam("deleteList") List<Integer> board_ids) {
		for (Integer board_id : board_ids) {
			bs.boardDelete(board_id);
		}
		return "redirect:/board/boardListPage?page=1";
	}

	@GetMapping("/boardListPage")
	public String boardListPage(@RequestParam(name = "page", defaultValue = "1") int page, Model model)
			throws Exception {
		log.info("boardListPage");

		// 게시물 총 개수
		int count = bs.boardCount();
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

		List<BoardVO> list = bs.boardListPage(displayPost, postNum);
		for (BoardVO board : list) {
	        String imagePath = board.getImg();
	        if (imagePath != null) {
	        	int index = imagePath.indexOf('/');
		        String subImagePath = index != -1 ? imagePath.substring(0, index) : imagePath;
		        board.setImg(subImagePath);
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

		return "/board/boardList"; // 뷰 페이지의 이름을 반환
	}
}
