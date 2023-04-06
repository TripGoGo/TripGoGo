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

    <title>TripGoGo Change MyPage</title>

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
                        <!-- 여기서부터 회원가입 form 부분-->
                        <form class="custom-form ticket-form mb-5 mb-lg-0" id="modifyForm" method="POST" action="${root}/user">
                            <h2 class="text-center mb-4">Change MyPage</h2>

                            <input type="hidden" name="action" value="modifyuser">
                            <div class="ticket-form-body">
                                <div class="container">

                                    <div class="row">
                                        <div class="col-6" style="margin: 0px;padding: 0px;">
                                            <input type="text" name="name" id="name"
                                                   class="form-control" value="${user.userName}" required>
                                        </div>

                                        <div class="col-6" style="padding-right:0px">
                                            <input type="text" name="email" id="email"
                                                   class="form-control" value="${user.email}" required>
                                        </div>

                                    </div>


                                    <input type="text" name="id" id="id"
                                           class="form-control" value="${user.userId}" disabled>

                                    <input type="password" name="pwd" id="pwd"
                                           class="form-control" value="${user.userPassword}" required>

                                    <input type="password" name="pwd-confirm" id="pwd-confirm"
                                           class="form-control" value="${user.userPassword}" required>

                                </div>


                                <div class="col-lg-4 col-md-10 col-8 mx-auto" >
                                    <button type="button" id="submitBtn" class="btn custom-btn d-lg-block d-none">SUBMIT</button>
                                </div>
                                <div class="col-lg-4 col-md-10 col-8 mx-auto" style="margin-top: 20px;">
                                    <a href="${root}/user?action=mvmypage&id=${userinfo.userId}" class="btn custom-btn d-lg-block d-none" style="background-color: black;">CANCEL</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/include/footer.jsp" %>

    <!--

T e m p l a t e M o

-->
    <!-- JAVASCRIPT FILES -->
    <script src="${root}/assets/js/jquery.min.js"></script>
    <script src="${root}/assets/js/bootstrap.min.js"></script>
    <script src="${root}/assets/js/jquery.sticky.js"></script>
    <script src="${root}/assets/js/custom.js"></script>

    <script>
        let f = document.getElementById("modify-form");
        // querySelector("#modify-form");
        <%--f.setAttribute("action", "${root}/user");--%>
        document.querySelector("#submitBtn").addEventListener("click", function () {
            console.log("aaaaa");
            // console.log(document.forms["modify-form"]);
            // document.forms["modify-form"].submit();
            let f = document.querySelector("#modifyForm");
            console.log(f);
            f.submit();
            // t();
            <%--let f = document.getElementById("modify-form");--%>
            <%--// querySelector("#modify-form");--%>
            <%--f.setAttribute("action", "${root}/user");--%>
            <%--console.log(f);--%>
            <%--f.submit();--%>
            <%--// HTMLFormElement.prototype.submit.call(f);--%>
        });
        function t(){
            console.log(f);
            f.submit();
            // HTMLFormElement.prototype.submit.call(f);
        }
    </script>


</body>

</html>