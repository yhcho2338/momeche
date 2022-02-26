<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="member" value="${member}" />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html lang="en">
    <head>
    
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>momeche 헤더</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/favicon.ico" />

	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
          
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet"/>
    <script src="${contextPath}/resources/js/main.js" defer></script>
    <script src="${contextPath}/resources/js/scripts.js"></script>
    
 
   <script src="http://code.jquery.com/jquery-latest.js"></script> 
   
   <script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}

	</script>


	<script>
	function fn_listOto(isLogOn,listOto,loginForm){
  	  	if(isLogOn != '' && isLogOn != 'false'){
  	    	location.href=listOto;
  	    
  	  	}else{
  	    	alert("로그인 해주세요!")
  	    	location.href=loginForm+'?action=/board/oto_articleForm.do';
  	  	}
  	  
  	}
	</script>
        
  
    </head>
    <body>
      
        
    <div class="advertisement-bar">
           <img src="${contextPath}/resources/image/ad.png">
    </div>
       
    <div class = "header_section_all"> 
        <div class = "header_section">
            <div class = "event_side">
            </div>
            <ul class = "login_side">
                <li>
		<c:choose>
          		<c:when test="${isLogOn == true && member != null}">
          		
            	<a href="${contextPath}/member/logout.do">LOGOUT </a>
            	</c:when>
		<c:otherwise>
	        	<a href="${contextPath}/member/loginForm.do">LOGIN</a>
	      	</c:otherwise>
	   	</c:choose>
	   					<i class="bi bi-bookmark-fill"></i>  
                        <span></span></li>

                <li><a href="${contextPath}/cart/myCartList.do">CART <i class="bi bi-cart-fill"></i></a></li>
                <li><a href="#">ORDER <i class="bi bi-credit-card-fill"></i></a></li>
                <li>
                
         		<c:choose>
          		<c:when test="${isLogOn == true && member.mb_level < 6 }">
            	<a href="${contextPath}/mypage/myPageMain.do?mb_id=${member.mb_id}">MYPAGE</a>
          		</c:when>
          		<c:when test="${isLogOn == true and member.mb_level > 5 }">
            	<a href="${contextPath}/admin/product/adminProductMain.do">ADMIN PAGE</a>
          		</c:when>
          		
          		<c:otherwise>
	        	<a href="${contextPath}/member/memberForm.do">JOIN</a>
	      		</c:otherwise>
          		
          	
	   			</c:choose>
	   			
	   			
				<i class="bi bi-door-open-fill"></i>
				<span></span></li>
                <li>
                  <div class = "main_search">
                    <%--  <select name = 'pd_search'>
                        <option value = '' selected>--상품선택--</option>
                        <option value = ''>이름순</option>
                        <option value = ''>가격순</option>
                    </select> --%>
                    
                    <form name="frmSearch" action="${contextPath}/goods/searchProduct.do">
                    <button class="btn_submit" type="submit" name="search"><i class="bi bi-search"></i></button>
                    <input name="searchWord" class="main_input" type="text" onKeyUp="keywordSearch()"> 
				
                	</form>
                	
                	
                  </div>
                </li>
            </ul>
        </div>
        
    </div>
    <nav class = "navbar">
        <div class = "navbar__logo">
            <a href="${contextPath}/main/main.do"><img src="${contextPath}/resources/image/momeche_logo.png"></a>
        </div>
        <ul class = "navbar__menu">
            <li><a href="${contextPath}/goods/productSort.do?pd_group1=man&sort=new_thing">남자향수</a>
                <ul>
                    <li><a href="${contextPath}/goods/productSort.do?pd_group1=man&sort=new_thing">ALL</a></li>
                    <li><a href="${contextPath}/goods/productSort.do?pd_group1=man&pd_group2=가성비&sort=new_thing">가성비</a></li>
                    <li><a href="${contextPath}/goods/productSort.do?pd_group1=man&pd_group2=PRIMIUM&sort=new_thing">프리미엄</a></li>
                </ul>
            </li>
            <li><a href="${contextPath}/goods/productSort.do?pd_group1=woman&sort=new_thing">여자향수</a>
                <ul id>
                    <li><a href="${contextPath}/goods/productSort.do?pd_group1=woman&sort=new_thing">ALL</a></li>
                    <li><a href="${contextPath}/goods/productSort.do?pd_group1=woman&pd_group2=가성비&sort=new_thing">가성비</a></li>
                    <li><a href="${contextPath}/goods/productSort.do?pd_group1=woman&pd_group2=PRIMIUM&sort=new_thing">프리미엄</a></li>
                </ul>
                </li>
        	<li><a href="${contextPath}/board/listArticles.do">추천</a></li>
            <li><a href="${contextPath}/admin/product/eventChk.do">이벤트</a></li>
            <li><a href="#">업체소개</a>
                <ul>
                    <li><a href="${contextPath}/company/About_Us.do">회사소개</a>
                    <li><a href="${contextPath}/info/listInfo.do">향수정보소개</a>
                </ul>
            </li>
            <li><a href="${contextPath}/board/listNotice.do">고객센터</a>
                <ul>
                    <li><a href="${contextPath}/board/listNotice.do">공지사항</a>
                    <li><a href="${contextPath}/board/question.do">자주 묻는 질문</a>
                    <li><a href="javascript:fn_listOto('${isLogOn}','${contextPath}/board/listOto.do','${contextPath}/member/loginForm.do')">
    						1:1문의</a></li>
                    <li><a href="#">A/S접수</a>
                </ul>
            </li>
        </ul>
    </nav>

    <a href="#" class="navbar__toogleBtn">
        <i class="bi bi-list" style="font-size:30px;"></i>
    </a>

   </body>
</html>