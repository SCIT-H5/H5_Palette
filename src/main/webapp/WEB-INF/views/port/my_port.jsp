<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Palette - 내 포트폴리오</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <!-- Table_Fixed_Header CSS -->
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/fonts/font-awesome-4.7.0/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/select2/select2.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/perfect-scrollbar/perfect-scrollbar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
		<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css"> --%>
	<!--===============================================================================================-->
   
<script type="text/javascript">
	$(function() {
		$(".replyT").hide();
		$(".reply").hide();
		$('.portNum').on('click', function() {
			$(".replyT").show();
			$(".reply").show();
			var portNum = $(this).attr('value');
			var portId = '${sessionScope.loginId}';
		$('#portDiv').load('/h5/port/portView?portNum='+portNum+'&portId='+portId);
		$('#replyportNum').val(portNum);//해당 포폴의 댓글입력시 포폴번호 같이 넘김-히든속성의 벨류로 지정해서 넘김

		$.ajax({
			url : "portReplyList",
			type : "POST",
			datatype : "text",
			data : {portNum : portNum},
			success : function(obj) {
				
				var size = obj.length;//저장된 obg의 길이
				var str;
				for(var i=0; i<size; i++){
					
					var commentID = obj[i].commentID;
					var commentText = obj[i].commentText;
					var commentNum = obj[i].commentNum;
					var replyportNum = obj[i].replyportNum;
					alert(replyportNum);
					str += "<tr class='row100 head' style='font-weight: bold;'><td class='cell100' style='width:25%; padding-left: 40px;'><b>"+commentID+"</b></td>";
					str +="<td class='cell100' style='width:25%;'>"+commentText+"</td>";
					str +="<td class='cell100' style='width:15%; padding-right: 40px;'>";
					if(portId == commentID){
						str += "<a href='javascript:replyEditForm("+commentNum+", "+replyportNum+","+commentText+")'>[수정]</a>";
							
					}
					str +="</td>";
					str +="<td class='cell100' style='width:15%; padding-right: 40px;'>";
					if(portId == commentID){
						str +="<a href='javascript:replyDelete("+commentNum+", "+replyportNum+")'>[삭제]</a>";
						
					}
					str +="</td>";
					
					str +="</tr><tr class='row100 body'><td class='cell100' style='width:40%;'colspan='4'><div id='div"+commentNum+"'></div></td></tr>";
					
				
					
				}
				$('.reply').html(str);
			},
			error : function(e) {
				alert(e);
			}
		});
		/* var url = "/h5/port/portView?portNum="+portNum+"&portId="+portId;
			$(location).attr('href', url);  */
		});
	});
	
	//리플 쓰기 폼 체크
	function replyFormCheck() {
		var retext = document.getElementById('retext');
		
		
		if (retext.value == '') {
			alert('내용을 입력하여 주시와요');
			retext.focus();
			retext.select();
			return false;
		}
		
		return true;
	}

	//리플 수정
	function replyEditForm(commentNum, replyportNum, retext) {
		//해당 리플번호를 붙여 생성한 <div>태그에 접근
		/* alert('들어왓?'+commentNum); */
		var div = document.getElementById("div" + commentNum);
	
		var str = '<form name="editForm' + commentNum + '" action="replyEdit" method="post">';
		str += '<input type="hidden" name="commentNum" value="'+commentNum+'">';
		str += '<input type="hidden" name="replyportNum" value="'+replyportNum+'">';
		str += '&nbsp;';
		str += '<input type="text" name="commentText" value="' + retext + '" style="width:697px;">';
		str += '&nbsp;';
		str += '<a href="javascript:replyEdit(document.editForm' + commentNum
				+ ')">[저장]</a>';
		str += '&nbsp;';
		str += '<a href="javascript:replyEditCancle(document.getElementById(\'div'
				+ commentNum + '\'))">[취소]</a>';
		str += '</form>';
		div.innerHTML = str;
	}

	//리플 수정 취소
	function replyEditCancle(div) {
		div.innerHTML = '';
	}

	//리플 수정 정보 저장
	function replyEdit(form) {
		if (confirm('수정된 내용을 저장하시겠습니까?')) {
			form.submit();
		}
	}

	//리플 삭제
	function replyDelete(replynum, boardnum) {
		if (confirm('리플을 삭제하시겠습니까?')) {
			location.href = 'replyDelete?replynum=' + replynum + '&boardnum='
					+ boardnum;
		}
	}
	
	
