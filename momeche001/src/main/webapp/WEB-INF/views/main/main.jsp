<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 



<!DOCTYPE html>
<html>
<head>
 
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>momeche main</title>
 
  <!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
  <!-- 슬릭스 구현 신우주 css 링크-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slickex.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick-theme-ex.css">
		<!-- 슬릭스 구현 신우주 style-->
		<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/jquery/slickmainex.js" type="text/javascript" charset="utf-8"></script>
  <!-- 슬릭스 연습 신우주 -->
  <script>
  		$(function(){
			$('#slider-div').slick({
				slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
				infinite : true, 	//무한 반복 옵션	 
				slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
				speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
				dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : true,			// 자동 스크롤 사용 여부
				autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
				vertical : false,		// 세로 방향 슬라이드 옵션
				prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
				nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
				dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
				draggable : true, 	//드래그 가능 여부 
				
				responsive: [ // 반응형 웹 구현 옵션
					{  
						breakpoint: 960, //화면 사이즈 960px
						settings: {
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							slidesToShow:3 
						} 
					},
					{ 
						breakpoint: 768, //화면 사이즈 768px
						settings: {	
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							slidesToShow:2 
						} 
					}
				]

			});
  		})
	</script>
	<!-- 슬릭스 연습 신우주 -->
</head>




<body>

<!-- Header-->
        <header class="bg-dark py-5" style="margin-left:-50px; width:1950px;">
        
        	<!-- 슬릭스 연습 신우주 -->
        	<div class="header_img">
        		<!-- <img src="${pageContext.request.contextPath}/resources/image/main_banner.jpg" width="100%" height="600"> -->
        		
        		<!-- 메인 슬릭스 구현 연습 신우주-->
        		<!-- stlye 은 slick 영역 확인용 -->
				<div>
				  	<div id="slider-div">
					    <div><img src="${pageContext.request.contextPath}/resources/image/main_purfume1.jpg" width="100%" style="height:500px;" alt="메인 베너"></div>
					    <div><img src="${pageContext.request.contextPath}/resources/image/main_image2.jpg" width="100%" style = "height:500px;"vspace="64px;"  alt="메인 베너2" ></div>
					    <div><img src="${pageContext.request.contextPath}/resources/image/main_purfume3.png" width="100%"  style="height:500px;" alt="메인 베너3" ></div>
				  	</div>
				</div>
        	
        	</div>
        	<!-- 슬릭스 연습 신우주 -->
        </header>


        <!-- Section-->
         <div class = "contents_title">
  			<div><img src="${pageContext.request.contextPath}/resources/image/bestperfume.png" width="30%"></div>
  		</div>
            
             <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5" >
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    
                    <div class="main_perfume">
   					<c:set var="product_count" value="0" />
         			<div class = "contents_title">
  						<b style="font-size:30px;">- BEST PERFUME -</b>
  					</div>
					<c:forEach var="item" items="${productMap.bestseller }" >
	   				<c:set  var="product_count" value="${product_count+1 }" />
					
					<div class="perfume">
					<a href="${contextPath}/goods/productDetail.do?pd_id=${item.pd_id }">
					<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
					
					<img width="121" height="154" 
				     src="${contextPath}/thumbnails.do?pd_id=${item.pd_id}&fileName=${item.pd_fileName}">

					<div class="title">${item.pd_name }</div>
					</a> 
					<div class="price">
		  	   		<fmt:formatNumber  value="${item.pd_price}" type="number" var="pd_price" />
		          		${pd_price}원
					</div>
					</div>
					
	   			<c:if test="${product_count==15}">
         		<div class="morePerfume">
          		 <font size=20> <a href="#">more</a></font>
         		</div>
     			</c:if>
  			</c:forEach>
			</div>
                </div>
            </div>
              <div class= "pagenation-main-page">
            </div>
         </section> 
            
         <section class="py-5-1">
            <div class="container px-4 px-lg-5 mt-5" >
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    
                    <div class="main_new">
   					<c:set var="product_count" value="0" />
         			<div class = "contents_title" style = "font-weight:800">
  						<div><img src="${pageContext.request.contextPath}/resources/image/newperfume.png" width="40%"></div>
  					</div>
					<c:forEach var="itemB" items="${productMap.newperfume }" >
	   				<c:set  var="product_count" value="${product_count+1 }" />
					
					<div class="perfume">
					<a href="${contextPath}/goods/productDetail.do?pd_id=${itemB.pd_id }">
					<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
					 
					<img width="121" height="154" 
				     src="${contextPath}/thumbnails.do?pd_id=${itemB.pd_id}&fileName=${itemB.pd_fileName}">

					<div class="title">${itemB.pd_name }</div>
					</a>
					<div class="price">
		  	   		<fmt:formatNumber  value="${itemB.pd_price}" type="number" var="pd_price" />
		          		${pd_price}원
					</div>
					</div>
					
	   			<c:if test="${product_count==15   }">
         		<div class="morePerfume">
          		 <font size=20> <a href="#">more</a></font>
         		</div>
     			</c:if>
  			</c:forEach>
			</div>
                </div>
            </div>
              <div class= "pagenation-main-page">
            </div>
        </section>

                
</body>
</html>                 
           

