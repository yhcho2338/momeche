<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="product" value="${productMap.productVO}" />
<c:set var="imageList" value="${productMap.imageList }" />


<%
     //치환 변수 선언합니다.
      //pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("crcn" , "\n"); //Ajax로 변경 시 개행 문자 
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  

<%
  request.setCharacterEncoding("UTF-8");
  String cart_count = request.getParameter("cart_count"); // 상품 수량 변경을 위한 설정
  String goods_type = request.getParameter("goods_type");
  
%> 
 
<!DOCTYPE html>
<html>

     <head>
     <!--20220217 카트 js 설정을 위해 삽입 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/cartCss.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <!--20220217 카트 js 설정을 위해 삽입 -->
     
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Momeche</title>
        <!-- Favicon-->
        <link rel="icon" type="resources/image/x-icon" href="assets/favicon.ico" />


        
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        <script src="resources/js/scripts.js"></script>
        
       
       
<style type="text/css">
.layer {
	display: none;
}
/* css초기화 끝 */
.option_section {
	float: left;
	color: #777;
	font-weight: 400;
}
/* 상품문의 */
.board_list th {
	padding: 14px 0;
	background: url(/css/images/ico_board_th_bar.gif) no-repeat 0 center
		#f5f5f5;
	font-size: 14px;
	color: #666;
	font-weight: 400;
	text-align: center;
}
.board_list {
	width: 60%;
	margin-top: 0px;
	background: #fff;
	font-size: 15px;
	line-height: 18px;
}
.board_list2 {
	width: 60%;
	margin-top: 0px;
	background: #fff;
	font-size: 15px;
	line-height: 18px;
}
.board_list2 .tit {
	background: #fff;
	font-size: 15px;
}
.board_list2 .tit td {
	position: relative;
	padding: 20px 0;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
}
.td {
	position: relative;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
	margin-left: 100px;
}
.align_left {
	text-align: left !important;
}
.board_list2 td.align_left {
	padding: 16px 110px;
}
.board_list td {
	padding: 16px 0;
	text-align: center;
	border-bottom: 1px solid #e0e0e0;
	font-size: 14px;
	color: #444;
	vertical-align: top;
}
p.a {
	cursor: pointer;
}
/* 리뷰리스트 */
::selection {
	background: #888;
	/* color: #fff; */
	text-shadow: none;
}
.xans-product-additional div.board {
	margin: 0 auto;
	padding: 27px 0 40px;
	max-width: 1220px;
	color: #353535;
	line-height: 18px;
}
.ec-base-table.typeList table {
	border-top: 1px solid #e5e5e5;
}
.ec-base-table table {
	position: relative;
	margin: 10px 0 0;
	border: 1px solid #e5e5e5;
	border-top: 0;
	border-left: 0;
	border-right: 0;
	/* color: #fff; */
	line-height: 1.5;
}
.ec-base-table table:before {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	content: "";
	width: 100%;
	height: 1px;
	background: #e5e5e5;
}
.displaynone {
	display: none !important;
}
.ec-base-table thead th {
	padding: 12px 0;
	border-bottom: 1px solid #e5e5e5;
	color: #353535;
	vertical-align: middle;
	font-size: 12px;
	font-weight: 500;
	background: #f9f9f9;
}
.xans-product-additional div.board {
	margin: 0 auto;
	padding: 27px 0 40px;
	max-width: 1220px;
	color: #353535;
	line-height: 18px;
}
.ec-base-table th:first-child {
	border-left: 0;
}
th {
	text-align: center;
}
.td1 {
	text-align: center;
	color: #777;
	padding: 12px 0;
}
.td2 {
	color: #777;
	padding: 12px 0;
}
.desc {
	padding: 0 0 20px;
	color: #777;
	font-size: 12px;
	text-align: center;
}
.d {
	width: 100%;
	heiht: 100%;
}
body {
	/*  font-family: Verdana, Arial; */
	font-family: 'Open Sans', sans-serif;
}
a {
	text-decoration: none;
	color: #666;
}
h1 {
	text-align: center;
	padding: 50px 0;
	font-weight: normal;
	font-size: 2em;
	letter-spacing: 10px;
}
.total_price {
    color: #666;
    font-size: 14px;
     padding: 20px 0 8px; 
    text-align: right;
    box-sizing: border-box;
}
.total_cartAdd {
    color: #666;
    font-size: 14px;
    box-sizing: border-box;
}
.totals-value {
    font-size: 30px;
    color: #333;
    font-style: normal;
    font-weight: bold;
    padding-left: 12px;
    text-align: right;
}

