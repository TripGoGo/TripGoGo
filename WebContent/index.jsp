<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>TripGoGo</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/d4a4244bd2.js" crossorigin="anonymous"></script>
    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet">
    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .ourteam-section {
            height: 100vh;
            text-align: center;
            background-image: url("${root}/assets/images/layered-waves-haikei.svg");
            background-repeat: no-repeat;
        }

        .ourteam {
            width: 100%;
            text-align: center;
            justify-content: center;
            align-items: center;
        }

        .profile-card {
            position: relative;
            font-family: sans-serif;
            width: 220px;
            height: 220px;
            background: #fff;
            padding: 30px;
            border-radius: 50%;
            box-shadow: 0 0 22px #3336;
            transition: 0.6s;
            margin: 0 25px;
        }

        .profile-card:hover {
            border-radius: 10px;
            height: 260px;
        }

        .profile-card .img {
            position: relative;
            width: 100%;
            height: 100%;
            transition: 0.6s;
            z-index: 99;
        }

        .profile-card .img img {
            width: 100%;
            border-radius: 50%;
            box-shadow: 0 0 22px #3336;
            transition: 0.6s;
        }

        .profile-card:hover .img {
            transform: translateY(-60px);
        }

        .profile-card:hover img {
            border-radius: 10px;
        }

        .caption {
            text-align: center;
            transform: translateY(-80px);
            opacity: 0;
            transition: 0.6s;
        }

        .profile-card:hover .caption {
            opacity: 1;
        }

        .caption h3 {
            font-size: 21px;
            font-family: sans-serif;
        }

        .caption p {
            font-size: 15px;
            color: #0c52a1;
            font-family: sans-serif;
            margin: 2px 0 9px 0;
        }

        .caption .social-links a {
            color: #333;
            margin-right: 15px;
            font-size: 21px;
            transition: 0.6s;
        }

        .social-links a:hover {
            color: #0c52a1;
        }
    </style>
</head>
<body>
<main>
    <header class="site-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-12 d-flex flex-wrap">
                    <p class="d-flex me-4 mb-0">
                        <strong class="text-dark">Welcome to TripGoGo</strong>
                    </p>
                </div>

            </div>
        </div>
    </header>
    <%@ include file="/include/nav-user.jsp" %>
    <section class="hero-section" id="section_1">
        <div class="section-overlay"></div>
        <div class="container d-flex justify-content-center align-items-center">
            <div class="row">
                <div class="col-12 mt-auto mb-5 text-center">
                    <h1 class="text-white mb-5">TripGoGo</h1>
                    <a class="btn custom-btn smoothscroll" href="#section_2">About us</a>
                </div>
                <div class="col-lg-12 col-12 mt-auto d-flex flex-column flex-lg-row text-center"></div>
            </div>
        </div>
        <div class="video-wrap">
            <video autoplay="" loop="" muted="" class="custom-video" poster="">
                <source src="${root}/assets/video/pexels-olya-kobruseva-5236593.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
    </section>
    <section class="about-section section-padding d-flex align-items-center" id="section_2">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-12 mb-4 mb-lg-0 d-flex align-items-center">
                    <div class="services-info">
                        <h2 class="text-black mb-4">About TripGoGo</h2>
                        <p class="text-black">전국의 음식점, 카페, 관광정보를 한눈에 볼 수 있는 웹사이트</p>
                        <h6 class="text-black mt-4">Developers</h6>
                        <p class="text-black">정지원, 김지은</p>
                        <h6 class="text-black mt-4">From</h6>
                        <p class="text-black">SSAFY 9th</p>
                        <h6 class="text-black mt-4">Contact</h6>
                        <div class="social-share">
                            <ul class="social-icon d-flex align-items-center ">
                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link">
                                        <span class="bi-github"></span>
                                    </a>
                                </li>
                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link">
                                        <span class="bi-git"></span>
                                    </a>
                                </li>
                                <li class="social-icon-item">
                                    <a href="#" class="social-icon-link">
                                        <span class="bi-heart-fill"></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="about-text-wrap">
                        <img src="${root}/assets/images/pexels-alexander-suhorucov-6457579.jpg"
                             class="about-image img-fluid">
                        <div class="about-text-info d-flex">
                            <div class="d-flex">
                                <i class="about-text-icon bi-person"></i>
                            </div>
                            <div class="ms-4">
                                <h3>a happy moment</h3>
                                <p class="mb-0">your amazing festival experience with us</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ourteam-section">
        <h2 style="margin-top:100px; margin-bottom: 100px">Our Team</h2>
        <div class="ourteam d-flex">
            <div class="profile-card">
                <div class="img">
                    <img src="${root}/assets/images/profiles/javva.png"/>
                </div>
                <div class="caption">
                    <h3>정지원</h3>
                    <p>Back End Developer</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="profile-card">
                <div class="img">
                    <img src="${root}/assets/images/profiles/jxixeun.png"/>
                </div>
                <div class="caption">
                    <h3>김지은</h3>
                    <p>Back End Developer</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="/include/footer.jsp" %>
<!-- JAVASCRIPT FILES -->
<script src="${root}/assets/js/jquery.min.js"></script>
<script src="${root}/assets/js/bootstrap.min.js"></script>
<script src="${root}/assets/js/jquery.sticky.js"></script>
<script src="${root}/assets/js/click-scroll.js"></script>
<script src="${root}/assets/js/custom.js"></script>
</body>

</html>