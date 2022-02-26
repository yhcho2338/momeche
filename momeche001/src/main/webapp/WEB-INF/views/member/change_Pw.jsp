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
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Momeche 비밀번호 변경</title>
        <!-- Favicon-->
        <link rel="icon" type="resources/image/x-icon" href="resources/assets/favicon.ico" />


        
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        <script src="resources/js/scripts.js"></script>
    </head>
    <body>
    
    
       <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">아이디/비밀번호 찾기</h1>
                    <p class="lead fw-normal text-white-50 mb-0">비밀번호 변경창 입니다.</p>
                </div>
            </div>
        </header>
        <div class = Login_InfoMessage>
            비밀번호 변경
        </div>
        <hr width=40%>
        <p style="text-align: center; padding-top:20px; font-weight: bold;">새로운 비밀번호를 입력하세요.</p>
        <form class="form-horizontal" action='' method="POST">
            <fieldset>
        <div class="login_control-group">
            <!-- 비밀번호 변경 -->
            <div class="controls">
              <input type="password" id="change_pw" name="change_pw" placeholder="" class="login_input-xlarge">
          </div>
          </div>
          <div class = "login_control-group">
              <!-- 비밀번호 확인-->
            <div class="controls">
                <input type ="password" id = "change_pw2" name = "change_pw2" placeholder="" class="login_input-xlarge">
            </div>
          </div>
          <div class = "pw_changebutton">
              <button type = "button" class="button_login">
                  변경하기
              </button>
          </div>
          </fieldset>
          </form>
    

	</body>
</html>