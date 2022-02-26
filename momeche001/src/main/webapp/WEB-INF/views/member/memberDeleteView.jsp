<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!-- 탈퇴 신우주 -->
<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				alert("탈퇴 절차를 취소 하고 메인 페이지로 이동합니다.");
				location.href = "${contextPath}/main/main.do";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#mb_pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#mb_pw").focus();
					return false;
				}else if($("#mb_pw").val()!=${member.mb_pw}){
					alert("입력한 비밀번호는 맞지 않습니다. 다시 입력해 주세요.");
				}else if($("#mb_pw").val()==${member.mb_pw}){
					if(confirm("정말 탈퇴하시겠습니까?")){
						alert("회원탈퇴가 완료되었습니다.");
						//return true;
						//location.href = "${contextPath}/member/memberDelete.do";
						
					}else{
						alert("회원탈퇴가 취소되었습니다.");
						return false;
					}
					
				}	return true;
			});
			
				
			
		})
		
	</script>
	
	<style>
	
	.div-0{
	height: 65px;
	}
	</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class= "body-area2">
		<section id="container">
			<div class="login_contents">
			<form action="${contextPath}/member/memberDelete.do" method="post" onSubmit="return check()">
				<div class="form-group has-feedback">
					<h3 class="login_id">
					<label class="control-label" for="mb_id">아이디</label>
					</h3>
						<input class="form-control ps_box" type="text" id="mb_id" name="mb_id" value="${member.mb_id}" readonly="readonly"/>
					
				</div>
				<div class="form-group has-feedback">
					<h3 class="login_pw">
					<label class="control-label" for="mb_pw">패스워드</label>
					</h3>
					<input class="form-control ps_box" type="password" id="mb_pw" name="mb_pw" />
				</div>
				<div class="form-group has-feedback">
					<h3 class=idpw-find">
					<label class="control-label" for="mb_name">성명</label>
					</h3>
					<input class="form-control ps_box" type="text" id="mb_name" name="mb_name" value="${member.mb_name}" readonly="readonly"/>
				</div>
				<div class="login_contents-button">
					<button class="button3" type="submit" id="submit">회원탈퇴</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			</div>
			<!-- 
			<div>
				
				
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
				
			</div>
			 -->
		</section>
		</div>
		<div class="div-0"></div>
</body>
</html>