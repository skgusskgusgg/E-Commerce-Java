package org.team.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper bm;
	
	// board 불러오기
	@Override
	public List<BoardVO> getList(){
		log.info("getList");
		return bm.getList();
	}
	
	// board 작성
	@Override
	public void boardInsert(BoardVO bVO) {
		log.info("insert");
		bm.boardInsert(bVO);
	}
	
	// 각 board 보기 
	@Override
	public BoardVO boardDetail(int board_id) {
		return bm.boardDetail(board_id);
	}
	
	// 각 board 수정
	@Override
	public void boardEdit(BoardVO bVO) {
		bm.boardEdit(bVO);
	}
	
	// 각 board 삭제
	@Override
	public void boardDelete(int board_id) {
		bm.boardDelete(board_id);
	}
	
	// board 개수 구하기
	@Override
	public int boardCount() {
		return bm.boardCount();
	}
	
	// 목록 + 페이징
	public List<BoardVO> boardListPage(int displayPost, int postNum) {
		return bm.boardListPage(displayPost, postNum);
	}
	
	public int updateView(int board_id) {
		return bm.updateView(board_id);
	}
}
