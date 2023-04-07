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
  <title>Festava Live - Ticket HTML Form</title>
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
  <link href="${root}/assets/css/board.css" rel="stylesheet" />
  <link href="${root}/assets/css/mac-style.css" rel="stylesheet" />
  <link href="${root}/assets/css/write.css" rel="stylesheet" />
  <link href="${root}/assets/css/route.css" rel="stylesheet" />
  <script
          type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab875d88d46e8c95321681c7d548bd5c&libraries=services"
  ></script>

  <style>
    .map_wrap,
    .map_wrap * {
      margin: 0;
      padding: 0;
      font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
      font-size: 12px;
    }

    .map_wrap {
      position: relative;
      width: 100%;
      height: 350px;
    }

    #category {
      position: absolute;
      top: 10px;
      left: 10px;
      border-radius: 5px;
      border: 1px solid #909090;
      box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
      background: #fff;
      overflow: hidden;
      z-index: 2;
    }

    #category li {
      float: left;
      list-style: none;
      width: 50px;
      border-right: 1px solid #acacac;
      padding: 6px 0;
      text-align: center;
      cursor: pointer;
    }

    #category li.on {
      background: #eee;
    }

    #category li:hover {
      background: #ffe6e6;
      border-left: 1px solid #acacac;
      margin-left: -1px;
    }

    #category li:last-child {
      margin-right: 0;
      border-right: 0;
    }

    #category li span {
      display: block;
      margin: 0 auto 3px;
      width: 27px;
      height: 28px;
    }

    #category li .category_bg {
      background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
      no-repeat;
    }

    #category li .bank {
      background-position: -10px 0;
    }

    #category li .mart {
      background-position: -10px -36px;
    }

    #category li .pharmacy {
      background-position: -10px -72px;
    }

    #category li .oil {
      background-position: -10px -108px;
    }

    #category li .cafe {
      background-position: -10px -144px;
    }

    #category li .store {
      background-position: -10px -180px;
    }

    #category li.on .category_bg {
      background-position-x: -46px;
    }

    .placeinfo_wrap {
      position: absolute;
      bottom: 28px;
      left: -150px;
      width: 300px;
    }

    .placeinfo {
      position: relative;
      width: 100%;
      border-radius: 6px;
      border: 1px solid #ccc;
      border-bottom: 2px solid #ddd;
      padding-bottom: 10px;
      background: #fff;
    }

    .placeinfo:nth-of-type(n) {
      border: 0;
      box-shadow: 0px 1px 2px #888;
    }

    .placeinfo_wrap .after {
      content: "";
      position: relative;
      margin-left: -12px;
      left: 50%;
      width: 22px;
      height: 12px;
      background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
    }

    .placeinfo a,
    .placeinfo a:hover,
    .placeinfo a:active {
      color: #fff;
      text-decoration: none;
    }

    .placeinfo a,
    .placeinfo span {
      display: block;
      text-overflow: ellipsis;
      overflow: hidden;
      white-space: nowrap;
    }

    .placeinfo span {
      margin: 5px 5px 0 5px;
      cursor: default;
      font-size: 13px;
    }

    .placeinfo .title {
      font-weight: bold;
      font-size: 14px;
      border-radius: 6px 6px 0 0;
      margin: -1px -1px 0 -1px;
      padding: 10px;
      color: #fff;
      background: #d95050;
      background: #d95050
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat
      right 14px center;
    }

    .placeinfo .tel {
      color: #0f7833;
    }

    .placeinfo .jibun {
      color: #999;
      font-size: 11px;
      margin-top: 0;
    }

    .options {
      background-color: rgba(0, 0, 0, 0);

      background: rgba(0, 0, 0, 0);
    }

    #placesList > li {
      border-radius: 10px;
      margin-top: 10px;
      list-style: none;
      border: 1px solid lightgray;
      padding: 5px;
    }

    #placesList > li:first-child {
      margin-top: 0px;
    }

    .list-title {
      color: black;
    }

    .list-content {
      font-size: 15px;
      color: black;
      text-indent: 15px;
    }
  </style>
  <!--

