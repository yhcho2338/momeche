<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!-- <c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> -->

<!DOCTYPE html>

<html>
<head>
 <!--  <style>
   .no-underline{
      text-decoration:none;
   }
 </style> -->
 
 
 		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>사이드 메뉴</title>
        <!-- Favicon-->
        <link rel="icon" type="resources/image/x-icon" href="resources/assets/favicon.ico" />


        
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        <script src="resources/js/scripts.js"></script>
        
  
</head>
<body>

<div class= "side_bar">
            <ul class="side_bar_menu">
                <p style ="font-size:30px; font-weight: bold; border-bottom:4px solid black;">마이쇼핑</p>
                <li><a href="#">회원정보</a></li>
                <li><a href="#">주문/배송조회</a></li>
                <li><a href="#">환불/취소/교환</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">관심상품</a></li>
                <li><a href="#">적립금</a></li>
                <li><a href="#">회원등급정보</a></li>
                <li><a href="#">1:1문의</a></li>
                <li><a href="#">A/S</a></li>
                <li><a href="#">내가 쓴 리뷰</a></li>
            </ul>
        </div>

</body>
</html>