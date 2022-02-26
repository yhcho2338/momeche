<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="infoArticle" value = "${infoMap.info }"/>



<%
  request.setCharacterEncoding("UTF-8");
%> 
 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>글목록 창</title>
</head>

<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	    
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/info/info_articleForm.do';
	  }
	}
</script>
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
  border-top:1px solid #22262a;
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

details {
  background:white;
  margin-bottom: 5px;
  text-align: left;
}
summary {
  width:500px;
  padding:10px;
  cursor: pointer;
}
summary::marker {
  display: none;
  content: "";
}

.table232 td{ text-align:center}
</style>

<body>
<div class = "body-area1" style = "margin-top:100px;">
	<div class = " body-area2">
	<div class = "contents_title">
                    <h1> - 향수 정보소개 - </h1>
                    <hr>
                </div>
<table class="table232" align="center" border="2">
  <tr height="30" align="center" style="background-color:#22262a; color:white;">
     <th >NO</th>
     <th >작성자</th>
     <th>영상썸네일</th>              
     <th >제목</th>
     <th >작성일 </th>
  </tr>
  
<c:choose>
  <c:when test="${empty infoList}">
    <tr  height="50">
      <td colspan="6" width="1800">
         <p align="center">
            <b><span style="font-size:13px;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  
  
  <c:when test="${!empty infoList}" >
    <c:forEach  var="info" items="${infoList}" varStatus="info_Num" >

	    <tr>
	   		<td>${info.info_num} </td>
	   	
			<td>${info.mb_id} </td>
		
			<td>
			<!-- 
			<c:if test="${!empty article.article_photo}">
				<input  type= "hidden"   name="originalFileName" value="${article.article_photo}" />
				<div class = "csc_img"> <a href="${contextPath}/board/viewArticle.do?article_num=${article.article_num}">
				<img src="${contextPath}/imgdownload.do?article_num=${article.article_num}&article_photo=${article.article_photo}" width="200" height="200" id="preview">
				<br></a></div>
			</c:if>
			<c:if test = "${empty article.article_photo }">
				<div class = "csc_img"><img src="${contextPath}/resources/image/not_image.jpg"></div>
			</c:if> -->
			  <c:choose>
        		<c:when test="${not empty info.info_url}">
        			<span class="img">
            			<img src="https://img.youtube.com/vi/${info.info_url_origin}/mqdefault.jpg" alt="유튜브 동영상 이미지입니다." >
        			</span>    
        		</c:when>
        	  <c:otherwise>
            		<span class="img">
                		<img src="" alt="등록된 동영상 이미지가 없습니다." class="img" />
            		</span>
        	  </c:otherwise>
    			</c:choose>        
			
			</td>
			
	
	        <!-- <a href="${contextPath}/board/viewArticle.do?article_num=${article.article_num}" -->
			<td width="30%">
	            <details>
	            <summary>
	             ${info.info_title} <a href="${contextPath}/info/viewInfo.do?info_num=${info.info_num}" style="float:right; font-weight:bold">[상세보기]</a>
	            </summary>
	            <input type = "checkbox" name = "accordion" id = "answer0${info.info_num }">
	            <label id ="label" for = "answer0${info.info_num }">
	             ${info.info_content} <a href="${contextPath}/info/viewInfo.do?info_num=${info.info_num}"></a>
	            </label>
	           <!-- <div style="word-break:break-all">
	                <p>${article.replyContent}</p>
	            </div> -->
	
	            </details>
	        </td>
			 <td  width="10%">${info.info_wDate}</td>
		</tr>
		</c:forEach>
     </c:when>
    </c:choose>
</table>

<!-- <a  class="cls1"  href="#"><p class="cls2">글쓰기</p></a> -->
<c:if test="${member.mb_level>=8 and member.mb_level!=null}">
	<a style="float:right; margin-top: 20px; font-size:20px; font-weight:bold; border:1px solid black; padding:5px; background-color:#22262a; color:white; border-radius:3px;"  
		href="javascript:fn_articleForm('${isLogOn}','${contextPath}/info/info_articleForm.do','${contextPath}/member/loginForm.do')">글쓰기</a>
</c:if>
 </div>
</div>

</body>
</html>