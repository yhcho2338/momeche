<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slickex.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick-theme-ex.css">
        
        <title>회사 소개</title>
        <style type="text/css">
            
        </style>
    </head>
    <body>
    <div class = "contents_title">
                    회사 소개
                    <hr>
                </div>
        <section class="body-area1" >
            <div class = "body-area2" >
                <img src="${contextPath}/resources/image/perfume1.png" class="About-Us-image-box" > <p class="About-Us-text-box">
                낯선 이와의 교류가 많은 현대인의 일상에서 <br> 
                사람을 판단하는 주요 요소 중 하나인 채취는 <br>
                    <br>
                 선천적인 한계를 극복하기에 비용 대비 효율성이 높아<br> 
                 변화를 주기에 용이하다.<br>
					<br>
                    남과 다른 나를 어필하여 몸의 향기에 상대를 취하게 한다.<br> 
                    그 길을 제시하기 위한 향수 전문 쇼핑몰 <br>
                    <br>
                    '(주)모매치(momeche)' 입니다.</p>
            </div>
        </section>
    
    </body>
</html>