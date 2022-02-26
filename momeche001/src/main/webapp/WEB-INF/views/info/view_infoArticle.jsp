<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<c:set var="info" value = "${infoMap.info }"/>

 
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
	    obj.action="${contextPath}/info/listInfo.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_info_title").disabled=false;
		 document.getElementById("i_info_url").disabled=false;
		 document.getElementById("i_info_url_orgin").disabled=false;
		 document.getElementById("i_info_content").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/info/modInfo.do?info_url=${info.info_url}";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,info_num){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var article_numInput = document.createElement("input");
	     article_numInput.setAttribute("type","hidden");
	     article_numInput.setAttribute("name","info_num");
	     article_numInput.setAttribute("value", info_num);
		 
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
	    <input type="text"  value="${info.info_num }"  disabled />
	    <input type="hidden" name="info_num" value="${info.info_num}"  />
	   </td>
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      작성자 아이디
	   </td>
	   <td >
	    <input type=text value="${info.mb_id}" name="writer"  disabled />
	   </td>
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      제목 
	   </td>
	   <td>
	    <input type=text value="${info.info_title }"  name="info_title"  id="i_info_title" disabled />
	   </td>   
	  </tr>
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      영상링크
	   </td>
	   <td>
	    <input tupe=text name="info_url"  id="i_info_url" value="${info.info_url}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	   </td>  
	  </tr>
	  
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      영상
	   </td>
	   <td>
	    <iframe width="560" height="315" name="info_url_origin"  id="i_info_url_orgin" src="https://www.youtube.com/embed/${info.info_url_origin }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	   </td>  
	  </tr>
	  
	  <tr>
	    <td width="150" align="center" bgcolor="#22262a">
	      내용
	   </td>
	   <td>
	    <textarea rows="20" cols="60"  name="info_content"  id="i_info_content"  disabled />${info.info_content }</textarea>
	   </td>  
	  </tr>
	 
	 <!-- 
	 <c:if test="${not empty imageFileList && imageFileList!='null' }">
		  <c:forEach var="item" items="${imageFileList}" varStatus="status" >
			    <tr>
				    <td width="150" align="center" bgcolor="#22262a"  rowspan="2">
				      이미지${status.count }
				   </td>
				   <td>
				     <input  type= "hidden"   name="originalFileName" value="${item.article_photo }" />
				   <img src="${contextPath}/imgdownload.do?article_num=${article.article_num}&article_photo=${item.article_photo}" width="200" height="200" id="preview"><br>
				   </td>   
				  </tr>  
				  <tr>
				    <td>
				       <input  type="file"  name="article_photo " id="i_article_photo"   disabled   onchange="readURL(this);"  />
				    </td>
				 </tr>
			</c:forEach>
	 </c:if>
	 	 
	  <c:choose> 
		  <c:when test="${not empty article.article_photo && article.article_photo!='null' }">
		   	<tr>
			    <td width="150" align="center" bgcolor="#22262a"  rowspan="2">
			      이미지
			   </td>
			   <td>
			     <input  type= "hidden"   name="originalFileName" value="${article.article_photo }" />
			    <div class="thumbnail"><img src="${contextPath}/imgdownload.do?article_num=${article.article_num}&article_photo=${article.article_photo}" id="preview"  /><br></div>
			   </td>   
			  </tr>  
			  <tr>
			    <td ></td>
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
		 </c:choose>
		  -->
	  <tr>
		   <td width="150" align="center" bgcolor="#22262a">
		      등록일자
		   </td>
		   <td>
		    <input type=text value="<fmt:formatDate value="${info.info_wDate}" />" disabled />
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
	       <c:if test="${member.mb_id == info.mb_id or member.mb_level >=8}">
		      <input type=button value="수정하기" onClick="fn_enable(this.form)">
		      <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/info/removeInfo.do', ${info.info_num})">
		    </c:if>
		    <input type=button value="리스트로 돌아가기"  onClick="backToList(this.form)">
		    
	   </td>
	  </tr>
	 </table>
	 </form>
 	</div>
 </div>
</body>
</html>