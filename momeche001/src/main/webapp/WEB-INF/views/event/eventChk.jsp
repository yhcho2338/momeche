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
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Momeche 이벤트 메인</title>
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
    	
    	 <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">이벤트</h1>
                    <p class="lead fw-normal text-white-50 mb-0">이벤트창 입니다.</p>
                </div>
            </div>
        </header>
        <div class = "event_all-area">
            <div class="event_division-area">
                <a href="#" class="btn btn-outline-dark">전체</a>
                <a href="#" class="btn btn-outline-dark">진행중인 이벤트</a>
                <a href="#" class="btn btn-outline-dark">종료된 이벤트</a>
            </div>
            <hr width="85%">
            <div class = "area1">
        <div class="area2">
          <c:set  var="product_count" value="0" />
                        <c:forEach var="item" items="${eventList}" >
                        <c:set  var="product_count" value="${product_count+1 }" />
              
                    <!-- 상품 첫번째 줄-->
                    <div class="area3">
                    <div id = "perfume_1" class="xans-recode-">
                        <div class="prd_box">
                        	<!-- 20220206 페이지 상세 하이퍼링크 설정 신우주 -->
                            <a href="${contextPath}/goods/productDetail.do?pd_id=${item.pd_id }">
                            <div class="thumb_img"> 
                              	<img width="121" height="154"  src="${contextPath}/thumbnails.do?pd_id=${item.pd_id}&fileName=${item.pd_fileName}">
                            </div>
                            </a>
                            <div class="description">
                                <span style = "background-color: #bc0000;">11.18-11.30</span>
                                <span style = "background-color: #000000">0원 EVENT</span>
                            </div>
                            <strong class="perfume_name">
                                <a href="${contextPath}/goods/productDetail.do?pd_id=${item.pd_id }">
                                    <span style = "font-style:15px; color:#555555; font-weight: bold;">${item.pd_name}</span>
                                </a>
                            </strong>
                            <div class="price" value="${item.pd_price}">${item.pd_price} 원</div>
                            <div class="price2"></div>
                            <div class="icon_cart">
                                <a href ="#"><i class="bi-cart-fill me-1"></i></a>
                            </div>
                            
                            	   <c:if test="${product_count==15}">
        						 <div class="perfume">
          						 <font size=20> <a href="#">more</a></font>
        							 </div>
    							</c:if>
                        </div>
                    </div>
                    </div>

     
               
               </c:forEach>
        </div>
    </div>

	</body>
</html>