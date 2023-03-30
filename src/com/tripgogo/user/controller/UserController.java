package com.tripgogo.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.model.MemberDto;
import com.ssafy.service.MemberService;
import com.ssafy.service.MemberServiceImpl;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService;
	
	public void init() {
		memberService = MemberServiceImpl.getMemberService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		String path = "";
		if("mvlogin".equals(action)) {
			path = "/user/login.jsp";
			redirect(request, response, path);
		} else if("login".equals(action)) {
			path = login(request, response);
			forward(request, response, path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}
	
	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws IOException, ServletException {
		RequestDispatcher disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}
	
	private String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		try {
			MemberDto memberDto = memberService.login(id, pw);
			if(memberDto != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userInfo", memberDto);
				return "";
			} else {
				request.setAttribute("msg", "아이디 또는 비번 확인!!!!");
				return "/user/login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "/error/error.jsp";
		}
	}

}
