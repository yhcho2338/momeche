<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 
 <script>
 function execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	        extraRoadAddr += data.bname;
	      }
	      // 건물명이 있고, 공동주택일 경우 추가한다.
	      if(data.buildingName !== '' && data.apartment === 'Y'){
	        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	      }
	      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	      if(extraRoadAddr !== ''){
	        extraRoadAddr = ' (' + extraRoadAddr + ')';
	      }
	      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	      if(fullRoadAddr !== ''){
	        fullRoadAddr += extraRoadAddr;
	      }

	      // 우편번호와 주소 정보를 해당 필드에 넣는다.
	      document.getElementById('join_zipcode').value = data.zonecode; //5자리 새우편번호 사용
	      document.getElementById('join_road_address').value = fullRoadAddr;
	      document.getElementById('join_jibun_address').value = data.jibunAddress;

	      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	      if(data.autoRoadAddress) {
	        //예상되는 도로명 주소에 조합형 주소를 추가한다.
	        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

	      } else if(data.autoJibunAddress) {
	          var expJibunAddr = data.autoJibunAddress;
	          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	      } else {
	          document.getElementById('guide').innerHTML = '';
	      }
	      
	     
	    }
	  }).open();
	}
 
	  function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var joinInfo=document.joinInfo;
		if(attribute=='mb_pw'){
			value=joinInfo.mb_pw.value;
			
			//alert("mb_pw:"+value);
			
		}else if(attribute=='email'){
			var email_1=joinInfo.email_1;
			
			value_email_1=email_1.value;
					
			value=value_email_1
			//alert(value);
			
		}else if(attribute=='tel'){
			var tel_1=joinInfo.tel_1;
			var tel_2=joinInfo.tel_2;
			var tel_3=joinInfo.tel_3;
			
			value_tel_1=tel_1.value;
			value_tel_2=tel_2.value;
			value_tel_3=tel_3.value;
			value=value_tel_1+","+value_tel_2+", "+value_tel_3;
			
		}else if(attribute=='address'){
			var zipcode=joinInfo.zipcode;
			var road_address=joinInfo.road_address;
			var jibun_address=joinInfo.jibun_address;
			var other_address=joinInfo.other_address;
			
			value_zipcode=zipcode.value;
			value_road_address=road_address.value;
			value_jibun_address=jibun_address.value;
			value_other_address=other_address.value;
			value=value_zipcode+","+value_road_address+","+value_jibun_address+","+value_other_address;
							
			
		
		}
		console.log(attribute);
	  
	  
	  
	  
	  
	  
	  
	  
	 
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute:attribute,
				value:value,
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("회원 정보를 수정했습니다.");
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


</script>
</head>