</script>
<style type="text/css">
	.portNum {
		font-size: 30sp;
		font-weight: bold;
		cursor: pointer;
		
	}
	.back{
		 background-color: rgb(55,96,146);
	}
	.title{
		
		width:50%;
		margin:auto;
		margin-top:85px;
		/* font-family: 'Open Sans', 'Helvetica Neue', Arial, sans-serif; */
		font-size:25px;
		text-align: center;
		
	}
	.replyT{
   		/* background-color: red; */
    	width: 370px;
    	margin: auto;
    	margin-top: 1000px;
	}
	
	.reply{
		    width: 700px;
    		/* height: 200px; */
    		margin: auto;
   	 		border: 1px solid gray;
   	 		text-align: center;
   	 		
	}
	.retext{
		float: right;	
	}
	
</style>
</head>

<body class="back">
<!-- Navigation -->
    <%@include file="/WEB-INF/views/navi.jsp"%>
<div class="bg-image-blur" style="">
	
	<img src="/h5/resources/img/myportfolio.png" style="width: 100%;">
					
</div>

<div>
	<!-- portfolio list -->
	<div  style="width: 20%; height: 1000px; position: absolute; margin: 20px; text-align: center; border: 1px solid;">
	
		<c:forEach items="${portList }" var="list" varStatus="status">
			<br><br>
			<span class="portNum" value="${list.portNum }">${status.index+1 }番ポートフォリオ</span>
			
			
		</c:forEach>
	</div>
</div>	

<div style="width:75%; height:1000px; float: right; margin: 20px; background-color: white;">

	<!-- portfolio view -->
			<div id="portDiv" class="portDiv" >
				<p>뷰</p>
				
			</div>	
				<!-- 리플 작성 폼 시작 -->
					<div id = "replyT" class="replyT">
						<form id="replyform" action="replyWrite" method="post" onSubmit="return replyFormCheck();">
							리플내용 :<input type="hidden" name="replyportNum" id="replyportNum" />
			 		
							<input type="text" name="commentText" id="retext" />
							
							<input type="submit" value="확인" />
						</form>
					</div>
					<!-- /리플 작성 폼 끝 -->
				<br>
				<!-- 리플 목록 출력 시작 -->
				<table class="reply">
					<%-- <c:forEach var="reply" items="${replylist}">
					<input type="hidden" name="reply" id="reply_t" />
						<tr>
							<td class="commentID">
							<b>${reply.commentID}</b>
							</td>
							<td class="commentText">
							${reply.commentText}
							</td>
							<td class="replybutton">
							<c:if test="${loginId == reply.commentID}">
							<a href="javascript:replyEditForm(${reply.commentNum}, ${reply.replyportNum}, '${reply.commentText}')">
							[수정]</a>
							</c:if>
							</td>	
							<td class="replybutton">
							<c:if test="${loginId == reply.commentID}">
							<a href="javascript:replyDelete(${reply.commentNum}, ${reply.replyportNum })">
							[삭제]</a>
							</c:if>
							</td>
						</tr>
						<tr>
							<!-- 리플 수정 폼이 나타날 위치 -->
							<td class="white" colspan="4">
							<div id="div${reply.commentNum}"></div>
							</td>
						</tr>

					</c:forEach> --%>
				</table>
				
				
				
				
			
			
			
				<!-- buttons -->
				<!-- <div style="height: 20%; background-color: fuchsia; text-align: center;">
					<input type="button" value="수정">
					<input type="button" value="다운로드">
					<input type="button" value="삭제">
				</div> -->
				
	
</div>				
		
	


</body>
</html>