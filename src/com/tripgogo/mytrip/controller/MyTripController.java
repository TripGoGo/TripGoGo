package com.tripgogo.mytrip.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripgogo.mytrip.model.MyTripDto;
import com.tripgogo.mytrip.model.service.MyTripService;
import com.tripgogo.mytrip.model.service.MyTripServiceImpl;


@WebServlet("/mytrip")
public class MyTripController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MyTripService myTripService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		myTripService = MyTripServiceImpl.getInstance();
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
			path = "/mytrip/mytrip-create.jsp";
			redirect(request, response, path);
		} else if ("write".equals(action)) {
			path = write(request, response);
			redirect(request, response, path);
		} else if ("delete".equals(action)) {
			path = delete(request, response);
			redirect(request, response, path);
		} else {
			redirect(request, response, path);
		}
	}

	private String delete(HttpServletRequest request, HttpServletResponse response) {
		int myTripId = Integer.parseInt(request.getParameter("mytrip_id"));
		try {
			myTripService.deleteMyTrip(myTripId);
			return "/mytrip?action=list";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private String write(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		MyTripDto myTripDto = new MyTripDto();
		myTripDto.setUserId("ssafy");
		myTripDto.setCity(request.getParameter("city"));
		myTripDto.setStartDate(Date.valueOf(request.getParameter("start_date")));
		myTripDto.setEndDate(Date.valueOf(request.getParameter("end_date")));
		myTripDto.setCompanion(Integer.parseInt(request.getParameter("companion")));
		myTripDto.setTripStyle(Integer.parseInt(request.getParameter("trip_style")));
		try {
			myTripService.writetMyTrip(myTripDto);
			System.out.println("hei");
			return "/mytrip?action=list";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private String view(HttpServletRequest request, HttpServletResponse response) {
		int myTripId = Integer.parseInt(request.getParameter("mytrip_id"));
		try {
			MyTripDto myTripDto = myTripService.getMyTrip(myTripId);
			request.setAttribute("mytrip", myTripDto);
			return "/mytrip/mytrip-view.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private String list(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<MyTripDto> list = myTripService.listMytrips("ssafy");
			request.setAttribute("mytrips", list);
			return "/mytrip/mytrip-board.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