<body>

		        <!-- 사이드 바-->
        <div class="sidebar">
            <ul style="margin-top:15px;">
                <hr style="height: 5px; background-color:rgb(33,37,41); margin-top:30px;">
                <li style="font-size:50px; color:rgb(33,37,41); text-align: center; margin-top:35px;">Momeche</li>
                <hr style="height: 5px; background-color:rgb(33,37,41); margin-top:30px;">
                <li id="li_mypage"><a href="${contextPath}/mypage/myPageMain.do">MYPAGE</a></li>
                <hr style="margin-bottom:30px;">
                <li class = "side_bar-menu"><a href="#">회원정보</a></li>
                <li class = "side_bar-menu"><a href="${contextPath}/mypage/myOrderList.do?mb_id=${member.mb_id}">주문/배송조회</a></li>
                <li class = "side_bar-menu"><a href="#">환불/취소/교환</a></li>
                <li class = "side_bar-menu"><a href="${contextPath}/cart/myCartList.do">장바구니</a></li>
                <li class = "side_bar-menu"><a href="#">관심상품</a></li>
                <li class = "side_bar-menu"><a href="#">적립금</a></li>
                <li class = "side_bar-menu"><a href="#">회원등급정보</a></li>
                <li class = "side_bar-menu"><a href="#">1:1문의</a></li>
                <li class = "side_bar-menu"><a href="#">A/S</a></li>
                <li class = "side_bar-menu"><a href="#">내가 쓴 리뷰</a></li>
                <li class = "side_bar-menu"><a href="${contextPath}/member/memberDeleteView.do">회원 탈퇴</a></li>
            </ul>
            <hr>
            <p style="font-size:30px; font-weight: bold;"><i class="bi bi-telephone-fill"></i>1899-1234</p>
            월~금  AM:10:00 ~ 17:00
            <br>
            토,일 공휴일 휴무
        </div>

        <!-- 사이드 바 끝-->


	<div id = "container">

	
        <div class = "body-area1" style="height:1500px;">
            <div class = "body-area2">
                <div class = "contents_title">
                    회원정보 수정
                    <hr>
                </div>
                <form class="join_form" name="joinInfo">
                    <div class = "join_content">
                        <div class="row_group">
                            <div class = "join_row">
                                <h3 class="join_title">
                                    <label for = "join_id">아이디</label>
                                </h3>
                                <div class="CA">
                                <span class = "ps_box updateID">
                                    <input type="text" id ="_mb_id" name="mb_id" maxlength="12" value="${member.mb_id }" disabled>
                                </span>
                                
                            </div>
                            </div>

                            <div class = "join_row">
                                <h3 class = "join_title">
                                    <label for = "join_pw1">비밀번호</label>
                                </h3>
                                <div class ="box_button_pw">
                                <span class = "ps_box pw1">
                                    <input type="password" id = "join_pw1" name = "mb_pw" maxlength="12" value="${member.mb_pw }" >                  
                                </span>
                                
                                <button class = "button3" type="button" onClick="fn_modify_member_info('mb_pw')">수정하기</button>
                                </div>                                  
                            </div>

                            <div class = "join_row">
                                <div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_name">이름</label>
                                    </h3>
                                    <span class="ps_box name">
                                        <input type = "text" id = join_name name ="mb_name" maxlength="10" value="${member.mb_name }" disabled>
                                    </span>
                                </div>   
                                <div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_email">이메일</label>
                                    </h3>
                                    <div class = "box_buttion_email">
                                    <span class="ps_box email">
                                        <input type = "text" id = "join_email" name = "email_1" value="${member.email_1 }" >
                                    </span>
                                    
                                    <button class = "button3" type="button" onClick="fn_modify_member_info('email')">수정하기</button>
                                	</div>
                                </div>
                            </div>

 						<!-- 휴대전화 인증 구현 연습 -->
						
						<!-- 휴대전화 인증 구현 연습 -->
                        <div class = "join_row">
                            <div class = "join_row">
                                <h3 class ="join_title">
                                    <label for = "join_phonenumber">휴대전화</label>
                                </h3>
                                <div class = "CA">
                                    <span class="ps_box phonenumber">
                                        <input type="text" id="phonenumber1" name="tel_1" maxlength="3" value="${member.tel_1 }" />-
                                        <input type="text"id="phonenumber2" name="tel_2" maxlength="4" value="${member.tel_2 }" />-
                                        <input type="text" id="phonenumber3" name="tel_3" maxlength="4" value="${member.tel_3 }" />
                                    </span>
                                    
                                    <button class = "button3" type="button" onClick="fn_modify_member_info('tel')">수정하기</button>
                                    
                                    
                                </div>
                            </div>
                            
                        </div>
                        
                        <!-- 주소검섹 시작 -->
                        	<div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_zipcode">우편번호</label>
                                    </h3>
                                    <div class="CA">
                                    <span class="ps_box zipcode">
                                        <input type = "text" id = "join_zipcode" name = "zipcode" placeholder="우편번호"  value="${member.zipcode }">
                                    </span>
                                    <button type = "button" id="join_zipcode_search"class="button3" onClick="execDaumPostcode()" >우편번호검색</button>
                                    
                        			</div>
                        	</div>
                        	
                        	<div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_road_address">도로명 주소</label>
                                    </h3>
                                    
                                    <span class="ps_box road_address">
                                        <input type = "text" id = "join_road_address" name = "road_address" placeholder="도로명 주소"  value="${member.road_address }">
                                    </span>
                        	</div>
                        	
                        	<div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_jibun_address">지번 주소</label>
                                    </h3>
                                    
                                    <span class="ps_box jibun_address">
                                        <input type = "text" id = "join_jibun_address" name = "jibun_address" placeholder="지번 주소"  value="${member.jibun_address }">
                                    </span>
                        	</div>
                        	
                        	<div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_other_address">상세 주소</label>
                                    </h3>
                                    <div class="box_button_other_address">
                                    <span class="ps_box other_address">
                                        <input type = "text" id = "join_other_address" name = "other_address" placeholder="상세 주소" value="${member.other_address }">
                                    </span>
                                    
                                    <button class = "button3" type="button" onClick="fn_modify_member_info('address')">수정하기</button>
                                    </div>
                        	</div>
                        	
                        	<button type="button" onclick="location.href='${contextPath}/main/main.do';" class="button1">취소</button>
                        	
                       </div>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>	
</body>
</html>
