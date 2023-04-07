<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="${root}">
            TripGoGo
        </a>

        <a href="${root}/user?action=mvlogin" class="btn custom-btn d-lg-none ms-auto me-4">Login</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav align-items-lg-center ms-auto me-lg-5">
                <li class="nav-item">
                    <a class="nav-link click-scroll" href="">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link click-scroll" href="${root}/index.jsp#section_2">About</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link click-scroll" href="${root}/index.jsp#section_3">Info</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link click-scroll" href="${root}/route.jsp">Route</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link click-scroll" href="${root}/mytrip?action=list">Trip</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link click-scroll" href="${root}/board?action=list">Board</a>
                </li>

            </ul>
            <c:if test="${not empty userinfo}">
                <a href="${root}/user?action=logout" class="btn custom-btn d-lg-block d-none">Logout</a>
                <a class="btn custom-btn d-lg-block d-none" style="background: black; margin-left: 10px" href="${root}/user?action=mvmypage&id=${userinfo.userId}">MYPAGE</a>

            </c:if>

            <c:if test="${empty userinfo}">
                <a href="${root}/user?action=mvlogin" class="btn custom-btn d-lg-block d-none">Login</a>
            </c:if>
        </div>
    </div>
</nav>
