<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>TripGoGo MyPage</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet">

    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet">

    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet">

    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet">
    <!--

TemplateMo 583 Festava Live

https://templatemo.com/tm-583-festava-live

-->

</head>

<body>

    <main>
        <%@ include file="/include/nav-user.jsp" %>

        <section class="login-section section-padding " style="height:100vh; display:flex; align-items: center;">
            
            <div class="section-overlay">
                <div class="video-wrap">
                    <video autoplay="" loop="" muted="" class="custom-video" poster="">
                        <source src="${root}/assets/video/pexels-olya-kobruseva-5236593.mp4" type="video/mp4">
    
                        Your browser does not support the video tag.
                    </video>
                </div> 
            </div>

            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-10 mx-auto">
                        <!-- 여기서부터 mypage form 부분-->
                        <form class="custom-form ticket-form mb-5 mb-lg-0" id="mypage-form" method="post">
                            <h2 class="text-center mb-4">MYPAGE</h2>

                            <div class="ticket-form-body" style="font-size: 20px; text-align: center;">
                                <div class="container">
                                    <div class="row align-content-center" style="margin-top:20px">
                                        <div >Name : ${user.userName}</div>
                                    </div>

                                    <div class="row align-content-center" style="margin-top:20px">
                                        <div >Email : ${user.email}</div>
                                    </div>

                                    <div class="row" style="margin:20px 0px">
                                        <div > id : ${user.userId} </div>
                                    </div>
                                </div>
                                
                                <div class="col-lg-4 col-md-10 col-8 mx-auto" >
                                    <a href="${root}/user?action=mvmodifyuser&id=${userinfo.userId}" class="btn custom-btn d-lg-block d-none">Change</a>
                                </div>
                                <div class="col-lg-4 col-md-10 col-8 mx-auto" style="margin-top: 20px;">
                                    <a href="${root}" class="btn custom-btn d-lg-block d-none" style="background-color: black;">Go to Main</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/include/nav-user.jsp" %>

    <!--

T e m p l a t e M o

-->
    <!-- JAVASCRIPT FILES -->
    <script src="${root}/assets/js/jquery.min.js"></script>
    <script src="${root}/assets/js/bootstrap.min.js"></script>
    <script src="${root}/assets/js/jquery.sticky.js"></script>
    <script src="${root}/assets/js/custom.js"></script>

</body>

</html>