</style>
       
       
<!-- 20220211 신우주  상품설명 css 시작-->
<link rel="stylesheet" type="text/css" href="resources/css/test.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
<link rel="stylesheet" type="text/css" href="resources/css/slick2.css">

<!-- 보더에서 따온 css -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style type="text/css">
.goodsImg { float:left; width:500px;  border:1px solid #eee; }
	.goodsImg img { width:350x; height:auto; border:1px solid #eee;}
		
	.goodsInfo { float:right; width:500px; height:640px; font-size:15px; margin:0 auto;}
	.goodsInfo p { margin:0 0 0 0; }
	.goodsInfo p span { display:inline-block; width:300px; margin-right:30px; text } 

	.product {width:1130px; height: 700px; margin:0 auto; margin-top:65px; }
	.option {width:500px;}

	.goodsInfo p.cartStock input { font-size:15px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
	.goodsInfo p.cartStock button { font-size:20px; border:none; background:none; } 
	.goodsInfo div.cart_buy {  width:400px; padding:5px; margin-right:100px; float:right; }
	.goodsInfo div.cart_buy div.cart{  width:140px; margin:0; float:left; }
	.goodsInfo div.cart_buy div.buy{   width:140px; margin:0; float:right; }
	.goodsInfo div.cart_buy p.addToCart { text-align:right; margin:0; }
	.goodsInfo div.cart_buy p.addToCart button { font-size:22px; width:190px; padding:5px; margin:0;}
	.goodsInfo div.cart_buy p.addbuy { text-align:left; margin:0; }
	.goodsInfo div.cart_buy p.addbuy button { font-size:22px; width:190px; padding:5px; margin:0;}
	
	.gdsDes { font-size:18px; clear:both; padding-top:30px; }
	.addcart_btn{width:190px;  float:right;}
	.addbuy_btn{width:190px;  float:right;}

div.prodinfo{ width:1230px; height:100px;}
	div.prodinfo div.prodnav{width:1230px; height:50px;  float:left;}
	div.prodinfo div.prodnav div.prodnav-info{width:190px;  float:right; margin-top:60px;}
	div.prodinfo div.prodnav div.prodnav-review{width:190px;  float:right;}
	div.prodinfo div.prodnav div.prodnav-ask{width:190px;  float:right;}
	div.prodinfo div.prodnav div.prodnav-order{width:190px;  float:right;}
	div.prodinfo div.prodnav div.prodnav-refund{width:190px;  float:right;}
		
		
		
	div.prodinfo div.prodnav div.prodnav-info p.prodnav-info-btn{  width:190px;  float:right;}
	div.prodinfo div.prodnav div.prodnav-review p.prodnav-review-btn{width:190px;  float:right;}
	div.prodinfo div.prodnav div.prodnav-ask p.prodnav-ask-btn{width:190px;  float:right;}
	div.prodinfo div.prodnav div.prodnav-order p.prodnav-order-btn{width:190px;  float:right;}
	div.prodinfo div.prodnav div.prodnav-refund p.prodnav-refund-btn{width:190px;  float:right;}
	button.buy_btn{width:190px; height:43px;}
	div.prodinfo div.prodnav-bar{width:265px;  float:right;}
	div.nav-item dropdown{list-style-type: none; }
	
	
		.table-wrapper {
	    width: 1200px;
	    margin: 30px auto;
	    background: #fff;
	    padding: 20px;	
	    box-shadow: 0 1px 1px rgba(0,0,0,.05);
	}
	.table-title {
	    padding-bottom: 10px;
	    margin: 0 0 10px;
	}
	.table-title h2 {
	    margin: 6px 0 0;
	    font-size: 22px;
	}
	.table-title .add-new {
	    float: right;
	    height: 30px;
	    font-weight: bold;
	    font-size: 12px;
	    text-shadow: none;
	    min-width: 100px;
	    border-radius: 50px;
	    line-height: 13px;
	}
	.table-title .add-new i {
	    margin-right: 4px;
	}
	table.table {
	    table-layout: fixed;
	}
	table.table tr th, table.table tr td {
	    border-color: #e9e9e9;
	}
	table.table th i {
	    font-size: 13px;
	    margin: 0 5px;
	    cursor: pointer;
	}
	table.table th:last-child {
	    width: 100px;
	}
	table.table td a {
	    cursor: pointer;
	    display: inline-block;
	    margin: 0 5px;
	    min-width: 24px;
	}    
	table.table td a.add {
	    color: #27C46B;
	}
	table.table td a.edit {
	    color: #FFC107;
	}
	table.table td a.delete {
	    color: #E34724;
	}
	table.table td i {
	    font-size: 19px;
	}
	table.table td a.add i {
	    font-size: 24px;
	    margin-right: -1px;
	    position: relative;
	    top: 3px;
	}    
	table.table .form-control {
	    height: 32px;
	    line-height: 32px;
	    box-shadow: none;
	    border-radius: 2px;
	}
	table.table .form-control.error {
	    border-color: #f50000;
	}
	table.table td .add {
	    display: none;
	}
</style>     

  
<!-- 보더에서 필요한 스크립트 -->
<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	var actions = $("table td:last-child").html();
	// Append table with add row form on add new button click
    $(".add-new").click(function(){
		$(this).attr("disabled", "disabled");
		var index = $("table tbody tr:last-child").index();
        var row = '<tr>' +
            '<td><input type="text" class="form-control" name="name" id="name"></td>' +
            '<td><input type="text" class="form-control" name="department" id="department"></td>' +
            '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
			'<td>' + actions + '</td>' +
        '</tr>';
    	$("table").append(row);		
		$("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
        $('[data-toggle="tooltip"]').tooltip();
    });
	// Add row on add button click
	$(document).on("click", ".add", function(){
		var empty = false;
		var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
			if(!$(this).val()){
				$(this).addClass("error");
				empty = true;
			} else{
                $(this).removeClass("error");
            }
		});
		$(this).parents("tr").find(".error").first().focus();
		if(!empty){
			input.each(function(){
				$(this).parent("td").html($(this).val());
			});			
			$(this).parents("tr").find(".add, .edit").toggle();
			$(".add-new").removeAttr("disabled");
		}		
    });
	// Edit row on edit button click
	$(document).on("click", ".edit", function(){		
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
			$(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
		});		
		$(this).parents("tr").find(".add, .edit").toggle();
		$(".add-new").attr("disabled", "disabled");
    });
	// Delete row on delete button click
	$(document).on("click", ".delete", function(){
        $(this).parents("tr").remove();
		$(".add-new").removeAttr("disabled");
    });
});

