package com.tripgogo.mytrip.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tripgogo.mytrip.model.MyTripDto;
import com.tripgogo.mytrip.model.PlaceDto;
import com.tripgogo.mytrip.model.service.MyTripService;
import com.tripgogo.mytrip.model.service.MyTripServiceImpl;
import com.tripgogo.mytrip.model.service.PlaceService;
import com.tripgogo.mytrip.model.service.PlaceServiceImpl;
import com.tripgogo.user.model.UserDto;
import com.tripgogo.util.PageNavigation;
import com.tripgogo.util.ParameterCheck;


@WebServlet("/mytrip")
public class MyTripController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private int pgno;
    private String queryString;
    private MyTripService myTripService;
    private PlaceService placeService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        myTripService = MyTripServiceImpl.getInstance();
        placeService = PlaceServiceImpl.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        pgno = ParameterCheck.notNumberToOne(request.getParameter("pgno"));
        queryString = "?pgno=" + pgno;
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
        } else if ("mvadd".equals(action)) {
            path = "/mytrip/mytrip-select.jsp?mytrip_id=" + request.getParameter("mytrip_id") + "&date=" + request.getParameter("date");
            redirect(request, response, path);
        } else if ("add".equals(action)) {
            path = add(request, response);
            redirect(request, response,path);
        } else if ("mvremove".equals(action)){
            path = mvremove(request, response);
            forward(request, response, path);
        } else if ("remove".equals(action)) {
            path = remove(request, response);
            forward(request, response, path);
        } else {
            redirect(request, response, path);
        }
    }

    private String remove(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userinfo");
        if (userDto !=null) {
            String[] parameterValues = request.getParameterValues("check-remove");
            List<Integer> list = new ArrayList<>();
            for (int i = 0; i < parameterValues.length; i++) {
                list.add(Integer.parseInt(parameterValues[i]));
            }
            try {
                placeService.deletePlaces(list);
                return "mytrip?action=view&mytrip_id=" + request.getParameter("myTripId");
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        } else {
            return "/user/login.jsp";
        }

    }

    private String mvremove(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userinfo");
        if (userDto !=null) {
            long mytripId = Long.parseLong(request.getParameter("mytrip_id"));
            Date date = Date.valueOf(request.getParameter("date"));
            String index = request.getParameter("index");
            try {
                List<PlaceDto> placedDtos = placeService.getPlaceByDate(mytripId, date);
                request.setAttribute("places", placedDtos);
                request.setAttribute("index", index);
                request.setAttribute("date", date);
                return "/mytrip/mytrip-edit.jsp";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        } else {
            return "/user/login.jsp";
        }
    }

    private String add(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userinfo");
        if (userDto !=null) {
            PlaceDto placedto = new PlaceDto();
            placedto.setMyTripId(Long.parseLong(request.getParameter("mytrip_id")));
            placedto.setCategory(request.getParameter("category"));
            placedto.setDate(Date.valueOf(request.getParameter("date")));
            placedto.setX(request.getParameter("x"));
            placedto.setY(request.getParameter("y"));
            placedto.setPlaceName(request.getParameter("place_name"));
            try {
                placeService.addPlace(placedto);
                return "/mytrip?action=view&mytrip_id=" + request.getParameter("mytrip_id");
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
            int myTripId = Integer.parseInt(request.getParameter("mytrip_id"));
            try {
                myTripService.deleteMyTrip(myTripId);
                return "/mytrip?action=list&pgno=1";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        } else {
            return "/user/login.jsp";
        }
    }

    private String write(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userinfo");
        if (userDto !=null) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            MyTripDto myTripDto = new MyTripDto();
            myTripDto.setUserId(userDto.getUserId());
            myTripDto.setCity(request.getParameter("city"));
            myTripDto.setStartDate(Date.valueOf(request.getParameter("start_date")));
            myTripDto.setEndDate(Date.valueOf(request.getParameter("end_date")));
            myTripDto.setCompanion(Integer.parseInt(request.getParameter("companion")));
            myTripDto.setTripStyle(Integer.parseInt(request.getParameter("trip_style")));
            try {
                myTripService.writetMyTrip(myTripDto);
                return "/mytrip?action=list&pgno=1";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        } else {
            return "/user/login.jsp";
        }
    }

    private String view(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userinfo");
        if (userDto !=null) {
            int myTripId = Integer.parseInt(request.getParameter("mytrip_id"));
            try {
                MyTripDto myTripDto = myTripService.getMyTrip(myTripId);
                List<PlaceDto> list = placeService.getPlaces(myTripId);
                int[] placebyDay = new int[myTripDto.getPeriod()];
                for (int i = 0; i < list.size(); i++) {
                    int index = Period.between(myTripDto.getStartDate().toLocalDate(), list.get(i).getDate().toLocalDate()).getDays();
                    placebyDay[index]++;
                }
                request.setAttribute("mytrip", myTripDto);
                request.setAttribute("places", list);
                request.setAttribute("placebyDay", placebyDay);
                return "/mytrip/mytrip-view.jsp";
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        } else {
            return "/user/login.jsp";
        }
    }

    private String list(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userinfo");
        if (userDto !=null) {
            try {
                List<MyTripDto> list = myTripService.listMytrips(userDto.getUserId(), pgno);
                request.setAttribute("mytrips", list);
                PageNavigation pageNavigation = myTripService.makePageNavigation(pgno, userDto.getUserId());
                request.setAttribute("navigation", pageNavigation);
                return "/mytrip/mytrip-board.jsp" + queryString;
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        } else {
            return "/user/login.jsp";
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
