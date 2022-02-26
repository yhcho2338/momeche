<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<c:set var="article" value = "${articleMap.article }"/>
<c:set var="imageFileList"  value="${articleMap.imageFileList}"  />
 
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
     
     td {color:white;}
     
     .thumbnail img {width:300px; height:300px;}

   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(obj){
	    obj.action="${contextPath}/board/listNotice.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_notice_title").disabled=false;
		 document.getElementById("i_notice_content").disabled=false;
		 document.getElementById("i_notice_photo").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modNoticeArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,notice_num){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var article_numInput = document.createElement("input");
	     article_numInput.setAttribute("type","hidden");
	     article_numInput.setAttribute("name","notice_num");
	     article_numInput.setAttribute("value", notice_num);
		 
	     form.appendChild(article_numInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value",parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
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
</head>
<body>
<div class = "body-area1">
	<div class = "body-area2">
	  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data" style = "margin-top:30px;">
	  <table  border=0  align="center">
	  <tr>
	   <td width=150 align="center" bgcolor=#22262a>
	      글번호
	   </td>
	   <td >
	    <input type="text"  value="${notice.notice_num }"  disabled />
	    <input type="hidden" name="notice_num" value="${notice.notice_num}"  />
	   </td>
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      작성자 아이디
	   </td>
	   <td >
	    <input type=text value="${notice.mb_id}" name="writer"  disabled />
	   </td>
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      제목 
	   </td>
	   <td>
	    <input type=text value="${notice.notice_title }"  name="notice_title"  id="i_notice_title" disabled />
	   </td>   
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      내용
	   </td>
	   <td>
	    <textarea rows="20" cols="60"  name="notice_content"  id="i_notice_content"  disabled />${notice.notice_content }</textarea>
	   </td>  
	  </tr>
	  <tr>
		   <td width="150" align="center" bgcolor="#22262a">
		      등록일자
		   </td>
		   <td>
		    <input type=text value="<fmt:formatDate value="${notice.notice_wDate}" />" disabled />
		   </td>   
	  </tr>
	  <tr id="tr_btn_modify"  align="center"  >
		   <td colspan="2"   >
		       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
	           <input type=button value="취소"  onClick="backToList(frmArticle)">
		   </td>   
	  </tr>
	    
	  <tr id="tr_btn">
	   <td colspan="2" align="center">
	       <c:if test="${member.mb_id == notice.mb_id or member_mb_id == 'admin' or member.mb_level == 10 or member.mb_id !=null}">
		      <input type=button value="수정하기" onClick="fn_enable(this.form); addInput();">
		      <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeNoticeArticle.do', ${notice.notice_num})">
		      <input type = "button" value = "수정완료" onClick = "fn_modify_article(frmArticle)" >
		    </c:if>
		    <input type=button value="리스트로 돌아가기" style = "float:right;" onClick="backToList(this.form)">
	   </td>
	  </tr>
	 </table>
	 </form>
 	</div>
 </div>
</body>
</html>