TemplateMo 583 Festava Live

https://templatemo.com/tm-583-festava-live

-->
</head>

<body>
<%@ include file="/include/nav.jsp" %>
<main>
  <div class="board_background">
    <div class="board">
      <div class="window">
        <div class="titlebar">
          <div class="buttons">
            <div class="close">
              <a class="closebutton" href="#"
              ><span><strong>x</strong></span></a
              >
              <!-- close button link -->
            </div>
            <div class="minimize">
              <a class="minimizebutton" href="#"
              ><span><strong>&ndash;</strong></span></a
              >
              <!-- minimize button link -->
            </div>
            <div class="zoom">
              <a class="zoombutton" href="#"
              ><span><strong>+</strong></span></a
              >
              <!-- zoom button link -->
            </div>
          </div>
          게시판
          <!-- window title -->
        </div>
        <div class="content" style="height: 640px">
          <div class="container">
            <div class="row">
              <!-- 관광지 검색 start -->
              <div class="mt-3 d-flex justify-content-center">
                <div class="search-bar me-3" style="border: 1px solid lightgray; height: 36px">
                  <select
                          id="search-area1"
                          class="form-select"
                          aria-label="Default select example"
                          style="
                          background-color: rgba(255, 255, 255, 0);
                          text-align: center;
                          border: rgba(0, 0, 0, 0);
                        "
                  >
                    <option value="0" selected>시/도</option>
                  </select>
                </div>
                <div class="search-bar me-3" style="border: 1px solid lightgray; height: 36px">
                  <select
                          id="search-area2"
                          class="form-select"
                          aria-label="Default select example"
                          style="
                          background-color: rgba(255, 255, 255, 0);
                          text-align: center;
                          border: rgba(0, 0, 0, 0);
                        "
                  >
                    <option value="0" selected>구/군</option>
                  </select>
                </div>
                <div class="search-bar me-3" style="border: 1px solid lightgray; height: 36px">
                  <select
                          id="search-type"
                          class="form-select"
                          aria-label="Default select example"
                          style="
                          background-color: rgba(255, 255, 255, 0);
                          text-align: center;
                          border: rgba(0, 0, 0, 0);
                        "
                  >
                    <option value="0" selected class="options">유형</option>
                    <option value="SW8" class="options">지하철역</option>
                    <option value="AT4" class="options">관광명소</option>
                    <option value="FD6" class="options">음식점</option>
                    <option value="CE7" class="options">카페</option>
                  </select>
                </div>
                <button
                        class="me-3 btn"
                        id="btn-search"
                        type="submit"
                        style="background-color: lightgray; border-radius: 10px; color: white"
                >
                  Find
                </button>
                <!-- 관광지 검색 end -->
              </div>
            </div>
          </div>

          <!-- 지도 부분 -->
          <div class="mt-3">
            <div class="w-100 d-flex" style="background-color: rgba(255, 255, 255, 0.4)">
              <div
                      id="map"
                      class="col-8"
                      style="height: 55vh; border-radius: 10px; margin: 0px 0px; margin-left: 10px"
              ></div>
              <div id="map-list" class="col-4 row">
                <div id="menu_wrap" style="border-radius: 10px; overflow: auto; height: 55vh">
                  <ul id="placesList" style="padding: 0px 0px; margin-left: 10px"></ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- ©2015 Johannes JakobMade with <3 in Germany -->
  </div>
</main>
<script src="${root}/assets/js/jquery.min.js"></script>
<script src="${root}/assets/js/bootstrap.min.js"></script>
<script src="${root}/assets/js/jquery.sticky.js"></script>
<script src="${root}/assets/js/custom.js"></script>
<script
        type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24073e84e8ac256ed85efd18c525e7a9"
></script>
<script src="${root}/assets/js/info.js"></script>
</body>
</html>
