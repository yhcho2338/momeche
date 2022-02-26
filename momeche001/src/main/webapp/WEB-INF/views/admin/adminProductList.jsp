<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  

<%
  request.setCharacterEncoding("UTF-8");
%> 

<%
String contextPath = request.getContextPath();
%>



<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상품 관리 테이블</title>
        
        
 <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			
			var contextPath = "<%=contextPath %>"
			var url = contextPath + "/admin/product/removeProduct.do";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    console.log(valueArr);
		    if (valueArr.length == 0){
		    	alert("선택된 상품이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(Jdata){
	                	
	                    if(Jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("${contextPath}/admin/product/adminProductMain.do")
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
	</script>
	<style>
		.admin-product_list {border:3px solid black;}
	.admin-product_list th {background-color:#22262a; color:white; height:50px;}
	.admin-product_list td{height:35px; width:200px; border:2px solid gray;}
	</style>
			   

        

</head>

<body>
<input type="checkbox" id="menuicon">
        <ul>
            <li>
                <label for="menuicon">
                   <span></span><span></span><span></span>
                </label>
            </li>
        </ul>
        <!-- 사이드 바-->
        <div class="sidebar">
            <ul style="margin-top:15px;">
                <hr style="height: 5px; background-color:rgb(33,37,41); margin-top:30px;">
                <li style="font-size:50px; color:rgb(33,37,41); text-align: center; margin-top:35px;">Momeche</li>
                <hr style="height: 5px; background-color:rgb(33,37,41); margin-top:30px;">
                <li id="li_mypage"><a href="${contextPath}/admin/product/adminProductMain.do">ADMIN PAGE</a></li>
                <hr style="margin-bottom:30px;">
                <li class = "side_bar-menu"><a href="${contextPath}/admin/product/adminProductMain.do">상품관리</a></li>
                <li class = "side_bar-menu"><a href="${contextPath}/member/listMembers.do">회원관리</a></li>
                <li class = "side_bar-menu"><a href="#">홈페이지 관리</a></li>
                <li class = "side_bar-menu"><a href="#">게시판 관리</a></li>
            </ul>
            <hr>
            <p style="font-size:30px; font-weight: bold;"><i class="bi bi-telephone-fill"></i>1899-1234</p>
            월~금  AM:10:00 ~ 17:00
            <br>
            토,일 공휴일 휴무
        </div>

 <div class = "body-area1"  style="width:1800px;>
 <div class = "body-area2">


  <div class = "contents_title">
  		상품관리테이블
  </div>

<table class="admin-product_list" "border="1"  align="center"  width="70%" style="margin-left:auto; margin-right:auto;">
    <tr align="center">
    	
      <th><input id="allCheck" type="checkbox" name="allCheck"/></th>			
      <th>상품ID</th>
      <th>상품CODE</th>
      <th>상품명</th>
      <th>상품가격</th>
      <th>입고</th>
      <th>재고</th>
      <th>상품그룹1</th>
      <th>상품그룹2</th>
      <th>상품현황</th>
      <th>상품입고일</th>
      <th>수정</th>
      <th>삭제</th>
      
   </tr>
   
 <c:forEach var="AD_Product" items="${adminProductList}" >     
   <tr align="center">
   	  <td style="width:45px;"><input name="RowCheck" type="checkbox" value="${AD_Product.pd_id}"></td>		
      <td>${AD_Product.pd_id}</td>
      <td>${AD_Product.pd_code}</td>
      <td style="width:700px;">${AD_Product.pd_name}</td>
      <td>${AD_Product.pd_price}</td>
      <td>${AD_Product.pd_inCount}</td>
      <td>${AD_Product.pd_stock}</td>
      <td>${AD_Product.pd_group1}</td>
      <td>${AD_Product.pd_group2}</td>
      <td>${AD_Product.pd_status}</td>
      <td>${AD_Product.pd_inDate}</td>
      
      <td><button onclick="window.open('${contextPath}/admin/product/modifyProductForm.do?pd_id=${AD_Product.pd_id}','window_name','width=500,height=650,location=no,status=no,scrollbars=yes');">상품수정</button></td>
      <td><a href="${contextPath}/admin/product/removeProduct2.do?pd_id=${AD_Product.pd_id}"><b>삭제하기</b></a></td>
    </tr>
  </c:forEach>   
</table>


<div style="margin-left:1320px; margin-top:10px;">
<button class="button3" onclick="window.open('${contextPath}/admin/product/addNewPdForm.do','window_name','width=700px,height=650','location=no,status=no,scrollbars=yes');">
상품등록</button>
<!-- <button onclick="deleteValue(); return false;">선택삭제</button> -->
<!-- <input  type="submit" value="상품 등록하기"  onClick="fn_add_new_goods(this.form)"> -->

<input type="button" value=""  onclick="deleteValue();"> 
<button class="button3" onclick="deleteValue();"> 선택삭제 </button>

</div>
</div>

</body>
</html>