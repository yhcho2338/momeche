<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

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
        <title>Momeche 회원가입</title>
   
        
      	<script>
        function fn_overlapped(){
    		var _id=$("#_mb_id").val();
    		if(_id==''){
   	 		alert("ID를 입력하세요");
   	 		return;
    	}
    		$.ajax({
       		type:"post",
       		async:false,  
       		url:"${contextPath}/member/overlapped.do",
       		dataType:"text",
       		data: {mb_id:_id},
       		success:function (data,textStatus){
          		if(data=='false'){
       	    	alert("사용 가능한 ID입니다.");
       	    	$('#btnOverlapped').prop(true);
       	    	$('#_mb_id').prop(true);
       	    	$('#mb_id').val(_id);
          		}else{
        	  		alert("이미 존재하는 ID입니다.");
          		}
       		},
       		error:function(data,textStatus){
          		alert("에러가 발생했습니다.");ㅣ
       		},
       		complete:function(data,textStatus){
          		//alert("작업을 완료 했습니다");
       		}
    	});  //end ajax	 
	 }	
        
        
        
        // 필수 입력정보 확인   정승원
        function checkValue()
        {
        	var id = document.joinInfo.mb_id.value; //아이디
        	var pw = document.joinInfo.mb_pw.value; //비밀번호 
        	var pw_check = document.joinInfo.mb_pw_check.value; //비밀번호 확인
        	var name = document.joinInfo.mb_name.value; //이름 
        	var gender = document.joinInfo.mb_gender.value; // 성별
        	var Email = document.joinInfo.email_1.value; //이메일
        	var zipcode = document.joinInfo.zipcode.value; //우편번호
        	var other_address = document.joinInfo.other_address.value; //상세주소
        	
        	var RegExp = /^[a-zA-Z0-9]{4,12}$/;     //id와 pwassword 유효성 검사 정규식
        	var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 유효성 검사
        	var n_RegExp = /^[가-힣]{2,15}$/; // 이름 유효성 검사

        	
        	
        	
        	
        	
            
        	// ======== 아이디 유효성 검사 =========//
        	if(!id){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            
            if (!RegExp.test(id)) {
            	alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
            	return false;
            }
            	
         	// ======== 비밀번호 유효성 검사 =========//
            if(!pw){
                alert("비밀번호를 입력하세요.");
                return false;
              
            }
            
            if(!RegExp.test(pw)) {
            	alert("비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.");
            	return false;
            	
            }
           
            if(pw != pw_check){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
                
            }
            
         	// ======== 이름 유효성 검사 =========//
         	if(!name) {
         		alert("이름을 입력해주세요");
         		return false;
         	}
         	
         	if(!n_RegExp.test(name)){
         		alert("이름은 특수문자, 영어, 숫자는 사용할수 없습니다. 한글만 입력하여 주세요.");
         		return false;
         	}
         	// ======== 성별 유효성 검사 =========//
         	if(!gender) {
         		alert("성별을 선택해주세요");
         		return false;
         	}
         	
         	// ======== 이메일 유효성 검사 =========//
         	if(!Email){
         		alert("이메일을 입력해주세요.");
         		return false;
         	}
         	
         	if(!e_RegExp.test(Email)) {
         		alert("올바른 이메일 형식이 아닙니다.");
         		return false;
         	}
         
            
         	// ======== 휴대폰 인증 유효성 검사 =========//
            if(!document.joinInfo.join_mobileCA.value){
            	alert("본인인증을 진행해 주세요.")
            	return false;
            }
         	
         	// ======== 우편번호 유효성 검사 =========//
         	if(!zipcode) {
         		alert("우편번호를 입력해주세요.");
         		return false;
         	}
         	
         	// ======== 상세주소 유효성 검사 =========//
         	if(!other_address) {
         		alert("상세주소를 입력해주세요")
         		return false;
         	}
         	
         	}
        	// 필수 입력정보 확인 끝

        
        
        
        
        
        
        
        
        /*
        // 필수 입력정보 확인
        function checkValue()
        {
            if(!document.joinInfo.mb_id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.joinInfo.mb_pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.joinInfo.mb_pw.value != document.joinInfo.mb_pw_check.value){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            
            //인증 번호란에 값이 있어야 회원 가입 가능 유효성 검사
            if(!document.joinInfo.join_mobileCA.value){
            	alert("본인인증을 진행해 주세요.")
            	return false;
            }
        }
		*/
        
        
        
        function fn_loginsuccess() {
        	
        }
        
        </script>
        
        
        
        
           <!-- 도로명 주소 검색을 위한 다음 주소 코드 -->
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        
        <!-- 휴대전화 인증 서비스 스크립트 -->
        <script>
        var code2 = "";
        function fn_phonechk(){
          //alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");  
                	var text = document.getElementById('phonenumber1').value;
                  var text2 = document.getElementById('phonenumber2').value;
                  var text3 = document.getElementById('phonenumber3').value;
                  var phone = text.concat(text2,text3);
                	
                  
                  $.ajax({ 
                		type:"GET", 
                		url:"${contextPath}/member/phoneCheck.do?phone=" + phone, 
                		cache : false, 
                		success:function(data){ 
                			if(data == "error"){ 
                				alert("휴대폰 번호가 올바르지 않습니다.") 
                				consol(data)
                				$(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
                				$(".successPhoneChk").css("color","red"); 
                				$("#phone").attr("autofocus",true); 
                			}else{ 
                				$("#join_mobileCA").attr("disabled",false); 
                				$("#phoneChk2").css("display","inline-block"); 
                				$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); 
                				$(".successPhoneChk").css("color","green"); 
                				
                				$("#phonenumber1").attr("readonly",true);
                				$("#phonenumber2").attr("readonly",true);
                				$("#phonenumber3").attr("readonly",true);
                				
                				code2 = data; 
                				} 
                			} 
                	}); 
        }
        /*회원 가입 휴대전화 인증 */
      function fn_phoneChk2(){
        	if($("#join_mobileCA").val() == code2){ 
      		  $(".successPhoneChk").text("인증번호가 일치합니다."); 
      		  $(".successPhoneChk").css("color","green"); 
      		  $("#phoneDoubleChk").val("true"); 
      		  $("#join_mobileCA").attr("disabled",true); 
      		  }else{ 
      			  $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
      			  $(".successPhoneChk").css("color","red"); 
      			  $("#phoneDoubleChk").val("false"); $(this).attr("autofocus",true); 
      			  }
        }
      /*회원 가입 휴대전화 인증 */

       //휴대전화 유효성 검사
       function fn_submit(){
  var text = document.getElementById('phonenumber1').value;
  var text2 = document.getElementById('phonenumber2').value;
  var text3 = document.getElementById('phonenumber3').value;
  var phone = text.concat(text2,text3);
  var code2 = "";
  var regPhone = /^01([0|1|6|7|8|9])$/;
  var regPhone2 = /([0-9]{3,4})$/;
  var regPhone3 = /([0-9]{4})$/;
  if(regPhone.test(text) == true){
    if(regPhone2.test(text2) == true){
      if(regPhone3.test(text3) == true){
        alert('전화번호 입력이 완료 되었습니다. \n인증 번호를 전송합니다. \n인증 번호를 보낼 전화 번호는'+phone+'입니다.');
      }else{
        alert('휴대전화 끝 자리 입력이 올바르지 않습니다. \n다시 입력해 주세요.');
      }
    }else{
      alert('휴대전화 중간 자리 입력이 올바르지 않습니다. \n다시 입력해 주세요.');
    }
  }else{
     alert('휴대전화 첫 번째 자리 입력이 올바르지 않습니다. \n다시 입력해 주세요.');
  } 
 
}
  //휴대전화 유효성 검사
  
  /* 우편 번호 검색을 위한 함수 */
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
  /*우편 번호 검색을 위한 함수 끝*/
  
        </script>     
        
        
    </head>
    
    <body>	
    
      <div id = "container">
        <div class = "body-area1" style="height:1500px;">
            <div class = "body-area2">
                <div class = "contents_title">
                    회원가입
                    <hr>
                </div>
                <form class="join_form" name="joinInfo" action="${contextPath}/member/addMember.do" onsubmit="return checkValue()" method="POST">
                    <div class = "join_content">
                        <div class="row_group">
                            <div class = "join_row">
                                <h3 class="join_title">
                                    <label for = "join_id">아이디</label>
                                </h3>
                                <div class="CA">
                                <span class = "ps_box id">
                                    <input type="text" id ="_mb_id" name="mb_id" maxlength="12" placeholder="4~12자의 영문 대소문자와 숫자">
                                </span>
                                <button type="button" class="button3" id="btnOverlapped" onclick="fn_overlapped()">중복확인</button>
                            </div>
                            </div>

                            <div class = "join_row">
                                <h3 class = "join_title">
                                    <label for = "join_pw1">비밀번호</label>
                                </h3>
                                <span class = "ps_box pw1">
                                    <input type="password" id = "join_pw1" name = "mb_pw" maxlength="12" placeholder="4~12자의 영문 대소문자와 숫자">
                                </span>
                                

                                <h3 class = "join_title">
                                    <label for = "join_pw2">비밀번호 확인</label>
                                </h3>
                                <span class = "ps_box pw2">
                                    <input type="password" id = "join_pw2" name = "mb_pw_check" maxlength="12">
                                </span>
                            </div>

                            <div class = "join_row">
                                <div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_name">이름</label>
                                    </h3>
                                    <span class="ps_box name">
                                        <input type = "text" id = join_name name ="mb_name" maxlength="10">
                                    </span>
                                </div>

                                <div class = "join_row">
                                    <h3 class="join_title">
                                        <label for = "join_gender">성별</label>
                                    </h3>
                                    <span class = "ps_box gender">
                                        <select name = "mb_gender">
                                            <option value='' selected>--성별선택--</option>
                                            <option value ='man'>남자</option>
                                            <option value = 'woman'>여자</option>
                                        </select>
                                    </span>
                                </div>
                                <div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_email">이메일</label>
                                    </h3>
                                    <span class="ps_box email">
                                        <input type = "text" id = "join_email" name = "email_1" placeholder="id@test.com" >
                                    </span>
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
                                        <input type="text" id="phonenumber1" name="tel_1" maxlength="3" required/>-
                                        <input type="text"id="phonenumber2" name="tel_2" maxlength="4" required/>-
                                        <input type="text" id="phonenumber3" name="tel_3" maxlength="4" required/>
                                    </span>
                                    
                                    <!-- 휴대전화 유효성 검사를 위한 코드 삽입 연습 -->
                                    <!-- <input type="button" onClick = "fn_submit()" value="submit" class="button3"/> -->
                                    <!-- 휴대전화 유효성 검사를 위한 코드 삽입 연습 -->
                                    
                                    <!-- 휴대폰 인증을 위한 본인인증 스크립트 사용을 위해 onClick 삽입; 전화 번호 유효성 검사를 위한 펑션 삽입-->
                                    <button type = "button" id="phoneChk" onClick = " fn_submit(); fn_phonechk();" class="button3" >인증번호받기</button>
                                    
                                     
                                    <!-- 휴대폰 인증을 위한 본인인증 버튼 삽입 스크립트 사용을 위해 아이디 삽입-->
                                </div>
                            </div>
                            <div class = "join_row">
                                <h3 class="join_title">
                                    <label for="join_mobileCA">인증번호</label>
                                </h3>
                                	<div class="CA">
		                                <span class="ps_box mobileCA">
		                                    <input type ="text" id = "join_mobileCA" name = "join_mobileCA" maxlength="6" disabled required />
		                                </span>
		                                
		                                <button type = "button" id="join_mobileCA2"class="button3" onClick="fn_phoneChk2()" >본인인증</button><br/>
		                                <span class="point successPhoneChk">휴대전화 번호 입력 후 인증번호 보내기를 해주세요.</span> <br/>
		                                <input type="hidden" id="phoneDoubleChk"/>
                            		</div>
                            </div>
                        </div>
                        <!-- 주소 시작 신우주 -->
                        	<div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_zipcode">우편번호</label>
                                    </h3>
                                    <div class="CA">
                                    <span class="ps_box zipcode">
                                        <input type = "text" id = "join_zipcode" name = "zipcode" placeholder="우편번호" maxlength="40">
                                    </span>
                                    <button type = "button" id="join_zipcode_search"class="button3" onClick="execDaumPostcode()" >우편번호검색</button>
                        			</div>
                        	</div>
                        	
                        	<div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_road_address">도로명 주소</label>
                                    </h3>
                                    
                                    <span class="ps_box road_address">
                                        <input type = "text" id = "join_road_address" name = "road_address" placeholder="도로명 주소" maxlength="40">
                                    </span>
                        	</div>
                        	
                        	<div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_jibun_address">지번 주소</label>
                                    </h3>
                                    
                                    <span class="ps_box jibun_address">
                                        <input type = "text" id = "join_jibun_address" name = "jibun_address" placeholder="지번 주소" maxlength="40">
                                    </span>
                        	</div>
                        	
                        	<div class = "join_row">
                                    <h3 class = "join_title">
                                        <label for = "join_other_address">상세 주소</label>
                                    </h3>
                                    
                                    <span class="ps_box other_address">
                                        <input type = "text" id = "join_other_address" name = "other_address" placeholder="상세 주소" maxlength="40">
                                    </span>
                        	</div>
                        	
                       </div>
                        
                        <button class = "button1" type="submit">가입하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    

	</body>
</html>