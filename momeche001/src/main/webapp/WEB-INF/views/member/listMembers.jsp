<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

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
  <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원 관리 테이블</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/favicon.ico" />


        
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
        <script src="${contextPath}/resources/js/scripts.js"></script>
  <style>
  .admin-member_list th {background-color:#22262a; color:white; height:30px;}
  .admin-member_list td {height:30px;}
  </style>
 
  <!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
  
  
  
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
        <!-- 2022.02.06 최승진 사이드 바 수정-->
        <div class="sidebar">
            <ul style="margin-top:15px;">
                <hr style="height: 5px; background-color:rgb(33,37,41); margin-top:30px;">
                <li style="font-size:50px; color:rgb(33,37,41); text-align: center; margin-top:35px;">Momeche</li>
                <hr style="height: 5px; background-color:rgb(33,37,41); margin-top:30px;">
                <li id="li_mypage"><a href="${contextPath}/admin/product/adminProductMain.do">ADMIN PAGE</a></li>
                <hr style="margin-bottom:30px;">
                <li class = "side_bar-menu"><a href="${contextPath}/admin/product/adminProductMain.do">상품관리</a></li>
                <li class = "side_bar-menu"><a href="${contextPath}/member/listMembers.do">회원관리</a></li>
                <li class = "side_bar-menu"><a href="#">홈페이지 관리</a></li>
                <li class = "side_bar-menu"><a href="#">게시판 관리</a></li>
            </ul>
            <hr>
            <p style="font-size:30px; font-weight: bold;"><i class="bi bi-telephone-fill"></i>1899-1234</p>
            월~금  AM:10:00 ~ 17:00
            <br>
            토,일 공휴일 휴무
        </div>
        
        
<div class="body-area1">
<div class = "body-area2">
  <div class = "contents_title">
  		회원관리
  </div>
<form name="listMember" method="post" action="${contextPath}/member/modMemberlevel.do"   enctype="multipart/form-data">
<table class="admin-member_list" border="1"  align="center"  width="70%" style="margin-left:auto; margin-right:auto;">
    <tr align="center">
      <th>아이디</th>
      <th>비밀번호</th>
      <th>이름</th>
      <th>이메일</th>
      <th>가입일</th>
      <th>회원등급수정</th>
      <th>회원등급</th>
      <th>삭제</th>
   </tr>
   
 <c:forEach var="member" items="${membersList}" >     
   <tr align="center">
      <td>${member.mb_id}</td>
      <td>${member.mb_pw}</td>
      <td>${member.mb_name}</td>
      <td>${member.email_1}</td>
      <td>${member.join_date}</td>
      <td>
	      <select name = 'mb_level' style="width:100px; border:0px solid;">
		      <option value =1>일반회원</option>
		      <option value =2>무슨회원</option>
		      <option value =3>무슨회원</option>
		      <option value =4>무슨회원</option>
		      <option value =5>무슨회원</option>
		      <option value =6>관리자1</option>
		      <option value =7>관리자2</option>
		      <option value =8>관리자3</option>
		      <option value =9>관리자4</option>
		      <option value =10>최종관리자</option>
	      </select>
      </td>
      <c:if test ="${member.mb_level<=5}">
      <td>일반회원</td>
      </c:if>
      <c:if test = "${member.mb_level>=6 and member.mb_level<10}">
      <td>관리자</td>
      </c:if>
      <c:if test = "${member.mb_level==10}">
      <td>최종관리자</td>
      </c:if>
      <td><a href="${contextPath}/member/removeMember.do?id=${member.mb_id}">삭제하기</a></td>
    </tr>
  </c:forEach>   
</table>
<div style="padding-top:10px;">
	<a  href="#" style="margin-left:920px;"><button class="button3" type="submit">적용하기</button></a>
	<!-- <p><a  href="${contextPath}/member/memberForm.do"><h5 style="text-align:center">회원가입</h5></a></p> -->
</div>
</form>
		<!--
              <div id="notice_pagination" style="margin-left:600px; margin-top:100px;">
                <div class="paging">
                <c:if test="${pageable.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/member/listMembers.do?pages=${pageable.startPage-1}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pageable.startPage}" end="${pageable.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pageable.page}">
                  			<button class="on" onclick="location.href='${contextPath}/member/listMembers.do?pages=${i}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/member/listMembers.do?pages=${i}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pageable.endPage < pageable.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/member/listMembers.do?pages=${pageable.endPage+1}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                </div>
              </div> -->
</div>
</div>
</body>
</html>