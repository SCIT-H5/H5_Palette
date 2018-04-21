<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Palette - 성적</title>
	
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	
	<script type="text/javascript">
		$(function(){
			
			$("#imgBtn").on("click",function(){
				
				var formData = new FormData();
				formData.append("file",$("#upload")[0].files[0]);
				
				$.ajax({
					type:"POST",						
					url:"fileupload",				
					data:formData,
					processData: false,
				    contentType: false,
					dataType:"text",				
					success:function(data){	
						console.log(data);
						$("#imgDiv").empty();
						$("#imgDiv").html('<img alt="" src="'+data+'">');
					},
					error: function(e){			
						console.log(e);
					}
				});
			});
		});
	
	</script>
</head>
<body>

	<form action="file_upload" method="get">
	
		<div id="imgDiv"></div>
		
		<input type="file" id="upload" name="file-data">	
		
		<input type="button" id="imgBtn" value="전송">
		
	</form>

</body>
