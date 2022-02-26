<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="false" %>
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
        function backToList(obj){
    	obj.action="${contextPath}/board/question.do";
    	obj.submit();
  	}
    </script>
</head>
<body>
<div class = "body-area1">
    <div class = "body-area2">
        <div class = "contents_title">
        Q&A 작성
        <hr>
    </div>
    <form name="qna_articleForm" id="qna_articleForm" method="post" action="${contextPath}/board/addNewQnaArticle.do" enctype="multipart/form-data">
        <table class = "qna_articleForm-table">
            <tr>
                <th>질문</th>
                <td><input type ="text" name="qna_title"></td>
            </tr>
            <tr>
                <th>답변</th>
                <td><textarea rows="5" cols="60" name="qna_content"></textarea> </td>
            </tr>
        </table>
        <div class = "qna_button">
            <button class="button3" onclick="backToList(this.form)">목록보기</button>
            <button class="button3" type="submit">등록하기</button>
        </div>
    </form>
    </div>
</div>
</body>
</html>