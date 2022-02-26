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
<meta charset="utf-8">
<title>Insert title here</title>
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

<script>
	function fn_articleForm(isLogOn,oto_articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=oto_articleForm;
	    
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/oto_articleForm.do';
	  }
	}
</script>
</head>
<body>
<div class = "body-area1">
  <div class = "body-area2">
  <div class = "contents_title">
  		1:1문의
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
<c:if test = "${member.mb_id == oto.mb_id or member.mb_level >=6}">
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
    <c:if test="${member.mb_id != null }">
    <div style="margin-top:20px;">
    <a  style="color:white; margin-left:805px;" href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/oto_articleForm.do','${contextPath}/member/loginForm.do')">
    <button class="button3">글쓰기</button></a>
    </div>
    </c:if>
  </div>
</div>
</body>
</html>