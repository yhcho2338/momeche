<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="orderer" value="${orderer}" />
<c:set var = "oto" value="${oto}"/>
<c:set var = "myOrderList" value="${myOrderList}"/>

<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- 20220216 1:1문의 게시판 스타일 가져옴 최승진 제작 jsp 부분입니다. 신우주 -->
<style>
.csc_img img {width:300px; height:200px;}
.accordion {
  position:absolute;
  top:30%;left:50%;
  transform:translateX(-50%);width:500px;}

input[id*="answer"] {display:none;}

input[id*="answer"] + label {
  display:block;
  width:500px;
  padding:10px;
  background:white;
  color:black;
  cursor:pointer;
  position:relative;
}

input[id*="answer"] + label + div {
  max-height:0;
  transition: all .35s;
  overflow:hidden;
  background:rgba(231, 231, 231, 0.411);
  font-size:11px;
}

input[id*="answer"] + label + div p {display:inline-block;padding:20px;}
input[id*="answer"]:checked + label + div {max-height:100px; font-weight: bold;}
input[id*="answer"]:checked + label em {background-position:0 -30px;}


#oto_table {margin-left:auto; margin-right:auto;}

#oto_table td{ text-align:center; height:30px;}

#oto_table th {background-color:#22262a; color:white; width:100px;}
</style>
<!-- 20220216 스타일 끝 -->
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
                <li class = "side_bar-menu"><a href="${contextPath}/mypage/myDetailInfo.do">회원정보</a></li>
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
                <table class="first_table">
                    <tr>
                        <th>${member.mb_name}님의 마이페이지 입니다.</th>
                    </tr>
                    <tr>
                        <td>주문 / 배송 : 1건<br> 적립금 : 1,000원</td>
                    </tr>
                </table>

                <div class = "table_top_text">
                    주문/배송조회(최근 1개월)
                    <a  class="table_top_text_a" href="#">더보기</a>
                </div>

                 <table class="second_table" border="1"  align="center"  width="70%">
    				<tr align="center">
     		 			<th>주문 아이디</th>
                        <th>주문자</th>
                        <th>주문내용</th>
                        <th>주문일자</th>
                        <th>배송현황</th>
      
   					</tr>
   
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
				</table>
				 <div class = "table_top_text">
                    1:1 문의
                    <a  class="table_top_text_a" href="#">더보기</a>
                </div>
  <table id = "oto_table">
    <tr>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>답변여부</th>
    </tr>
<c:choose>
<c:when test="${empty otoList}">
<tr>
<td  style="width:600px;" colspan="4">등록된 글이 없습니다.</td>
</tr>
</c:when>

<c:when test="${!empty otoList}">
<c:forEach  var="oto" items="${otoList}"  varStatus="otoNum">
<c:if test = "${member.mb_id == oto.oto_id or member.mb_id == 'admin'}">
    <tr>
    <c:if test = "${oto.depth==1 }">
      <td style="width:500px; border:1px solid black; background-color:pink;">
      <a href="${contextPath}/board/viewOtoArticle.do?oto_num=${oto.oto_num}"><b>┗ ${oto.oto_title}</b></a>
    </td>
    </c:if>
    
    <c:if test = "${oto.depth ==0}">
          <td style="width:500px; border:1px solid black;">
      <a href="${contextPath}/board/viewOtoArticle.do?oto_num=${oto.oto_num}">${oto.oto_title}</a>
    </c:if>
    
    <td> ${oto.oto_id}
    <td> ${oto.oto_wDate} </td>
  <c:if test ="${oto.answerornot==1}">
    <td style = "color:darkred;"><b>답변완료</b></td>
  </c:if>
  <c:if test = "${oto.answerornot==0 }">
  	<td style = "color:gray;">답변대기중</td>
  </c:if>
    </tr>
 </c:if>
    </c:forEach>
    </c:when>
    </c:choose>
    </table>
  </div>
</div>
				
				
				<!-- 20220216 1:1문의 내역 리스트 실제 구현 위해서 연습용 코드 주석 처리 신우주
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
                 -->
                
            </div>
        </div>
</body>
</html>