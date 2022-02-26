<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="12" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${productMap.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${productFullList}" />

 <!-- <c:if test='${not empty pageNo}'>
	<script>
	
		window.addEventListener('load',function() {
			if(document.getElementById("${pageNo}")) {
			document.getElementById("${pageNo}").style.fontFamily = "kopub_bold";
			document.getElementById("${pageNo}").style.fontSize = "15px";
			}
		});
	</script>
</c:if>-->

<c:if test='${not empty order_option }'>
	<script>
	window.addEventListener('load',function() {
						document.getElementById("${order_option}").style.fontFamily = "kopub_bold";
					});
	</script>
</c:if>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-center product_01_banner">
			<img id="product_01_main_img"
				src="${contextPath}/resources/img/common/farm_main_banner.jpg"
				alt="상품리스트 배너 이미지">
		</div>
	</div>

	<div class="row">
		<div class="col-lg-8 offset-lg-2 text-center product_01_main_title">
		<a href="${contextPath}/product/product_list/farm.do?sub_option=전체">
		농산물 전체
		</a>
		</div>
	</div>

<!--  <div class="row">
		<div class="col-lg-6 offset-lg-3 text-center product_01_sub_title">	
			<a href="${contextPath}/product/product_list/farm.do?sub_option=채소">채소</a> 
			<a href="${contextPath}/product/product_list/farm.do?sub_option=곡물">곡물</a> 
			<a href="${contextPath}/product/product_list/farm.do?sub_option=과일">과일</a>
		</div>
	</div> -->

	<div class="row">
		<div class="col-lg-12 .product_01_hr"></div>
	</div>

</div>


<!-- 아이템 필드  -->
<div class="container">
	<div class="row">
		<div class="col-lg-4 text-left">총 [ <span id="text_bold">${itemSize} 건</span> ] 의 상품이 있습니다.</div>
	</div>

	<div class="row product_01_filter">
		<div class="col-lg-7 text-left">
			<a id="count" href="${contextPath}/product/product_list/farm.do?order_option=count">판매 인기순</a> 
			<a id="cre_date" href="${contextPath}/product/product_list/farm.do?order_option=cre_date">등록일순</a> 
			<a id="high_price" href="${contextPath}/product/product_list/farm.do?order_option=high_price">높은 가격순</a> 
			<a id="low_price" href="${contextPath}/product/product_list/farm.do?order_option=low_price">낮은 가격순</a>
		</div>

		<div class="col-lg-2 offset-lg-3 text-center">
   			<div class="search_box">
    			<input type="text" class="search_box_text" id="search_title" maxlength="9" onkeypress="if(event.keyCode=='13'){event.preventDefault(); serach_title();}">
    			<img src="${contextPath}/resources/img/common/search-icon.png" onclick="serach_title()" class="search_box_btn" >
    		</div>
		</div>

	</div>
	
	<c:if test="${empty itemList}">
		<br><div class="col-lg-12 text-center">등록된 상품이 없습니다.</div>
	</c:if>

	<div class="row">
	
	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="1" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:set var="key" value="product${j}" />
			<c:if test="${not empty itemList[key].product_id && i< pageNoMax+1}">
	
		<div class="col-lg-4">
		

		
			<div class="product_01_image">	
				<a href="${contextPath}/product/productDetail.do?product_id=${itemList[key].product_id}">
					<img src="data:image/jpeg;base64,${itemList[key].image_file}" alt="상품 이미지">
				</a>		
			</div>
			
			<div class="row item-format">
			
				<div class="col-lg-6">
					<a href="${contextPath}/product/productDetail.do?product_id=${itemList[key].product_id}"> 
					<span class="item-title">${itemList[key].product_main_title}</span>		<br>
					<span class="item-comment">${itemList[key].product_sub_title}</span>
					</a> 
				</div>
				
				<div class="col-lg-3 main_item_bottom_text">
					<span class="item-price"><fmt:formatNumber value="${itemList[key].product_price}" />원</span> 
					<span class="item-dc"><fmt:formatNumber value="${itemList[key].product_discount}" />원</span> <br>
					<span class="item-real-price"><fmt:formatNumber value="${itemList[key].product_price - itemList[key].product_discount}" />원</span>
				</div>
				
				<div class="col-lg-3 text-right">
					<a href="${contextPath}/cart/addProductInCart.do?cart_count=1&product_id=${itemList[key].product_id}">
						<img src="${contextPath}/resources/img/common/cart-put-icon.png" alt="카트 담기 버튼 이미지">
					</a>
				</div>
				
			</div>
			
		</div>
		</c:if>
		
		
		</c:forEach>
		
			<!-- <c:if test="${itemSize > pageNoMax}">

					<div class="col-lg-12 text-center admin_product_page_index">
						<a href="#" onclick="pageMove(this.id)" id="이전">이전</a>
						<c:if test="${itemSize > pageNoMax}">
						
							<c:set var="maxNo" value="${itemSize+pageNoMax-1}" />
							
							<c:forEach var="x" begin="1" end="${maxNo / pageNoMax}">
								<fmt:parseNumber type="number" integerOnly="true" var="noFlag" value="${(pageNo+pageNoMax-1) / pageNoMax}" />
							
								<c:if test="${(noFlag * pageNoMax) - (pageNoMax-1) <= x and x <= (noFlag * pageNoMax)}">
									<a href="#" onclick="pageMove(this.id)" id="${x}">${x}</a>
								</c:if>
							</c:forEach>
							
						</c:if>

						<a href="#" onclick="pageMove(this.id)" id="다음">다음</a>
					</div>

			</c:if>	-->
				
	</c:if>
		
		
	</div>







</div>

<script>
// 페이지 이동 스크립트
	function pageMove(no) {
		var getValue = 0;
		var lastPage = parseInt(${itemSize+pageNoMax-1} / ${pageNoMax});
		if(no == "이전" || no == "다음") {
			var uriValue = window.location.search;
			
			var array = uriValue.split("pageNo=");
			if(array[1] == "" || array[1] == null) {
				array[1] = 1;
			}
			getValue = array[1];
		}
		
		if(no == "이전") {
			if(getValue == 1) {
				alert("마지막 페이지 입니다.");
			}
			else {
			document.location='${contextPath}/product/product_list/farm.do?pageNo='+(--getValue);
			}
		}
		else if (no == "다음") {
			if(getValue == lastPage) {
				alert("마지막 페이지 입니다.");
			}
			else {
			document.location='${contextPath}/product/product_list/farm.do?pageNo='+(++getValue);
			}
		}
		else {
			document.location='${contextPath}/product/product_list/farm.do?pageNo='+no;
		}
	}
function serach_title() {
	let title = document.getElementById("search_title").value;
	
	if(title != null && title != "") {
		document.location='${contextPath}/product/product_list/farm.do?title_option='+title;
	}
	
}
</script>