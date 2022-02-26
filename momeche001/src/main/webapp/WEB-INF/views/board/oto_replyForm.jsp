<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var = "oto" value = "${otoMap.oto}"/>

<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
<meta charset="UTF-8">
 <script src="//code.jquery.com/jquery-3.3.1.js"></script> 
<script type="text/javascript">

 function backToList(obj){
 	obj.action="${contextPath}/board/listOto.do";
 	obj.submit();
 }
 
 
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $('#preview').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }
  
</script> 
<title>답글쓰기 페이지</title>
</head>

<body>
<div class = "body-area1">
        <div class="body-area2">
 <p id = "frmReply-p"> 답글쓰기</p>
 
  <form name="frmReply" method="post"  action="${contextPath}/board/addOtoReply.do"   enctype="multipart/form-data">
    <table class = "frmReply-table">
    <tr>
    	<th align="right">게시글번호 : </th>
    	<td>
    	<input type="text" value ="${oto_parentNO}" disabled/>
    	<input type="hidden" name = "oto_parentNO" value ="${oto_parentNO}" />
    	</td>
    </tr>
    <tr>
		<th align="right"> 작성자:</th>
		<td>${member.mb_id}
	</tr>
	<tr>
		<th align="right">제목:&nbsp;  </th>
		<td><input type="text" value = "답변완료" size="67"  maxlength="500" name="oto_title"></td>
	</tr>
	<tr>
		<th align="right" valign="top"><br>내용:&nbsp; </th>
		<td><textarea name="oto_content" rows="10" cols="65" maxlength="4000"> </textarea> </td>
	</tr>
	<tr>
		<th align="right">비밀번호:&nbsp;  </th>
		<td><input type="password" size="10" maxlength="12" name="passwd"> </input> </td>
	</tr>
	<tr>
		<th align="right">이미지파일 첨부:  </th>
		<td> <input type="file" name="article_photo"  onchange="readURL(this);" /></td>
        <td><img  id="preview" src="#"   width=200 height=200/></td>
	</tr>
	<tr>
		<td align="right"> </td>
		<td>
		<input type=submit value="답글쓰기" />
		<input type=button value="취소"onClick="backToList(this.form)" />
		</td>
	</tr>
    </table>
  
  </form>
  </div>
  </div>
</body>
</html>