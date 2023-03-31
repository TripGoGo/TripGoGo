<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
      <nav class="navbar navbar-expand-lg" style="background-color: black">
        <div class="container">
          <a class="navbar-brand" href="index.html"> TripGoGo </a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav align-items-lg-center ms-auto me-lg-5">
              <li class="nav-item">
                <a class="nav-link click-scroll" href="${root}/index.html#section_1">Home</a>
              </li>

              <li class="nav-item">
                <a class="nav-link click-scroll" href="${root}/index.html#section_2">About</a>
              </li>

              <li class="nav-item">
                <a class="nav-link click-scroll" href="${root}/index.html#section_3">Info</a>
              </li>

              <li class="nav-item">
                <a class="nav-link click-scroll" href="${root}/index.html#section_4">Route</a>
              </li>

              <li class="nav-item">
                <a class="nav-link click-scroll" href="${root}/board?action=list">Board</a>
              </li>
            </ul>
            <a href="${root}/user/login.jsp" class="btn custom-btn d-lg-block d-none">Login</a>
          </div>
        </div>
      </nav>