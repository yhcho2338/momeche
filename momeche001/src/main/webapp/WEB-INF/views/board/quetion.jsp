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


#qna_table {margin-left:auto; margin-right:auto;}

#qna_table td{ text-align:center}

#qna_table th {background-color:#22262a; color:white;}
</style>

<script>
	function fn_articleForm(isLogOn,qna_articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=qna_articleForm;
	    
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/qna_articleForm.do';
	  }
	}
</script>
</head>
<body>
  <div class = "body-area1">
  <div class = "body-area2">
  <div class = "contents_title">
  		자주묻는질문
  </div>
  <table id = "qna_table">
    <tr>
      <th>No</th>
      <th>제목</th>
      <th>작성일</th>
    </tr>
<c:choose>
<c:when test="${empty qnaList}">
<tr>
<td  style="width:600px;" colspan="3">등록된 글이 없습니다.</td>
</tr>
</c:when>

<c:when test="${!empty qnaList}">
<c:forEach  var="qna" items="${qnaList}"  varStatus="qnaNum">
    <tr>
      <td>${qnaNum.count}</td>
      <td style="width:500px; border:1px solid black;">

      <input type="checkbox" name="accordion" id="answer0${qna.qna_num }">
      <label id="label" for="answer0${qna.qna_num}" name = "accordion">
          ${qna.qna_title} <a href="${contextPath}/board/viewQnaArticle.do?qna_num=${qna.qna_num}" style="float:right; font-weight:bold">[상세보기]</a></label>
      <div>
      <p>${qna.qna_content }</p>
      </div>

    </td>
    <td> ${qna.qna_wDate} </td>
    </tr>
    </c:forEach>
    </c:when>
    </c:choose>
    </table>
    <c:if test ="${member.mb_id == 'admin' or member.mb_level == 10 }">
    <div style="margin-top:20px;">
    <a  style="color:white; margin-left:810px;" href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/qna_articleForm.do','${contextPath}/member/loginForm.do')">
    <button class="button3">글쓰기</button></a>
    </div>
    </c:if>
  </div>
</div>

</body>
</html>