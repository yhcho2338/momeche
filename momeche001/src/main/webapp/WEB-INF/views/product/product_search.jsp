<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="imageList"  value="${productMWMap.imageList }"  />

<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 

<head>
 <title>상품검색 목록 페이지</title>
</head>
<body>
	<hgroup>
		
		
	</hgroup>
	
	<div class="clear"></div>

	<table id="list_view">
		<tbody>
			
		<div class = "area1">
        <div class="area2">
          <c:set  var="product_count" value="0" />
                        <c:forEach var="search" items="${productList}" >
                        <c:set  var="product_count" value="${product_count+1 }" />
              
                    <!-- 상품 첫번째 줄-->
                    <div class="area3">
                    <div id = "perfume_1" class="xans-recode-">
                        <div class="prd_box">
                        
                            <div class="thumb_img">
                               <a href="${contextPath}/goods/productDetail.do?pd_id=${search.pd_id }">
                              <img width="121" height="154"  src="${contextPath}/thumbnails.do?pd_id=${search.pd_id}&fileName=${search.pd_fileName}">
                              
                            </div>

                            <strong class="perfume_name">
                                <a href="#">
                                    <span style = "font-style:15px; color:#555555; font-weight: bold;">${search.pd_name}</span>
                                </a>
                            </strong>
                               </a>
                            <div class="price" value="${search.pd_price}">${search.pd_price} 원</div>
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
		</tbody>
	</table>
</body>