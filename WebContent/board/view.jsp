<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="description" content="" />
    <meta name="author" content="" />
    <script src="https://kit.fontawesome.com/d4a4244bd2.js" crossorigin="anonymous"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c320326b2ad2dd588de2423a35a93637"
    ></script>
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
    <link href="${root}/assets/css/board.css" rel="stylesheet" />
    <link href="${root}/assets/css/mac-style.css" rel="stylesheet" />
    <link href="${root}/assets/css/write.css" rel="stylesheet" />

    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet" />
    <!--

TemplateMo 583 Festava Live

https://templatemo.com/tm-583-festava-live

-->
  </head>
  <body>
    <main>
       <%@ include file="/include/nav.jsp" %>
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
              글 읽기
              <!-- window title -->
            </div>
            <div class="content">
              <div class="view-container">
                <div class="view-item">
                  <a href="/9" class="link-article">
                    <strong class="title">Rising</strong>
                  </a>
                  <div class="board-info">
                    <span class="writer">triple S</span>
                    <span class="date">2023.02.13</span>
                  </div>
                  <hr width="100%" />
                  <div class="view-content">
                    알아 너의 마음<br />
                    나를 보고 웃는<br />
                    앞에서는 오직 박수 세례<br />
                    그 뒤엔 위선 뿐<br />
                    I See You Lying Me<br />
                    질투 섞인 걱정 따윈 Stop It Now<br />
                    세상에서 정해준 Route I Don't Mind<br />
                    춤에 리듬 맡긴 채 나를 믿어볼 순간<br />
                    Woo Rising 이제 일어서서 고개들고 Fight It<br />
                    흔들려도 피어나는 꽃 드러내 What I'm Feeling<br />
                    Woo Rising 이제 본질 속에 진주처럼 Like It<br />
                    반짝이는 나를 향해 Try<br />
                    세상에 One And Only Baby<br />
                    Just 꿈이 아닌 현실의 Dejavu<br />
                    단단해져 고난은 Make It True<br />
                    Just 꿈에서 본 내 모습 Dejavu<br />
                    고통이 지나고 달라진 Make It Move<br />
                    비바람 좀 더 세게 더 강해질 내게 바래<br />
                    날 믿어 Just Let Me<br />
                    I Can Make It Raise It Recover It Now<br />
                    자신있게 걷는 걸음 걸이<br />
                    벌써 따라잡은 꿈의 거리<br />
                    One Day 이루리라<br />
                    Today 다르리라<br />
                    나만 믿으리란 다짐<br />
                    관심없어 네게 신경 쓰지 않아<br />
                    마치 친구처럼 Acting 하고 Reaction 해 But<br />
                    I See You Lying Me<br />
                    Just 꿈이 아닌 현실의 Dejavu<br />
                    단단해져 고난은 Make It True<br />
                    Just 꿈에서 본 내 모습 Dejavu<br />
                    고통이 지나고 달라진 Make It Move<br />
                    비바람 좀 더 세게 더 강해질 내게 바래<br />
                    날 믿어 Just Let Me<br />
                    And I Never Let Dream Go<br />
                    Just 꿈이 아닌 현실의 Dejavu<br />
                    단단해져 고난은 Make It True<br />
                    Just 꿈에서 본 내 모습 Dejavu<br />
                    고통이 지나고 달라진 Make It Move<br />
                    비바람 좀 더 세게 더 강해질 내게 바래<br />
                    날 믿어 Just Let Me<br />
                    And I Never Let Dream Go<br />
                    Always Closer<br />
                    빨리 따라와<br />
                    You Just Follow<br />
                    La-La-La-La
                  </div>
                </div>
              </div>
              <!-- window content -->
            </div>
          </div>
        </div>
        <!-- ©2015 Johannes JakobMade with <3 in Germany -->
      </div>
    </main>
     <%@ include file="/include/footer.jsp" %>
  </body>
</html>
