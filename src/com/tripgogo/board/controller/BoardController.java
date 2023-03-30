package com.tripgogo.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripgogo.board.model.BoardDto;
import com.tripgogo.board.model.service.BoardService;
import com.tripgogo.board.model.service.BoardServiceImpl;


@WebServlet("/board")
public class BoardController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private BoardService boardService;
    
    @Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		boardService = BoardServiceImpl.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String path = "";
		if ("list".equals(action)) {
			path = list(request, response);
			forward(request, response, path);
		} else if ("view".equals(action)) {
			path = view(request, response);
			forward(request, response, path);
		} else if ("mvwrite".equals(action)) {
			path = "/board/write.jsp";
			redirect(request, response, path);
		} else if ("write".equals(action)) {
			path = write(request, response);
			redirect(request, response, path);
		} else if ("mvmodify".equals(action)) {
			path = mvModify(request, response);
			forward(request, response, path);
		} else if ("modify".equals(action)) {
			path = modify(request, response);
			forward(request, response, path);
		} else if ("delete".equals(action)) {
			path = delete(request, response);
			redirect(request, response, path);
		} else {
			redirect(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private String list(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<BoardDto> list = boardService.listArticle();
			request.setAttribute("articles", list);
			return "/board/board.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	private String view(HttpServletRequest request, HttpServletResponse response) {
		int articleNo = Integer.parseInt(request.getParameter("articleno"));
		try {
			BoardDto boardDto = boardService.getArticle(articleNo);
			request.setAttribute("article", boardDto);
			return "/board/view.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	private String write(HttpServletRequest request, HttpServletResponse response) {
		BoardDto boardDto = new BoardDto();
//		boardDto.setUserId(memberDto.getUserId());
		boardDto.setUserId("ssafy");
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setContent(request.getParameter("content"));
		try {
			boardService.writeArticle(boardDto);
			return "/board?action=list";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	private String delete(HttpServletRequest request, HttpServletResponse response) {
		int articleNo = Integer.parseInt(request.getParameter("articleno"));
		try {
			boardService.deleteArticle(articleNo);
			return "/board?action=list";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private String modify(HttpServletRequest request, HttpServletResponse response) {
		BoardDto boardDto = new BoardDto();
//		boardDto.setUserId(memberDto.getUserId());
		boardDto.setUserId("ssafy");
		boardDto.setArticleNo(Integer.parseInt(request.getParameter("articleno")));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setContent(request.getParameter("content"));
		try {
			boardService.modifyArticle(boardDto);
			return "/board?action=list";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private String mvModify(HttpServletRequest request, HttpServletResponse response) {
		int articleNo = Integer.parseInt(request.getParameter("articleno"));
		try {
			BoardDto boardDto = boardService.getArticle(articleNo);
			request.setAttribute("article", boardDto);
			return "/board/modify.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

}
