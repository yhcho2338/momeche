<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<!-- 카트페이지 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList" value="${cartMap.myCartList}" />
<c:set var="myProductList" value="${cartMap.myProductList}" />
<c:set var="totalProductNum" value="0" />
<c:set var="totalDeliveryPrice" value="0" />
<c:set var="totalDiscountedPrice" value="0" />


<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>

<!-- 카트 js 설정을 위해 삽입 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/cartCss.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%--상품 삭제 js --%>
<script type="text/javascript">
function delete_cart_product(cart_num){
	var cart_num=Number(cart_num);
	var formObj=document.createElement("form");
	var i_cart = document.createElement("input");
	i_cart.name="cart_num";
	i_cart.value=cart_num;
	
	formObj.appendChild(i_cart);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/cart/removeCartProduct.do";
    formObj.submit();
}
</script>

<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<input type="checkbox" id="menuicon">
        <ul>
            <li>
                <label for="menuicon">
                   <span></span><span></span><span></span>
                </label>
            </li>
        </ul>
        <!-- 사이드 바-->
        <div class="sidebar">
            <ul style="margin-top:15px;">
                <hr style="height: 5px; background-color:rgb(33,37,41); margin-top:30px;">
                <li style="font-size:50px; color:rgb(33,37,41); text-align: center; margin-top:35px;">Momeche</li>
                <hr style="height: 5px; background-color:rgb(33,37,41); margin-top:30px;">
                <li id="li_mypage"><a href="${contextPath}/mypage/myPageMain.do">MYPAGE</a></li>
                <hr style="margin-bottom:30px;">
                <li class = "side_bar-menu"><a href="#">회원정보</a></li>
                <li class = "side_bar-menu"><a href="#">주문/배송조회</a></li>
                <li class = "side_bar-menu"><a href="#">환불/취소/교환</a></li>
                <li class = "side_bar-menu"><a href="${contextPath}/cart/myCartList.do">장바구니</a></li>
                <li class = "side_bar-menu"><a href="#">관심상품</a></li>
                <li class = "side_bar-menu"><a href="#">적립금</a></li>
                <li class = "side_bar-menu"><a href="#">회원등급정보</a></li>
                <li class = "side_bar-menu"><a href="#">1:1문의</a></li>
                <li class = "side_bar-menu"><a href="#">A/S</a></li>
                <li class = "side_bar-menu"><a href="#">내가 쓴 리뷰</a></li>
                <li class = "side_bar-menu"><a href="${contextPath}/member/memberDeleteView.do">회원 탈퇴</a></li>
            </ul>
            <hr>
            <p style="font-size:30px; font-weight: bold;"><i class="bi bi-telephone-fill"></i>1899-1234</p>
            월~금  AM:10:00 ~ 17:00
            <br>
            토,일 공휴일 휴무
        </div>

        <!-- 사이드 바 끝-->
<div class = "cart_body" style = "margin-top:25px; margin-left:300px;">
	<div class = "cart_body2" >
		<div class = "contents_title">
         	${member.mb_name}님의 장바구니<hr>
       	</div>
                
	<form>
		<input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv" style="background-color:#22262a; color:white;">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv" style="background-color:#22262a; color:white;">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv" style="background-color:#22262a; color:white;">
    
                        <div class="basketcmd" >삭제</div>
                    </div>
                    <div class="split"></div>
                </div>

				<c:forEach var="item" items="${myProductList}" varStatus="cnt">
					<c:set var="cart_count" value="${myCartList[cnt.count-1].cart_count}" />
				       <c:set var="cart_num" value="${myCartList[cnt.count-1].cart_num}" />
					
					<div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="product-main-image">
                                 <span><img width="85" height="85" 
				     src="${contextPath}/thumbnails.do?pd_id=${item.pd_id}&fileName=${item.pd_fileName}"></span>
                                
                        </div>
                        <!-- 
                        <div class="img"><img src=".${contextPath}/thumbnails.do?pd_id=${item.pd_id}&fileName=${item.pd_fileName}" width="60"></div>
                         -->
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="pname">
                            <span>${item.pd_name}</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price" value="${item.pd_price }"><fmt:formatNumber pattern="###,###,###" value="${item.pd_price }"/> 원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num${cart_num}" id="p_num${cart_num}" size="2" maxlength="4" class="p_num" value="${cart_count}" onkeyup="javascript:basket.changePNum(${cart_num});" style="width:65px;">
                                <span onclick="javascript:basket.changePNum(${cart_num});"><i class="w3-xlarge w3-text-black fa fa-arrow-left down"></i></span>&nbsp;&nbsp;&nbsp;
                                <span onclick="javascript:basket.changePNum(${cart_num});"><i class="w3-xlarge w3-text-black fa fa-arrow-right up"></i></span>
                            </div>
                        </div>
                        <div class="sum"><fmt:formatNumber pattern="###,###,###" value="${item.pd_price }"/>원</div>
                    </div>
                    <div class="subdiv">
                       <%-- <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem('${cart_num}');">삭제</a></div> --%>
                        <%-- 삭제 버튼 설정 --%>
                        <div class="basketcmd"><a href="javascript:delete_cart_product('${cart_num}');" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                	</div>

				</c:forEach>
				</div>
				<div class="right-align basketrowcmd">
                <a href="javascript:delete_cart_product('${cart_num}');" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 0개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price" name="">합계금액: 0원</div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
            </div>
			<!--  </table>-->
		
	</form>
	</div>
   </div>
                
                
             
                
</body>
</html>