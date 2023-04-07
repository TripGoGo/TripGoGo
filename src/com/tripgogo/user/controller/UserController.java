package com.tripgogo.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripgogo.user.model.UserDto;
import com.tripgogo.user.model.service.UserService;
import com.tripgogo.user.model.service.UserServiceImpl;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService;

	public void init() {
		userService = UserServiceImpl.getUserService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		String path = "";
		if("mvjoin".equals(action)) {
			path = "/user/join.jsp";
			redirect(request, response, path);
		} else if("idcheck".equals(action)) {
			int cnt = idcheck(request, response);
			response.setContentType("text/plain");
			PrintWriter out = response.getWriter();
			out.print(cnt);
		} else if("mvregister".equals(action)) {
			path = "/user/register.jsp";
			redirect(request, response, path);
		} else if("register".equals(action)) {
			path = register(request, response);
			redirect(request, response, path);
		} else if("mvlogin".equals(action)) {
			path = "/user/login.jsp";
			redirect(request, response, path);
		} else if("login".equals(action)) {
			path = login(request, response);
			forward(request, response, path);
		} else if("logout".equals(action)) {
			path = logout(request, response);
			redirect(request, response, path);
		}else if("mvmodifyuser".equals(action)) {
			path = mvmodifyUser(request, response);
			forward(request, response, path);
		}else if("mvmypage".equals(action)) {
			path = mypage(request, response);
			forward(request, response, path);
		} else if("modifyuser".equals(action)){
			path = modify(request, response);
			forward(request, response, path);
		}else {
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

	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws IOException, ServletException {
		RequestDispatcher disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}

	private int idcheck(HttpServletRequest request, HttpServletResponse response) {
		// TODO : 입력한 아이디의 사용여부 체크 (0 : 사용 X, 1 : 사용 O)
		String userId = request.getParameter("userid");
		try {
			return userService.idCheck(userId);
		} catch (Exception e) {
			e.printStackTrace();
			return 500;
		}
	}

	private String register(HttpServletRequest request, HttpServletResponse response) {
		// TODO : 이름, 아이디, 비밀번호, 이메일등 회원정보를 받아 MemberDto로 setting.
		// TODO : 위의 데이터를 이용하여 service의 joinMember() 호출.
		// TODO : 정상 등록 후 로그인 페이지로 이동.
		UserDto userDto = new UserDto();
		userDto.setUserName(request.getParameter("name"));
		userDto.setUserId(request.getParameter("id"));
		userDto.setUserPassword(request.getParameter("pwd"));
		userDto.setEmail(request.getParameter("email"));
		try {
			userService.joinUser(userDto);
			return "/index.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "회원가입 중 에러 발생!!!");
			return "/error/error.jsp";
		}
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		try {
			UserDto userDto = userService.loginUser(id, pwd);
			if(userDto != null) {
//				session 설정
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", userDto);

				return "/index.jsp";
			} else {
				System.out.println("로그인 안됨");
				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요.");
				return "/user/login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "로그인 중 에러 발생!!!");
			return "/error/error.jsp";
		}
	}

	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
//		session.removeAttribute("userinfo");
		session.invalidate();
		return "";
	}

	private String mypage(HttpServletRequest request, HttpServletResponse response) {
		try {
			UserDto userDto = userService.findUser(request.getParameter("id"));
			System.out.println(userDto.getUserName());
			request.setAttribute("user", userDto);
			return "/user/mypage.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private String mvmodifyUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			UserDto userDto = userService.findUser(request.getParameter("id"));
			request.setAttribute("user", userDto);
			return "/user/mypage-modify.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private String modify(HttpServletRequest request, HttpServletResponse response) {
		UserDto userDto = new UserDto();
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("name"));
		userDto.setUserId(request.getParameter("id"));
		userDto.setUserName(request.getParameter("name"));
		userDto.setUserPassword(request.getParameter("pwd"));
		userDto.setEmail(request.getParameter("email"));
		try {
			userService.updateUser(userDto);
			return "";

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "회원 정보 수정 중 문제 발생!!!");
			return "/error/error.jsp";
		}
	}


}
