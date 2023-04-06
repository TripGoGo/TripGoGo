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

    <title>TripGoGo</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet">
    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet">
    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet">

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

                        <a class="btn custom-btn smoothscroll" href="#section_2">Find Info.</a>
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
                            <img src="${root}/assets/images/pexels-alexander-suhorucov-6457579.jpg" class="about-image img-fluid">
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

        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="about-section d-flex align-items-center">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start">
                        <h4 class="fw-normal fs-3" data-zanim-xs='{"delay":0.3}' data-zanim-trigger="scroll">Your safety
                            is always <br />a top priority</h4>
                        <p class="fs-0 pe-xl-8" data-zanim-xs='{"delay":0.5}' data-zanim-trigger="scroll">We are
                            committed to help drivers and riders get where they want to go with confidence</p>
                        <div class="d-flex justify-content-space-between align-item-center my-3 mt-2">
                            <div>
                                <h4 class="fw-normal fs-1">Drive</h4>
                                <p class="my-1 fs-0 pe-xl-8">Drive when you want. Find ooprtunities around you.</p>
                            </div>
                            <div>
                                <h4 class="fw-normal fs-1">Ride</h4>
                                <p class="my-1 fs-0 pe-xl-8">Tap your phone. Get where you're headed</p>
                            </div>
                        </div><button class="btn btn-sm btn-primary my-4 me-1" onclick="location.href='info.html'"
                            role="button">Get started</button><a class="btn btn-sm my-2 btn-default" href="#"
                            role="button">Questions? Talk to our team<i class="fas fa-arrow-right ms-2"></i></a>
                    </div>
                    <div class="col-md-6 mb-4"><img class="w-100" src="${root}/assets/images/main/4.png" alt="..." /></div>
                </div>
            </div><!-- end of .container-->
        </section><!-- <section> close ============================-->
        <!-- ============================================-->

        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="hero-section d-flex align-items-center" id="section_3">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 mb-4"><img class="w-100" src="${root}/assets/images/main/5.png" alt="..." /></div>
                    <div class="col-md-6 text-center text-md-start">
                        <h4 class="fs-3 fw-normal" data-zanim-xs='{"delay":0.3}' data-zanim-trigger="scroll">Move the
                            way you want, <br />Roads are open</h4>
                        <p class="fs-0 pe-xl-7" data-zanim-xs='{"delay":0.5}' data-zanim-trigger="scroll">Opportunity is
                            everything. Get out there and find it with Uber.</p>
                        <div class="d-flex justify-content-center align-item-center my-3 mt-2">
                            <div>
                                <h4 class="fw-normal fs-1">Route</h4>
                                <p class="my-1 fs-0 pe-xl-8">Route among the safe roads. Find what's waiting for you.
                                </p>
                            </div>
                            <div>
                                <h4 class="fw-normal fs-1">Share</h4>
                                <p class="my-1 fs-0 pe-xl-8">Your caring gets it's way. Let your people know.</p>
                            </div>
                        </div><button class="btn btn-sm btn-primary btn-bg-purple my-4 me-1"
                            onclick="location.href='route.html'" role="button">Get started</button><a
                            class="btn btn-sm my-2 btn-default" href="#" role="button">Questions? Talk to our team<i
                                class="fas fa-arrow-right ms-2"></i></a>
                    </div>
                </div>
            </div><!-- end of .container-->
        </section><!-- <section> close ============================-->
        <!-- ============================================-->

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