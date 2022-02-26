<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html lang="en">
    <head>
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>momeche 훗터</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/favicon.ico" />

	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
          
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet"/>
    <script src="${contextPath}/resources/js/main.js" defer></script>
    <script src="${contextPath}/resources/js/scripts.js"></script>
    
 
  <!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
    </head>
    
    <body>
   <footer class = "footer1" style="po">
        <div class = "footer_link">
            <b>개인정보처리방침</b>
            <a href="#"><i class="bi bi-instagram" style="font-size:25px;"></i></a>
            <a href="#"><i class="bi bi-facebook" style="font-size: 25px;"></i></a>
            <a href="#"><i class="bi bi-youtube" style="font-size: 25px;"></i></a>
            <a href="#"><i class="bi bi-share-fill" style="font-size: 25px;"></i></a>
            </div>
        <div class = "footer_info">
            <p>(주)모매치(Momeche)<br>
            대표이사:개발자반 3조 / 대표전화 :1234-5678<br>
            통신판매업 신고번호 : 제2021-12345678<br>
            이메일:green3C@test.com<br>
            Copyright &copy; Your Website 2021</p>
        </div>
        <div class = "footer_Service">
            <p>고객센터<br>
                <b style = "font-size:30px;">1234-5678</b><br>
                평일 09시 ~ 20시 / 주말 10시 ~ 18시
            </p>
    </div>
    </footer>

	</body>
</html>