$(document).ready(function(){
    $('.slider').bxSlider();
  });
 



//20220211 신우주 텝넘기는거
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});


</script>

            
          <script type="text/javascript">
          //var cart_count=document.getElementById("cart_count");
          //var cart_count = $(".cart_count").val();
	function add_cart(pd_id, cart_count) {
		
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/cart/addProductInCart.do",
			data : {
				pd_id:pd_id,
				cart_count:cart_count
				
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					alert("선택한 상품을 장바구니에 담았습니다.");	
					imagePopup('open', '.layer01');	
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 상품입니다.");	
				}
				
			},
			error : function(data, textStatus, request, status, error) {
				//alert("에러가 발생했습니다."+data);
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	}
    </script>  
        
        <!-- 20220126 상품 수량 조절 -->
  	<script type="text/javascript">
     function fn_cart_count(){
    	 var addr = '${contextPath}/goods/productDetail.do?pd_id=?/';
		 var txt = document.getElementById("cart_count").value;
		 $('#cart_count_btn').click(function(){
			 window.location.replace('${contextPath}/goods/productDetail.do?pd_id='+${product.pd_id} + '&cart_count='+txt);	 
		 });
		 
     }
     </script>  
  <!-- 20220126 상품 수량 조절  끝-->
        
        
    </head>
	
	<body>
	
	


