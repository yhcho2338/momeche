<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%-- <c:set var="imageList"  value="${productMWMap.imageList }"  /> --%>

<%
  request.setCharacterEncoding("UTF-8");
  String sort = request.getParameter("sort"); 
  String pd_group1 = request.getParameter("pd_group1");
  String pd_group2 = request.getParameter("pd_group2");
  
 
	  
  
%> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Momeche 상품 메인</title>

    </head>
    <body>
    	<!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                 
                  
                    <h1 class="display-4 fw-bolder"><%=pd_group1 %> Perfume </h1>
                    <p class="lead fw-normal text-white-50 mb-0">향수 제품 페이지 입니다.</p>
                  
                
            </div>
        </header>
        <div class = "Product_Explanation"> <!-- 프리미엄 항목, 가성비 항목 등등-->
            프리미엄 항목
        </div>
        <!-- 줄 수정 -->
        <hr width=100% style="margin-bottom:10px;">
        <div class = "category_button">
        <a href="#" class="btn btn-outline-dark">ALL</a>    &nbsp;&nbsp;
        <a href="${contextPath}/goods/productSort.do?pd_group1=<%=pd_group1 %>&sort=price_high" class="btn btn-outline-dark">높은가격순</a> &nbsp;&nbsp;
        <a href="${contextPath}/goods/productSort.do?pd_group1=<%=pd_group1 %>&sort=price_low" class="btn btn-outline-dark">낮은가격순</a> &nbsp;&nbsp;
        <a href="${contextPath}/goods/productSort.do?pd_group1=<%=pd_group1 %>&sort=new_thing" class="btn btn-outline-dark">최신순</a>
    </div>
    <hr width=100% style="margin-top:10px;">
    <div class = "area1">
        <div class="area2">
          <c:set  var="product_count" value="0" />
                        <c:forEach var="item" items="${productMWMap}" >
                        <c:set  var="product_count" value="${product_count+1 }" />
              
                    <!-- 상품 첫번째 줄-->
                    <div class="area3">
                    <div id = "perfume_1" class="xans-recode-">
                        <div class="prd_box">
                        	<!-- 페이지 상세 하이퍼링크 -->
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