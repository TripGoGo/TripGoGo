<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="description" content="" />
    <meta name="author" content="" />
    <script src="https://kit.fontawesome.com/d4a4244bd2.js" crossorigin="anonymous"></script>
    <title>대중교통 길찾기</title>
    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap"
            rel="stylesheet"
    />
    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet" />
    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet" />
</head>
<body>
<main>
    <header class="site-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-12 d-flex flex-wrap">
                    <p class="d-flex me-4 mb-0">
                        <i class="bi-person custom-icon me-2"></i>
                        <strong class="text-dark">TripGoGo</strong>
                    </p>
                </div>
            </div>
        </div>
    </header>
    <%@ include file="/include/nav.jsp" %>
    <section class="ticket-section section-padding" style="height: calc(100vh - 51px)">
        <div class="section-overlay"></div>
        <div class="container">
            <div class="row">
                <!-- 관광지 검색 start -->
                <div class="mt-3 d-flex justify-content-center">
                    <div class="search-bar me-3">
                        <input id="search-departures" type="text" placeholder="departure..." />
                        <button id="btn-search-departures" class="btn-search" type="button">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                    <div class="search-bar">
                        <input id="search-arrivals" type="text" placeholder="arrival..." />
                        <button id="btn-search-arrivals" class="btn-search" type="button">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                    <button class="ms-2 btn" id="btn-search-route">Find</button>
                    <!-- 관광지 검색 end -->
                </div>
                <!-- style="background-color: yellow" -->
                <div class="mt-1 d-flex justify-content-center">
                    <div class="col-2"></div>
                    <div class="btn-group-vertical col-6 position-absolute" id="departures-list"></div>
                    <div class="btn-group-vertical col-6" id="arrivals-list"></div>
                </div>
                <div
                        id="route-result"
                        class="tab-content shadow-lg mt-5 w-100"
                        style="background-color: rgba(255, 255, 255, 0.4)"
                >
                    <div id="map" class="mb-3" style="width: 100%; height: 500px"></div>
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
<script src="${root}/assets/js/custom.js"></script>
<script src="${root}/assets/js/route.js"></script>
<script
        type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24073e84e8ac256ed85efd18c525e7a9"
></script>
</body>
</html>

