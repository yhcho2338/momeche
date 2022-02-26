<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원 관리 테이블</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/favicon.ico" />


        
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
        <script src="${contextPath}/resources/js/scripts.js"></script>
 
  <!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
  
</head>
    
<body>
	
	    <div class = "body-area1">
        <div class="body-area2">
            <div class = "contents_title">
                회원님의 아이디 정보입니다.
                <hr>
            </div>
                <table class = "result_table">
                  
                    <tr>
                        <th>아이디</th>
                        <td>${mb_id}</td>
                    </tr>
                   
                    </table>
                <div class = "id_result_button">
                    <a href="${contextPath}/member/loginForm.do"><button type="submit" class="button1">확인</button></a>
                    <a href=""><button type="submit" class="button1">비밀번호 찾기</button></a>
                </div>
        </div>
    </div>
	





</body>
</html>