<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%

  request.setCharacterEncoding("UTF-8");
  String pd_id = request.getParameter("pd_id");
  //System.out.println("pd_id :"+ pd_id);
  
%>

<%
String contextPath = request.getContextPath();
%>

	
<!DOCTYPE html>

<meta charset="utf-8">
<head>
<script type="text/javascript">
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
	  }
  	
  	cnt++;
  }
  
  
  function fn_add_new_goods(obj){
		 fileName = $('#f_main_image').val();
		 console
		 if(fileName != null && fileName != undefined){
			 obj.submit();
		 }else{
			 alert("메인 이미지는 반드시 첨부해야 합니다.");
			 return;
		 }
		 
	}
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">

<style>
.add_product_table {margin-left:auto; margin-right:auto;}
.add_product_table th{width:200px; height:35px; font-size:18px; background-color:#22262a; color:white;}
.add_product_table input {height:30px; width:380px; border:0px; margin-left:7px; font-size:17px;}
.add_product_table td {width:400px;}
.add_product_table select  {width:400px; height:35px; border:0px; font-size:16px;}
select option {font-weight:bold; height:50px;}
#pd_Limitdate {font-size:17px; font-weight:bold; width:400px; text-align:center;}
</style>
</head>

<BODY>
<div style="width:700px;">
<form action="${contextPath}/admin/product/addNewPd.do?pd_id=<%=pd_id%>" method="post"  enctype="multipart/form-data">
		<div class = "contents_title" style="background-color:#22262a; color:white; margin-top:0px; height:100px;  line-height: 100px;">
			[새상품 등록창]
		</div>
<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_sub_container">
		<ul class="tabs">
			<li style="margin-left:30px; font-size:25px; font-weight:bold;">상품등록</li>
		</ul>
		<div class="tab_sub_container2">
	 	<div class="tab_sub_container3">
			<table class="add_product_table" >
				<tr>
					<th>상품아이디</th>
					<td><input name="pd_id" type="text" size="40" /></td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td><input name="pd_name" type="text" size="40" /></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input name="pd_code" type="text" size="40" /></td>
				</tr>
				<tr>
					<th>상품원가</th>
					<td><input name="pd_price" type="text" size="40" /></td>
				</tr>
				
				<tr>
					<th>상품입고량</th>
					<td><input name="pd_inCount" type="text" size="40" /></td>
				</tr>
				
				<tr >
					<th>상품그룹1</th>
					<td><select name="pd_group1">
							<option value="man" selected>남성
							<option value="woman">여성
						</select>
					</td>
				</tr>
				
				
				<tr >
					<th>상품그룹2</th>
					<td><select name="pd_group2">
							<option value="PRIMIUM" selected>프리미엄
							<option value="가성비">가성비
						</select>
					</td>
				</tr>
				
				<tr >
					<th>상품현황</th>
					<td><select name="pd_status">
							<option value="bestseller" selected>베스트셀러
							<option value="newperfume">신상
						</select>
					</td>
				</tr>
				
				
				
				<tr>
					<th>상품 유통기한</th>
					<td><input id = "pd_Limitdate" name="pd_limitDate" type="date" size="40" /></td>
				</tr>
				<!-- 이벤트 설정을 위한 코드 추가 신우주 -->
				<tr>
					<th>이벤트 상품 설정</th>
					<td><input type="checkbox" id="chkbox" name="event" value=1></td>
			</tr>
			</table>	
				
			</div>
			<div class="tab_content" id="tab2">
				<p style="font-size:25px; margin-left: 35px; font-weight:bold; padding:10px 0 10px 0;">상품설명</p>
				<table style="margin-left:auto; margin-right:auto;">	
				 <tr>
					<td><textarea  rows="25" cols="75" name="pd_content"></textarea></td>
				</tr>
				</table>	
			</div>
			
			
	
			<div class="tab_content" style="margin-left:35px;">
				<h4 style="margin-top:5px; margin-bottom:5px; font-size:25px;">상품이미지</h4>
				<table style="margin-left:5px;">
					<tr>
						<td align="right">이미지파일 첨부</td>
			            
			            <td  align="left"> <input type="file"  name="main_image" value="파일 추가" onClick="fn_addFile()"/></td>
			            <td>
				            <div id="d_file">
				            </div>
			            </td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div>
	 <table>
	 <tr>
			  <td style="border:0px;">
				 <!-- <input  type="submit" value="상품 등록하기"> -->
				  <button class="button3"  style="margin-left:560px;" type="submit" onClick="fn_add_new_goods(this.form)">등록하기</button> 
			  </td>
			</tr>
	 </table>
	 </div>
</div>
</div>
</form>	 