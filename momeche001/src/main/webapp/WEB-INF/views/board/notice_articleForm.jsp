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
  
  	var cnt=1;
  	function fn_addFile(){
  	if (cnt>=2) {
  		file_plus.disabled = 'disabled';
	  }
  	else 
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
            <form name="articleForm" method="post"   action="${contextPath}/board/addNewNoticeArticle.do"   enctype="multipart/form-data">
            <table class="articleForm-table">
                <tr>
                    <th>작성자</th>
                    <td><input type="text" id = "af_name" value="${member.mb_name }"readonly></td>
                </tr>
                <tr>
                    <th>글제목</th>
                    <td>
                    <input style = "width:400px;" type="text" id = "af_title" name="notice_title" required>
                    </td>
                </tr>
                <tr>
                    <th>글 내용</th>
                    <td><textarea id = "articleForm-content" name="notice_content"></textarea> </td>
                </tr>
	   			<tr>
	      			<td class = "subu" colspan="2">
	       				<input type="submit" value="글쓰기"/>
	       				<input type=button value="목록보기"onClick="backToList(this.form)" />
	      			</td>
       			</tr>
            </table>
        </form>
        </div>
    </div>
</body>
</html>