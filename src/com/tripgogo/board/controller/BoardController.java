package com.tripgogo.board.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripgogo.board.model.BoardDto;
import com.tripgogo.board.model.service.BoardService;
import com.tripgogo.board.model.service.BoardServiceImpl;
import com.tripgogo.user.model.UserDto;
import com.tripgogo.util.PageNavigation;
import com.tripgogo.util.ParameterCheck;


@WebServlet("/board")
public class BoardController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private int pgno;
	private String key;
	private String word;
	private String queryString;
	private BoardService boardService;
    
    @Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		boardService = BoardServiceImpl.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		pgno = ParameterCheck.notNumberToOne(request.getParameter("pgno"));
		key = ParameterCheck.nullToBlank(request.getParameter("key"));
		word = ParameterCheck.nullToBlank(request.getParameter("word"));
		queryString = "?pgno=" + pgno + "&key=" + key + "&word=" + URLEncoder.encode(word, "utf-8");
		String path = "";
		if ("list".equals(action)) {
			path = list(request, response);
			forward(request, response, path);
		} else if ("view".equals(action)) {
			path = view(request, response);
			forward(request, response, path);
		} else if ("mvwrite".equals(action)) {
			path = mvwrite(request, response);
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

	private String mvwrite(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userinfo");
		if (userDto!=null) {
			return "/board/write.jsp";
		} else {
			return "/user/login.jsp";
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
			Map<String, String> map = new HashMap<String, String>();
			map.put("pgno", pgno + "");
			map.put("key", key);
			map.put("word", word);
			List<BoardDto> list = boardService.listArticle(map);
			request.setAttribute("articles", list);
			PageNavigation pageNavigation = boardService.makePageNavigation(map);
			request.setAttribute("navigation", pageNavigation);
			return "/board/board.jsp" + queryString;
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
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userinfo");
		if (userDto!=null) {
			BoardDto boardDto = new BoardDto();
			boardDto.setUserId(userDto.getUserId());
			boardDto.setSubject(request.getParameter("subject"));
			boardDto.setContent(request.getParameter("content"));
			try {
				boardService.writeArticle(boardDto);
				return "/board?action=list";
			} catch (Exception e) {
				e.printStackTrace();
				return "";
			}
		} else {
			return "/user/login.jsp";
		}
	}
	
	private String delete(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userinfo");
		if (userDto !=null) {
			int articleNo = Integer.parseInt(request.getParameter("articleno"));
			try {
				boardService.deleteArticle(articleNo);
				return "/board?action=list" + queryString;
			} catch (Exception e) {
				e.printStackTrace();
				return "";
			}
		} else {
			return "/user/login.jsp";
		}
	}

	private String modify(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userinfo");
		if (userDto !=null){
			BoardDto boardDto = new BoardDto();
			boardDto.setUserId(userDto.getUserId());
			boardDto.setArticleNo(Integer.parseInt(request.getParameter("articleno")));
			boardDto.setSubject(request.getParameter("subject"));
			boardDto.setContent(request.getParameter("content"));
			try {
				boardService.modifyArticle(boardDto);
				return "/board?action=list&pgno=1&key=&word=";
			} catch (Exception e) {
				e.printStackTrace();
				return "";
			}
		} else {
			return "/user/login.jsp";
		}

	}

	private String mvModify(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userinfo");
		if (userDto !=null) {
			int articleNo = Integer.parseInt(request.getParameter("articleno"));
			try {
				BoardDto boardDto = boardService.getArticle(articleNo);
				request.setAttribute("article", boardDto);
				return "/board/modify.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				return "";
			}
		} else {
			return "/user/login.jsp";
		}
	}
}