<input type="hidden" id="IDX" name="IDX" value="${list.GOODS_NO}">

	<br>
	
	<div style="width:100%; position:relative; left:calc(50% - 600px); height:600px; display:inline">
		
		<div style="float:left;">
			<table>
				<tr>
					<td>
					<div style="width:450px; height:470px;">
						<img src="${contextPath}/thumbnails.do?pd_id=${product.pd_id}&fileName=${product.pd_fileName}" 
						style="width:100%; height:100%;"/>
					</div>
					</td>
						
						<!--width="400"
						height="400"-->
				</tr>
			</table>
		</div>

		<div style="float:left; margin-left:30px; width:682;">
			<table>

				<tr>
					<td id="goodsName" style="border:0px;"><font
						style="box-sizing: border-box; font-size:26px; position: relative; font-weight:bolder;">${product.pd_name }</font></td>
				</tr>

				<tr>
					<td id="price" style="font-weight: bold; font-Size: 26px; line-height: 42px; border:0px;">
						<fmt:formatNumber pattern="###,###,###" value="${product.pd_price }"/>원
						<hr style=" height:3px;  width:700px; background:black">
					</td>
				</tr>
				
			</table>

			<table style = "border-collapse: separate; border-spacing: 0 10px;">
				<tr class="option_section">
					<td width="352px"><font size="6">배송비</font></td>
					<td><font size="3">선불3,000원(50,000원 이상 무료배송)</font></td>
				</tr>
			</table>

			<table>
				<tr class="option_section">
					<td width="537px"><font size="3">배송종류</font></td>
					<td><font size="3">&nbsp;국내배송</font></td>
				</tr>
			</table>

			<br>
			<br>

			<div id="item_option">
				<table style = "border-collapse: separate; border-spacing: 0 20px;">
					<tr>
						<td><select name="ColorList" id="ColorList" class='total_cartAdd'
							style="width: 600px; height: 30px;">
								<option value="">==(필수)옵션: 색상 선택 ==</option>
								<c:forEach var="ColorList" items="${Color}" varStatus="index">
									<option value="${ColorList}">${ColorList}</option>
								</c:forEach>
						</select></td>
						

					</tr>

					<tr>
						<td><select name="SizeList" id="SizeList" class='total_cartAdd'
							style="width: 600px; height: 30px;">
								<option value="">==(필수)옵션: 사이즈 선택 ==</option>
								<c:forEach var="SizeList" items="${Size}" varStatus="index">
									<option value="${SizeList}">${SizeList}</option>
								</c:forEach>
						</select></td>
					
					</tr>
					
					
					
				</table>
			</div>
			<!-- rngusrngus -->
			<!--  
			<div class="subdiv">
                        <div class="basketprice"><input type="text" name="p_price" id="p_price3" class="p_price" value="${product.pd_price}"><fmt:formatNumber pattern="###,###,###" value="${product.pd_price}"/> 원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(1);" style="width:65px;">
                                <span onclick="javascript:basket.changePNum(1);"><i class="w3-xlarge w3-text-black fa fa-arrow-left down"></i></span>&nbsp;&nbsp;&nbsp;
                                <span onclick="javascript:basket.changePNum(1);"><i class="w3-xlarge w3-text-black fa fa-arrow-right up"></i></span>
                            </div>
                        </div>
                        <div class="sum">${product.pd_price}원</div>
                    </div>
                    <button class = "button4" type="submit" id="cart_count_btn" value="변경">변경</button>
                   -->
			<form action="javascript:fn_cart_count()" method="get" style="">
                                <input  style="height:25px;"type="number" id="cart_count" name="cart_count" value="<%=cart_count%>" id="cart_count" placeholder="수량 입력">
                                <input type="hidden" value="추가" onClick="javascript:this.form.amount.value++;">
                                <input type="hidden" value="감소" onClick="javascript:this.form.amount.value--;">
                                <button class = "button4" type="submit" id="cart_count_btn" value="변경">변경</button>
                                <hr style="margin-top:10px; height:3px; background:black">
                                </form>

			<form id="frm" name="frm" method="post">

				<div>
					<table style="border:1px;" id="dynamicTable">
						<thead>
						</thead>

						<tbody id="dynamicTbody">

						</tbody>
						
					</table>
				</div>

			</form>
			
			<div class="totals-item totals-item-total" style="float:left; margin-top:10px; margin-bottom:10px; margin-left:450px;">
	      		<label class="total_price" style="font-size:25px; font-weight:bold">총 상품금액</label>&nbsp;&nbsp;
	     		 <div class="total_price" style="float:right; font-size:25px; font-weight:bold">
	     		 	<fmt:formatNumber pattern="###,###,###" value="${product.pd_price}"/>원
	     		 	</div>
	     		 	
	      		<div class="totals-value" id="cart-total" style="float:right;"></div>
	   	    </div>
			
			<div style="margin-top:50px;">
				<button style="width: 124px; height: 58px;"
					class="button1" id="insertLike" onclick="#">
					<font size="5px">♥</font>
				</button>
				<button style="width: 270px; height: 58px;"
					class="button0"><a href="javascript:add_cart('${product.pd_id}','<%=cart_count%>')" class="button0">장바구니</a></button>
				<button style="width: 270px; height: 58px; color:white;"
					class="button1"><a href="${contextPath}/order/addOrder.do?pd_id=${product.pd_id}&pd_price=${product.pd_price}" class="button1">주문하기</a></button>
			</div>
			<br>

			<!-- <button id="update" onclick="fn_update()">수정하기</button> -->
		
		</div>
	</div>
	
	</div>
	
	
	


	<div style="clear: both;"></div>

	<br><br><br><br><br>
	
