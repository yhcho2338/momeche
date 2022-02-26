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
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" > 
   
     function backToList(obj){
	    obj.action="${contextPath}/board/listArticles.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_article_title").disabled=false;
		 document.getElementById("i_article_content").disabled=false;
		 document.getElementById("i_article_photo").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_modify_admin_article(obj){
		 obj.action="${contextPath}/board/adminmodArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,article_num){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var article_numInput = document.createElement("input");
	     article_numInput.setAttribute("type","hidden");
	     article_numInput.setAttribute("name","article_num");
	     article_numInput.setAttribute("value", article_num);
		 
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
 
 <style>
   #mo_preview{width:400px; height:400px; border:3px solid black;}
   #preview {width:250px; height:200px;}
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
     
     th {color:white; background-color:#22262a; width:}
     
     .thumbnail img {width:300px; height:300px;}
     
     #admin_delete {
     	margin-left:450px; 
     	margin-top:50px;
     	width:300px;
     	height:50px;
     	background-color:#22262a;
     	color:white;
     	font-weight:bold;
     	font-size:20px;	
     }
     

input[id*="popup"] {display:none;}
input[id*="popup"] + label {display:inline-block;padding:20px;}
input[id*="popup"] + label + div {position:fixed;top:0;left:0;width:100%;height:100%;z-index:100;}
input[id*="popup"] + label + div > div {position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);background:#fff;z-index:2;}
input[id*="popup"] + label + div > div > label {position:absolute;top:0%;right:0%;transform:translate(40%,-40%);padding:20px;background:#dd5347;border-radius:100%;z-index:1;}
input[id*="popup"] + label + div > label {position:absolute;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.9);z-index:1;}
/*
input[id*="popup"] + label + div {display:none;}
input[id*="popup"]:checked + label + div {display:block;}
*/

input[id*="popup"] + label + div {opacity:0;visibility:hidden;transition:all 1s;}
input[id*="popup"]:checked + label + div {opacity:1;visibility:visible;}
   </style>
   
</head>
<body>
<div class = "body-area1">
	<div class = "body-area2">
	  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data" style = "margin-top:30px;">
	  <table style = "margin:auto;">
	  <tr>
	   <th>
	      글번호
	   </th>
	   <td >
	    <input type="text"  value="${article.article_num }"  disabled />
	    <input type="hidden" name="article_num" value="${article.article_num}"  />
	   </td>
	  </tr>
	  <tr>
	    <th width="150" align="center">
	      작성자 아이디
	   </th>
	   <td>
	    <input type=text value="${article.mb_id}" name="writer"  disabled />
	   </td>
	  </tr>
	  <tr>
	    <th width="150" align="center">
	      제목 
	   </th>
	   <td>
	    <input type=text value="${article.article_title }"  name="article_title"  id="i_article_title" disabled />
	   </td>   
	  </tr>
	  <tr>
	    <th width="150" align="center">
	      내용
	   </th>
	 	   <td>
	    <textarea rows="20" cols="60"  name="article_content"  id="i_article_content"  disabled />${article.article_content }</textarea>
	   </td> 
	  </tr>
	  <tr>
	  <th>
	  사진
	  </th>
	  <td>
	  	   <input type="checkbox" id="popup">
			<label for="popup">
				<c:if test="${not empty imageFileList && imageFileList!='null'}">
		  		<c:forEach var="item" items="${imageFileList}" varStatus="status" >
					<input  type= "hidden"   name="originalFileName" value="${item.article_photo }" />
					<img src="${contextPath}/imgdownload.do?article_num=${article.article_num}&article_photo=${item.article_photo}" id="preview"/>				     
				</c:forEach>
	 			</c:if>
	 		</label>
<div>
	<div>
		<label for="popup"></label>
			<div style = "text-align:center;  overflow:hidden; height:auto;">
			<c:if test="${not empty imageFileList && imageFileList!='null'}">
			  		<c:forEach var="item" items="${imageFileList}" varStatus="status" >
						<input  type= "hidden"   name="originalFileName" value="${item.article_photo }" />
						<img src="${contextPath}/imgdownload.do?article_num=${article.article_num}&article_photo=${item.article_photo}" id="mo_preview"/>				     
					</c:forEach>
		 	</c:if>
	 		</div>
	</div>
	<label for="popup"></label>
</div>
	 </td> 
	  </tr>
	 
	 	 <!--  <c:choose> 
		  <c:when test="${not empty article.article_photo && article.article_photo!='null'}">
		   	<tr>
			    <td width="150" align="center" bgcolor="#22262a"  rowspan="2">
			      이미지
			   </td>
			   <td>
			     <input  type= "hidden"   name="originalFileName" value="${article.article_photo }" />
			    <div class="thumbnail">
			    	<img src="${contextPath}/imgdownload.do?article_num=${article.article_num}&article_photo=${article.article_photo}" id="preview"  /><br>
			    </div>
			   </td>  
			  </tr>  
			  <tr>
			    <td>
			       <input  type="file"  name="article_photo " id="i_article_photo"   disabled   onchange="readURL(this);"   />
			    </td>
			  </tr> 
			 </c:when>
			 <c:otherwise>
			    <tr  id="tr_file_upload" >
					    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
					      이미지
					    </td>
					    <td>
					      <input  type= "hidden"   name="originalFileName" value="${articleMap.article_photo }" />
					    </td>
				    </tr>
				    <tr>
					    <td ></td>
					    <td>
					       <img id="preview"  /><br>
					       <input  type="file"  name="article_photo " id="i_article_photo"   disabled   onchange="readURL(this);"   />
					    </td>
				  </tr>
			 </c:otherwise>
		 </c:choose> -->
	 	 
	  
	  <tr>
		   <th>
		      등록일자
		   </th>
		   <td>
		    <input type=text value="<fmt:formatDate value="${article.article_wDate}" />" disabled />
		   </td>   
	  </tr>
	  <tr   id="tr_btn_modify"  align="center"  >
		   <td colspan="2"   >
		       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
	           <input type=button value="취소"  onClick="backToList(frmArticle)">
		   </td>   
	  </tr>
	    
	  <tr id="tr_btn">
	   <td colspan="2" align="center">
	       <c:if test = "${article.article_title !='관리자로 인해 삭제된 글입니다.'}">
	       <c:if test="${member.mb_id == article.mb_id}">
		      <input type=button value="수정하기" onClick="fn_enable(this.form)">
		      <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.article_num})">
		   </c:if>
		      <input type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/board/replyForm.do?parentNO=${article.parentNO}', ${article.parentNO})">
		    <input type=button value="리스트로 돌아가기"  onClick="backToList(this.form)">

		 </c:if>
	   </td>
	  </tr>
	 </table>
	
	 <c:if test="${member.mb_level>=6 }">
	  <input id = "admin_delete" type=button value="관리자 권한으로 삭제하기"   onClick="fn_modify_admin_article(frmArticle)"  >
	  <input id = "admin_delete" type=button value="완전히 삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.article_num})">
	 </c:if>
	 </form>
 	</div>
 </div>

</body>
</html>