<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

 
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
	    obj.action="${contextPath}/board/listOto.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_oto_title").disabled=false;
		 document.getElementById("i_oto_content").disabled=false;
		 document.getElementById("i_oto_photo").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modOtoArticle.do";
		 obj.submit();
	 }
	 
	 function fn_modify_reply(obj){
		 obj.action="${contextPath}/board/modOtoReply.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,oto_num){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var article_numInput = document.createElement("input");
	     article_numInput.setAttribute("type","hidden");
	     article_numInput.setAttribute("name","oto_num");
	     article_numInput.setAttribute("value", oto_num);
		 
	     form.appendChild(article_numInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, oto_parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","oto_parentNO");
	     parentNOInput.setAttribute("value",oto_parentNO);
		 
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
	    <input type="text"  value="${oto.oto_num }"  disabled />
	    <input type="hidden" name="oto_num" value="${oto.oto_num}"  />
	   </td>
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      작성자 아이디
	   </td>
	   <td >
	    <input type=text value="${oto.mb_id}" name="writer"  disabled />
	   </td>
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      제목 
	   </td>
	   <td>
	    <input type=text value="${oto.oto_title }"  name="oto_title"  id="i_oto_title" disabled />
	   </td>   
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      내용
	   </td>
	   <td>
	    <textarea rows="20" cols="60"  name="oto_content"  id="i_oto_content"  disabled />${oto.oto_content }</textarea>
	   </td>  
	  </tr>
	  <tr>
		   <td width="150" align="center" bgcolor="#22262a">
		      등록일자
		   </td>
		   <td>
		    <input type=text value="<fmt:formatDate value="${oto.oto_wDate}" />" disabled />
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
	       <c:if test="${member.mb_id == oto.mb_id and oto.oto_title != '답변완료'}">
		      <input type=button value="수정하기" onClick="fn_enable(this.form); addInput();">
		      <input type = "button" value = "수정완료" onClick = "fn_modify_article(frmArticle)" >
		   </c:if>
		   
		   	<c:if test="${oto.oto_title == '답변완료'}">
		      <input type=button value="답글수정하기" onClick="fn_enable(this.form); addInput();">
		      <input type = "button" value = "답글수정완료" onClick = "fn_modify_reply(frmArticle)" >
		   </c:if>
		   
		   
		   <c:if test="${member.mb_id == oto.mb_id or member.mb_id =='admin' or member.mb_level == 10}"> 
		      <input type=button style = "float:right;"value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeOtoArticle.do', ${oto.oto_num})">
		    </c:if>
		    <input type=button value="리스트로 돌아가기" style = "float:right;" onClick="backToList(this.form)">
		    <c:if test = "${member.mb_level >=6 }">
		    <input type=button value="답글쓰기" style ="float:right" onClick="fn_reply_form('${contextPath}/board/oto_replyForm.do?oto_parentNO=${oto.oto_parentNO}', ${oto.oto_parentNO})">
		    </c:if>
	   </td>
	  </tr>
	 </table>
	 </form>
	 
	 <div class ="answerArea" style = "border:1px solid black; width:664px;">
	 <table>
	  <c:if test = "${oto.replyContent != null}">
	 <tr>
	 	<th>답변 내용 : </th>
	 </tr>
	 <tr>
	 	 <td><input type = "text" value="${oto.replyContent}" style = "height:100px; width:658px;" disabled/></td>
	 </tr>
	 </c:if>
	 
	 </table>
	 </div>
	 
	 
 	</div>
 </div>
</body>
</html>