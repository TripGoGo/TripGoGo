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
              게시판
              <!-- window title -->
            </div>
            <div class="content">
              <div class="board-item">
                <div class="board-content">
                  <a href="/9" class="link-article">
                    <strong class="title">서울 놀러왔어요</strong>
                  </a>
                  <div class="board-info">
                    <span class="writer">지은이에용</span>
                    <span class="date">2022.02.05</span>
                  </div>
                  <div class="board-preview">
                    <span class="board-summary">더현대 서울갔다왔어용~~!!</span>
                  </div>
                </div>
                <div class="board-thumbnail">
                  <img
                    src="https://th.bing.com/th/id/R.5a63a601cde9955324c051fd48db3f2c?rik=dZZ5dKYldeyP%2bQ&riu=http%3a%2f%2fres.heraldm.com%2fcontent%2fimage%2f2021%2f02%2f23%2f20210223000363_0.jpg&ehk=NsShmYSAiDcPgJtvDTVRd2z5ondahffJer0U52hr6OA%3d&risl=&pid=ImgRaw&r=0"
                    alt=""
                  />
                </div>
              </div>
              <div class="board-item">
                <div class="board-content">
                  <a href="/9" class="link-article">
                    <strong class="title">부산 여행갔다왔어용~</strong>
                  </a>
                  <div class="board-info">
                    <span class="writer">룰루</span>
                    <span class="date">2022.02.05</span>
                  </div>
                  <div class="board-preview">
                    <span class="board-summary">안녕하세요 부산갔다와서 여행 후기올립니다ㅎㅎ</span>
                  </div>
                </div>
                <div class="board-thumbnail">
                  <img
                    src="https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/STq/image/jJyWsFXdXnEBELLKkvpwkPYMlpw.jpg"
                    alt=""
                  />
                </div>
              </div>
              <div class="board-item">
                <div class="board-content">
                  <a href="/9" class="link-article">
                    <strong class="title">여수 여행</strong>
                  </a>
                  <div class="board-info">
                    <span class="writer">바다김밥맛있엉</span>
                    <span class="date">2022.02.05</span>
                  </div>
                  <div class="board-preview">
                    <span class="board-summary">여수가서 갓김치김밥먹었는데 맛있네요</span>
                  </div>
                </div>
                <div class="board-thumbnail">
                  <img
                    src="https://mp-seoul-image-production-s3.mangoplate.com/431525/1089220_1609411562414_27463?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80"
                    alt=""
                  />
                </div>
              </div>
              <div class="board-item">
                <div class="board-content">
                  <a href="view.html" class="link-article">
                    <strong class="title">Rising</strong>
                  </a>
                  <div class="board-info">
                    <span class="writer">triple S</span>
                    <span class="date">2023.02.13</span>
                  </div>
                  <div class="board-preview">
                    <span class="board-summary"
                      >알아 너의 마음<br />
                      나를 보고 웃는<br />
                      앞에서는 오직 박수 세례<br />
                      그 뒤엔 위선 뿐<br />
                      I See You Lying Me<br />
                      질투 섞인 걱정 따윈 Stop It Now<br
                    /></span>
                  </div>
                </div>
                <div class="board-thumbnail">
                  <img src="./images/pexels-alexander-suhorucov-6457579.jpg" alt="" />
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
