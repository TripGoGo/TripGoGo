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
            <c:forEach var="article" items="${articles}">
              <div class="board-item">
                <div class="board-content">
                  <a href="/9" class="link-article">
                    <strong class="title">${article.subject}</strong>
                  </a>
                  <div class="board-info">
                    <span class="writer">${article.userId}</span>
                    <span class="date">${article.registerTime}</span>
                  </div>
                  <div class="board-preview">
                    <span class="board-summary">${article.content}</span>
                  </div>
                </div>
                <div class="board-thumbnail">
                  <img
                    src="${root}/assets/images/noimg.png"
                    alt=""
                  />
                </div>
              </div>
              </c:forEach>   
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