<!-- 20220210 신우주 상품 상세 페이지 수정 시작 -->
<hr style="color:#000000; size: thin solid #000000;">
               
                <div class="prodinfo">
                	<div class="prodnav">
                	<!-- 상품 상세 정보에 관한 네비게이션 -->
        				<ul class="nav nav-tabs" style="width:100%; margin:0 auto;">
  
						  <li class="nav-item">
						    <a class="nav-link active" data-bs-toggle="tab" href="#profile">상품 상세 설명</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" data-bs-toggle="tab" href="#home">상품평</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" data-bs-toggle="tab" href="#question">상품 문의</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" data-bs-toggle="tab" href="#post">배송 안내</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" data-bs-toggle="tab" href="#refund">교환 환불</a>
						  </li>
						</ul>
						<div id="myTabContent" class="tab-content">
						  <div class="tab-pane fade active show" id="profile">
						    <p>상품 상세 설명 페이지입니다.</p>
						  </div>					  
						  <div class="tab-pane fade" id="home">
						    <div class="container-lg">
    	<!-- 게시판 -->
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2><b>상품평</b></h2></div>
                    <div class="col-sm-8"><h7>상품에 대해서 궁금하신 경우 글을 남겨주세요</h7>
                    	<ul>
                    		<li>60 일 내 작성 가능합니다.</li>
                    		<li>상품을 구매한 사람만 작성 가능합니다.</li>
                    	</ul>
                    </div>
                    
                    <div class="col-sm-4" style="padding-top:40px;">
                        <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i>글쓰기</button>
                    </div>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>작성자</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>수정/삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>000</td>
                        <td>제목이 들어갑니다.</td>
                        <td>21.11.22</td>
                        <td>
                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                    <tr>
                       <td>000</td>
                        <td>제목이 들어갑니다.</td>
                        <td>21.11.22</td>
                        <td>
                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>000</td>
                        <td>제목이 들어갑니다.</td>
                        <td>21.11.22</td>
                        <td>
                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>      
                </tbody>
            </table>
        </div>
        <!-- /게시판 -->
    </div>
						  </div>
						  <div class="tab-pane fade" id="question">
						   <!-- 게시판 -->
					        <div class="table-wrapper">
					            <div class="table-title">
					                <div class="row">
					                    <div class="col-sm-8"><h2><b>상품 문의</b></h2></div>
					                    <div class="col-sm-8"><h7>상품에 대해서 궁금하신 경우 글을 남겨주세요</h7>
					                    	<ul>
					                    		<li>60 일 내 작성 가능합니다.</li>
					                    		<li>상품을 구매한 사람만 작성 가능합니다.</li>
					                    	</ul>
					                    </div>
					                    
					                    <div class="col-sm-4" style="padding-top:40px;">
					                        <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i>글쓰기</button>
					                    </div>
					                </div>
					            </div>
					            <table class="table table-bordered">
					                <thead>
					                    <tr>
					                        <th>작성자</th>
					                        <th>제목</th>
					                        <th>날짜</th>
					                        <th>수정/삭제</th>
					                    </tr>
					                </thead>
					                <tbody>
					                    <tr>
					                        <td>000</td>
					                        <td>제목이 들어갑니다.</td>
					                        <td>21.11.22</td>
					                        <td>
					                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
					                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
					                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
					                        </td>
					                    </tr>
					                    <tr>
					                       <td>000</td>
					                        <td>제목이 들어갑니다.</td>
					                        <td>21.11.22</td>
					                        <td>
					                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
					                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
					                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
					                        </td>
					                    </tr>
					                    <tr>
					                        <td>000</td>
					                        <td>제목이 들어갑니다.</td>
					                        <td>21.11.22</td>
					                        <td>
					                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
					                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
					                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
					                        </td>
					                    </tr>      
					                </tbody>
					            </table>
					        </div>
					        <!-- /게시판 -->
						  </div>
						  <div class="tab-pane fade" id="post">
						    <p>배송 안내입니다. 배송 안내입니다. 배송 안내입니다. 배송 안내입니다. 배송 안내입니다.</p>
						  </div>
						  <div class="tab-pane fade" id="refund">
						    <p>교환 환불 안내입니다. 교환 환불 안내입니다. 교환 환불 안내입니다. 교환 환불 안내입니다.</p>
						  </div>
						</div>
						</div>
					</div>		
		<!-- 20220210 신우주 상품 상세 페이지 수정 끝 -->

</body>
<script type="text/javascript">
function fnMove(seq){
    var offset = $('#f' + seq).offset();
    $('html').animate({scrollTop : offset.top}, 400);
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}

</script>
</html>