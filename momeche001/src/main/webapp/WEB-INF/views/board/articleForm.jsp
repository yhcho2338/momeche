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
 	var compare_text=document.articleForm.article_content.value;
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

			document.articleForm.article_content.select();
			return false;
 		} 
 		
 		if(swear_alert_count<1){
 			document.articleForm.submit();
 		}
 	}

 	function select_area()	{
 		document.articleForm.article_content.select();
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
    	obj.action="${contextPath}/board/listArticles.do";
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
            <form name="articleForm" method="post"   action="${contextPath}/board/addNewArticle.do"   enctype="multipart/form-data">
            <table class="articleForm-table">
                <tr>
                    <th>작성자</th>
                    <td><input type="text" id = "af_name" value="${member.mb_name }"readonly></td>
                </tr>
                <tr>
                    <th>글제목</th>
                    <td><input style = "width:400px;" type="text" id = "af_title" name="article_title"></td>
                </tr>
                <tr>
                    <th>글 내용</th>
                    <td><textarea id = "articleForm-content" name="article_content" onclick="select_area()"></textarea> </td>
                </tr>
                <tr>
                    <th>이미지파일 첨부:</th>
                    <td style="padding:10px;"> <input type="file" id ="article_img" name="article_photo"  onchange="readURL(this);"/> <img  id="preview" src="#" width=50 height=50/></td>
                </tr>
                <tr>
                    <th>이미지파일 첨부</th>
                    <td class="image-td"> <input type="button" id = "file_plus" value="파일 추가" onClick="fn_addFile()"/>    추가 이미지는 2개까지 첨부할 수 있습니다.</td>
                   </tr>
                   <tr>
                      <td colspan="4"><div id="d_file"></div></td>
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