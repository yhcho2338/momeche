<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8" isELIgnored="false" %>
     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	// 금칙어 필터 시작
	var swear_words_arr=new Array("바보","멍청이","병신","관리자바보","조용호바보"); // 제한 목록 (arrayList 형태로 추후 보강요망)
	var swear_alert_arr=new Array;
	var swear_alert_count=0;

 	function reset_alert_count(){
 		swear_alert_count=0;
 	}

 	function validate_user_text(){
 		reset_alert_count();
 	var compare_text=document.articleForm.info_content.value;
 		for(var i=0; i<swear_words_arr.length; i++){
 			for(var j=0; j<(compare_text.length); j++){
 				if(swear_words_arr[i]==compare_text.substring(j,(j+swear_words_arr[i].length)).toLowerCase()) {
 					swear_alert_arr[swear_alert_count]=compare_text.substring(j,(j+swear_words_arr[i].length));
 					swear_alert_count++;
 				}
 			}
 		}
 	var alert_text="";
 		for(var k=1; k<=swear_alert_count; k++) {
 			alert_text+="n" + "(" + k + ") " + swear_alert_arr[k-1];
 		}
 		if(swear_alert_count>0){

 			// 금칙어 멘트
			alert(alert_text+"는 입력할 수 없는 단어입니다");

			document.articleForm.info_content.select();
			return false;
 		} 
 		
 		if(swear_alert_count<1){
 			document.articleForm.submit();
 		}
 	}

 	function select_area()	{
 		document.articleForm.info_content.select();
 	}

 	window.onload=reset_alert_count;
	// 금칙어 필터 끝 


   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  	}  
  	function backToList(obj){
    	obj.action="${contextPath}/info/listInfo.do";
    	obj.submit();
  	}
  
  	var cnt=0;
  	function fn_addFile(){
  	if (cnt>1) {
  		file_plus.disabled = 'disabled';
	}else 
  		 cnt++;
  		$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
  	} 
  

</script>
 <title>글쓰기 창</title>
</head>
<body>
 <div class = "body-area1">
        <div class="body-area2">
            <p id = "articleForm-p">글쓰기</p>
            <form name="articleForm" method="post"   action="${contextPath}/info/addNewInfo.do?info_url='${infoMap.info_url}'"   enctype="multipart/form-data">
            <table class="articleForm-table">
                <tr>
                    <th>작성자</th>
                    <td><input type="text" id = "af_name" value="${member.mb_id }"readonly></td>
                </tr>
                <tr>
                    <th>글제목</th>
                    <td><input style = "width:400px;" type="text" id = "af_title" name="info_title"></td>
                </tr>
                <tr>
                    <th>youtube 주소</th>
                    <div>
                    <td><span class="line_h35">https://youtu.be/  </span>
                    <input style = "width:400px;" type="text" id = "af_title" name="info_url"></td>
                    <input type="hidden" name="info_url_origin" value="${infoMap.info_url_origin}">
                	</div>
                </tr>
                <tr>
                    <th>글 내용</th>
                    <td><textarea id = "articleForm-content" name="info_content" onclick="select_area()"></textarea> </td>
                </tr>

               
	   			<tr>
	      			<td class = "subu" colspan="2">
	       				<!-- <input type="submit" value="글쓰기" onclick="validate_user_text();"/> -->
	       				<input type=button value="글쓰기" onclick="validate_user_text();"/>
	       				<input type=button value="목록보기"onClick="backToList(this.form)" />
	      			</td>
       			</tr>
            </table>
        </form>
        </div>
    </div>
</body>
</html>