<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
                <li class = "side_bar-menu"><a href="${contextPath}/mypage/myOrderList.do?mb_id=${member.mb_id}">주문/배송조회</a></li>
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
        <div class = "body-area1">
            <div class = "body-area2">
                <div class = "contents_title">
                    마이페이지
                </div>

                
                <table class="second_table" border="1"  align="center"  width="70%">
    			<tr align="center">
     		 			<th>주문자 아이디</th>
                        <th>이름</th>
                        <th>주문내용</th>
                        <th>주문일자</th>
                        <th>배송현황</th>
      
   			</tr>
   			
   			<c:choose>
  			<c:when test="${empty myOrderList}">
    				<tr  height="50">
      				<td colspan="6" width="1800">
         				<p align="center">
            			<b><span style="font-size:13px;"> ${member.mb_name}님의 주문내역이 없습니다.</span></b>
        				</p>
      				</td>  
    				</tr>
  			</c:when>
   
    		<c:when test="${!empty myOrderList}" >
			 <c:forEach var="myorders" items="${myOrderList}">     
   					<tr align="center">
       					<td>${myorders.mb_id }</td> 
                        <td>${myorders.receiver_name }</td>
                        <td>${myorders.pd_name } <br>
                        ${myorders.receiver_zipcode } <br>
                        ${myorders.receiver_road_address }</td>
                        <td>${myorders.order_date }</td>
                        <td>${myorders.order_state }</td> 
     
    			</tr>
  			</c:forEach>  
  			</c:when>
  			</c:choose> 
</table>
                

                <div class = "table_top_text">
                    1:1 문의
                    <a  class="table_top_text_a" href="#">더보기</a>
                </div>

                <table class="third_table">
                    <tr>
                        <th class="th_1">번호</th>
                        <th class="th_2">내용</th>
                        <th class="th_3">작성날짜</th>
                        <th class="th_4">답변여부</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>주문/배송조회 문의</td>
                        <td>2021-11-09</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>사이즈 문의</td>
                        <td>2021-11-10</td>
                        <td>답변 대기중</td>
                    </tr>
                </table>
            </div>
        </div>
</body>
</html>