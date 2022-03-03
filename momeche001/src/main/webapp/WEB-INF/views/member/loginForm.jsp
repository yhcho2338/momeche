<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result }" />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Momeche 로그인</title>

        
        <c:choose>
		<c:when test="${result=='loginFailed' }">
	  	<script>
	   	 window.onload=function(){
	     alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세용");
	     location.href="loginForm.do";
	    }
	    
	  	</script>
		</c:when>
		</c:choose> 
		<script>
		
		$(function(){
			$("#find_id_btn").click(function(){
			location.href="../member/find_id.do";
		
			})
		})
	</script>
    </head>
    <body>
    	
        <div class = "body-area1">
        <div class = "body-area2">
            <form class="login_form" action="${contextPath}/member/login.do" method="POST">
                <div class = contents_title>
                    로그인
                    <hr>
                </div>
                <div class = "login_contents">
                    <h3 class="login_id">
                        <label for = "login_id">아이디</label>
                    </h3>
                    <span class = "ps_box id">
                        <input type="text" id ="login_id" name="mb_id" maxlength="20">
                    </span>

                    <h3 class="login_pw">
                        <label for = "login_pw">비밀번호</label>
                    </h3>
                    <span class = "ps_box pw">
                        <input type="password" id ="login_pw" name="mb_pw" maxlength="20">
                    </span>
                    <div class="idpw-find">
                        <span id="id_save">
                            <input type="checkbox" id="save_id">
                            <label for = "save_id">아이디저장</label>
                        </span>
                        <a id="find_id_btn" href="#">아이디</a>/<a href="#">비밀번호 </a>찾기
                    </div>
                    <div class = "login_contents-button">
                        <button type = "submit" class="button1">로그인</button>
                    </div>
                    
                    
                    <!-- 카카오 로그인 -->
                    <c:if test="${userId eq null}">
				        <a href="https://kauth.kakao.com/oauth/authorize?client_id=ddbb538ec4bed14008f92e3da8026791&redirect_uri=http://localhost:8080/momeche001/member/login&response_type=code">
				            <img src="${contextPath}/resources/image/kakao_login.png" 
				      		style="image-rendering: -webkit-optimize-contrast; margin-top:20px; margin-left:425px;">
				        </a>
				    </c:if>
				    <c:if test="${userId ne null}">
				        <h1>로그인 성공입니다</h1>
				    </c:if>
                	<!-- 카카오 로그인 끝 -->
                                          
                    
                </div>
            </form>
        </div>
    </div>    


</body>
</html>