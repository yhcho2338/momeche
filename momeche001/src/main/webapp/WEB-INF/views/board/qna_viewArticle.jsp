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
<meta charset="EUC-KR">
<title>Insert title here</title>
 <script>
 
 function fn_modify_article(obj){
	 obj.action="${contextPath}/board/modQnaArticle.do";
	 obj.submit();
 }
        function backToList(obj){
    	obj.action="${contextPath}/board/question.do";
    	obj.submit();
  	}
        
        function fn_enable(obj){
   		 document.getElementById("i_qna_title").disabled=false;
   		 document.getElementById("i_qna_content").disabled=false;
   	 }
        
        function fn_remove_article(url,qna_num){
   		 var form = document.createElement("form");
   		 form.setAttribute("method", "post");
   		 form.setAttribute("action", url);
   	     var qna_numInput = document.createElement("input");
   	     qna_numInput.setAttribute("type","hidden");
   	     qna_numInput.setAttribute("name","qna_num");
   	     qna_numInput.setAttribute("value", qna_num);
   		 
   	     form.appendChild(qna_numInput);
   	     document.body.appendChild(form);
   	     form.submit();
   	 
   	 }
   	 
    </script>
</head>
<body>
<div class = "body-area1">
    <div class = "body-area2">
        <div class = "contents_title">
        Q&A 상세보기
        <hr>
    </div>
    <form name="qna_articleForm" id="qna_articleForm" method="post" action="${contextPath}" enctype="multipart/form-data">
        <table class = "qna_viewarticleForm-table">
            <tr>
                <th>질문</th>
                <td><input type ="text" value = "${qna.qna_title}" id = "i_qna_title" name="qna_title" disabled></td>
            </tr>
            <tr>
                <th>답변</th>
                <td><textarea name="qna_content" rows="5" cols="60" id = "i_qna_content" disabled>${qna.qna_content}</textarea></td>
            </tr>
        </table>

        <c:if test="${member.mb_id == qna.mb_id or member_mb_id == 'admin' or member.mb_level == 10 }">
        <div class = "qna_viewAtricle_button">
		     <button class=button3 type="button" onClick="fn_enable(this.form)">수정</button>		     
		     <button class=button3 type = "button" onClick="fn_remove_article('${contextPath}/board/removeQnaArticle.do', ${qna.qna_num})">삭제하기</button>
		     <button class="button3" onclick="fn_modify_article(qna_articleForm)">등록하기</button>
		</div>
		 </c:if>
		 <button class="button3" style="margin-left:810px; margin-top:10px;" onclick="backToList(this.form)">목록보기</button>	 		 
    </form>
    </div>
</div>
</body>
</html>