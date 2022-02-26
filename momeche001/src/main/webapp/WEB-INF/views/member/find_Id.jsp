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
    <div class = "body-area2">
        <form class="idpw-find-form" action="${contextPath}/member/find_id_result.do" method="POST">
        <div class = "contents_title">
            아이디 찾기
            <hr>
        </div>
        <div class="tab_content">
            <input type="radio" name="chk_info" id = "tab01" value="e-mail" checked>
            <label for = "tab01">이메일로 찾기</label>
            <input type="radio" name="chk_info" id = "tab02" value="phonenumber">
            <label for ="tab02">핸드폰번호로 찾기</label>


            <div class = "conbox con1">
                <p>이메일로 찾기</p>

                <input type="text" name="mb_name" placeholder="이름" maxlength="10">
                <input type = "text" name="email_1" placeholder="이메일">   
                <button type = "submit" class="button1">확인</button>
            </div>

            <div class = "conbox con2">
                <p>핸드폰번호로 찾기</p>
                <input type="text" name="mb_name" placeholder="이름" maxlength="10">
                <div class= "con2_phone">
                    <input type ="text" name="tel_1" maxlength=3>-<input type ="text" name="tel_2" maxlength="4">-<input type ="text" name="tel_3" maxlength="4">
                </div>
                <a href = "#"><button type = "submit" class="button1">확인</button></a>
            </div>
        </div>
    </form>
    </div>
    
</div>


	</body>
</html>