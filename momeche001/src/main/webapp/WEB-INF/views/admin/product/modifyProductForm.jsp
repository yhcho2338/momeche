<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="product"  value="${productMap.product}"  />
<c:set var="imageFileList"  value="${productMap.imageFileList}"  />

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  

<%

  request.setCharacterEncoding("UTF-8");
  String pd_id = request.getParameter("pd_id");
  //System.out.println("pd_id :"+ pd_id);
  
%>

<%
String contextPath = request.getContextPath();
%>

	
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<%-- 
<c:choose>
<c:when test='${not empty product.pd_status}'>
<script>
window.onload=function()
{
	init();
}

function init(){
	var frm_mod_goods=document.frm_mod_goods;
	var h_goods_status=frm_mod_goods.h_goods_status;
	var goods_status=h_goods_status.value;
	var select_goods_status=frm_mod_goods.goods_status;
	 select_goods_status.value=pd_status;
}
</script>
</c:when>
</c:choose>
--%>

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
 
  
  
  function fn_modify_goods(pd_id, attribute){
		//alert("수정 아작스 호출");
	var contextPath = "<%=contextPath %>"
	var url = contextPath + "/admin/product/modifyGoodsInfo.do";
	var frm_mod_goods=document.frm_mod_goods;
  	var value="";
     //alert(attribute);
  	if(attribute=='pd_name'){
  		value=frm_mod_goods.pd_name.value;
  		//console.log(value);
  	}else if(attribute=='pd_code'){
		value=frm_mod_goods.pd_code.value;
  	}else if(attribute=='pd_price'){
		value=frm_mod_goods.pd_price.value;   
	}else if(attribute=='pd_inCount'){
		value=frm_mod_goods.pd_inCount.value;
	}else if(attribute=='pd_level'){
		value=frm_mod_goods.pd_level.value;
	}else if(attribute=='pd_group1'){
		value=frm_mod_goods.pd_group1.value;
	}else if(attribute=='pd_group2'){
		value=frm_mod_goods.pd_group2.value;
	}else if(attribute=='pd_status'){
		value=frm_mod_goods.pd_status.value;
	}else if(attribute=='pd_limitDate'){
		value=frm_mod_goods.pd_limitDate.value;
	}else if(attribute=='pd_content'){
		value=frm_mod_goods.pd_content.value;
	}else if(attribute=='event'){
		value=frm_mod_goods.event.value;
	}	
  		

  	$.ajax({
  		url : url,
  		type : "post",
  		async : false, //false인 경우 동기식으로 처리한다.
  		
  		data : {
  			pd_id:pd_id,
  			attribute:attribute,
  			value:value
  		},
  		success : function(data, textStatus) {
  			if(data.trim()=='mod_success'){
  				alert("상품 정보를 수정했습니다.");
  			}else if(data.trim()=='failed'){
  				alert("다시 시도해 주세요.");	
  			}
  			
  		},
  		error : function(data, textStatus) {
  			alert("에러가 발생했습니다."+data);
  		},
  		complete : function(data, textStatus) {
  			//alert("작업을 완료 했습니다");
  			
  		}
  	}); //end ajax	
  }
  


    function readURL(input,preview) {
  	//  alert(preview);
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $('#'+preview).attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
    }  

    var cnt =1;
    function fn_addFile(){
  	  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' id='detail_image"+cnt+"'  onchange=readURL(this,'previewImage"+cnt+"') />");
  	  $("#d_file").append("<img  id='previewImage"+cnt+"'   width=200 height=200  />");
  	  $("#d_file").append("<input  type='button' value='추가'  onClick=addNewImageFile('detail_image"+cnt+"','${imageFileList[0].pd_id}','detail_image')  />");
  	  cnt++;
    }
    
    function modifyImageFile(fileId,pd_id,fileType){
      // alert(fileId);
  	  var form = $('#FILE_FORM')[0];
        var formData = new FormData(form);
        formData.append("fileName", $('#'+fileId)[0].files[0]);
        formData.append("pd_id", pd_id);
        //formData.append("image_id", image_id);
        formData.append("fileType", fileType);
        
        $.ajax({
          url: '${contextPath}/admin/product/modifyGoodsImageInfo.do',
          processData: false,
          contentType: false,
          data: formData,
          type: 'POST',
  	      success: function(result){
  	         alert("이미지를 수정했습니다!");
  	       }
        });
    }
    
    function addNewImageFile(fileId,pd_id, fileType){
  	   //  alert(fileId);
  		  var form = $('#FILE_FORM')[0];
  	      var formData = new FormData(form);
  	      formData.append("uploadFile", $('#'+fileId)[0].files[0]);
  	      formData.append("pd_id", pd_id);
  	      formData.append("fileType", fileType);
  	      
  	      $.ajax({
  	          url: '${contextPath}/admin/product/addNewGoodsImage.do',
  	                  processData: false,
  	                  contentType: false,
  	                  data: formData,
  	                  type: 'post',
  	                  success: function(result){
  	                      alert("이미지를 수정했습니다!");
  	                  }
  	          });
  	  }
    
    function deleteImageFile(pd_id,imageFileName,trId){
  	var tr = document.getElementById(trId);

        	$.ajax({
      		type : "post",
      		async : true, //false인 경우 동기식으로 처리한다.
      		url : "${contextPath}/admin/product/removeGoodsImage.do",
      		data: {pd_id:pd_id,
       	         //image_id:image_id,
       	         imageFileName:imageFileName},
      		success : function(data, textStatus) {
      			alert("이미지를 삭제했습니다!!");
                  tr.style.display = 'none';
      		},
      		error : function(data, textStatus) {
      			alert("에러가 발생했습니다."+textStatus);
      		},
      		complete : function(data, textStatus) {
      			//alert("작업을완료 했습니다");
      			
      		}
      	}); //end ajax	
    }
 

  
  
  
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
<style>
.mod_product_table {margin-left:auto; margin-right:auto;}
.mod_product_table th{width:200px; height:35px; font-size:18px; background-color:#22262a; color:white;}
.mod_product_table input {height:30px; width:100px; border:0px; margin-left:7px; font-size:17px; font-weight:bold; background-color:white;}
.mod_product_table td {width:400px;}
.mod_product_table select  {width:400px; height:35px; border:0px; font-size:16px;}
select option {font-weight:bold; height:50px;}
#pd_Limitdate {font-size:17px; font-weight:bold; width:400px; text-align:center;}
#mod_sub {width:120px;}
#input1 {width:400px;}
#modpd_content{width:100px; height:40px; border:0px; background-color:white; font-size:18px; font-weight:bold;}
#main_img{margin-left:250px; font-size:18px; border:0px; background-color:white; font-weight:bold;}
</style>
</head>

<body>
<form name="frm_mod_goods"  method=post >
	<div class = "contents_title" style="background-color:#22262a; color:white; margin-top:0px; height:100px;  line-height: 100px;">
		개별상품 수정창
	</div>
<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
		<ul class="tabs">
			<li><a href="#tab1">상품아이디</a></li>

		</ul>
		<div class="tab_container">
	 	<div class="tab_content" id="tab1">
		<table class="mod_product_table">
			<tr >
				<th>상품아이디</th>
				<td><input name="pd_id" id = "input1" type="text" size="20" value="${product.pd_id }" disabled /></td>
				<td id="mod_sub" style="background-color:darkgray"></td>
			</tr>
			
			<tr>
				<th >상품명</th>
				<td><input name="pd_name" type="text" id = "input1" size="20" value="${product.pd_name }"  /></td>
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_name');"/>  
				</td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><input name="pd_code" type="text" id = "input1" size="20" value="${product.pd_code }" /></td>
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_code');"/>  
				</td>
			</tr>
			<tr>
				<th >상품원가</th>
				<td><input name="pd_price" type="text" id = "input1" size="20" value="${product.pd_price }" /></td>
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_price');"/>  
				</td>
			</tr>
			
			<tr>
				<th>상품입고량</th>
				<td><input name="pd_inCount" type="text" id = "input1" size="20" value="${product.pd_inCount }" /></td>
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_inCount');"/>  
				</td>
			</tr>
			
			<tr >
				<th>상품그룹1</th>
				<td><select name="pd_group1" value="${product.pd_group1 }">
						<option value="man" selected>남성
						<option value="woman">여성
					</select>
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_group1');"/>  
				</td>	
			</tr>
			
			
			<tr >
				<th>상품그룹2</th>
				<td><select name="pd_group2" value="${product.pd_group2 }">
						<option value="PRIMIUM" selected>프리미엄
						<option value="가성비">가성비
					</select>
				</td>
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_group2');"/>  
				</td>
			</tr>
			
			<tr >
				<th>상품현황</th>
				<td><select name="pd_status" value="${product.pd_status }">
						<option value="bestseller" selected>베스트셀러
						<option value="newperfume">신상
					</select>
				</td>
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_status');"/>  
				</td>
			</tr>
			
			
			
			<tr>
				<th>상품 유통기한</th>
				<td><input name="pd_limitDate" id = "input1" type="date" size="40" value="${product.pd_limitDate }"/></td>
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_limitDate');"/>  
				</td>
			</tr>
			<!-- 20220217 이벤트 상품 수정 코드 삽입 신우주 -->
			<tr>
				<th>이벤트 설정</th>
				
				<c:choose>
					<c:when test="${product.event==1}">
						<td>
							<input name="eventTrue" id="input1" type="text" size="40" value="이벤트 설정 상품"/>
							취소<input name="event" id="input1" type="checkbox" size="40" value="0"/>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<input name="eventFalse" id="input1" type="text" size="40" value="일반 상품"/>
							등록<input name="event" id="input1" type="checkbox" size="40" value="1"/>
						</td>
					</c:otherwise>
				</c:choose>
				
				<td id="mod_sub">
				 <input type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','event');">
				</td>
			</tr>
		</table>	
				<!-- 20220217 이벤트 상품 수정 코드 삽입 신우주 끝-->
			</div>
			<div class="tab_content" id="tab2">
				<p style="font-size:25px; padding:10px;">상품설명</p>
				<table style="margin-left:auto; margin-right:auto;">	
				 <tr>
					<td ><br></td>
					<td><textarea rows="25" cols="70" name="pd_content" value="${product.pd_content }"></textarea></td>
					<td id="mod_sub">
				 		<input id = "modpd_content"type="submit" value="수정" onClick="fn_modify_goods('${product.pd_id }','pd_content');"/>  
					</td>
				</tr>
				</table>	
			</div>
			
			
	
			<div class="tab_content" id="tab7">
			<form id="FILE_FORM" method="post" enctype="multipart/form-data"  >
				<p style="padding:10px; font-size:25px;">상품이미지</p>
				<table style="margin-left:auto; margin-right:auto;">
					<%-- <tr>
						<td align="right">이미지파일 수정</td>
			            
			            <td  align="left"> <input type="file" id="main_image" name="main_image" value="파일 추가" onClick="fn_addFile()"/></td>
			            <td>
				            <div id="d_file">
				            </div>
			            </td>
					</tr> --%>
					
					<tr>
					<c:forEach var="item" items="${imageFileList }"  varStatus="itemNum">
			        <c:choose>
			            <c:when test="${item.fileType=='main_image' }">
			              <tr>
						    <td style="width:100px; text-align:center; font-weight:bold;">메인 이미지</td>
						    <td style="width:370px;">
							  <input type="file"  id="main_image"  name="main_image"  onchange="readURL(this,'preview${itemNum.count}');" />
						      <%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
							  <%-- <input type="hidden"  name="image_id" value="${item.image_id}"  /> --%>
							<br>
						</td>
						<td>
						  <img  id="preview${itemNum.count }"   width=200 height=200 src="${contextPath}/download.do?pd_id=${item.pd_id}&fileName=${item.fileName}" />
						</td>
					</tr>
					<tr>
					 <td colspan=3>
					   <input  id = "main_img"type="button" value="수정"  onClick="modifyImageFile('main_image','${item.pd_id}','${item.fileType}')"/>
					 </td>
					</tr>
			         </c:when>
			         </c:choose>
			         </c:forEach>
			         </tr>			
					
					
				</table>
			</form>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div>
	 <table>
	 <tr>
			  <td align=center>
				 <!-- <input  type="submit" value="상품 등록하기"> -->
				 <!-- <input type="submit" value="상품 등록하기"  onClick="fn_add_new_goods(this.form)"> -->
			  </td>
			</tr>
	 </table>
	 </div>
</div>
</form>	 
</body>
</html>