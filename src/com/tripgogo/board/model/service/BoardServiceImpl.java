package com.tripgogo.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tripgogo.board.model.BoardDto;
import com.tripgogo.board.model.dao.BoardDao;
import com.tripgogo.board.model.dao.BoardDaoImpl;

public class BoardServiceImpl implements BoardService {
	
	private static BoardService boardService = new BoardServiceImpl();
	private BoardDao boardDao;
	
	private BoardServiceImpl() {
		boardDao = BoardDaoImpl.getInstance();
	}
	
	public static BoardService getInstance() {
		return boardService;
	}

	@Override
	public void writeArticle(BoardDto boardDto) throws Exception {
		boardDao.writeArticle(boardDto);
	}

	@Override
	public List<BoardDto> listArticle() throws Exception {
		return boardDao.listArticle();
	}

	@Override
	public BoardDto getArticle(int articleNo) throws Exception {
		return boardDao.getArticle(articleNo);
	}

	@Override
	public void updateHit(int articleNo) throws Exception {
		boardDao.updateHit(articleNo);
	}

	@Override
	public void modifyArticle(BoardDto boardDto) throws Exception {
		boardDao.modifyArticle(boardDto);
	}

	@Override
	public void deleteArticle(int articleNo) throws Exception {
		boardDao.deleteArticle(articleNo);
	}

}
