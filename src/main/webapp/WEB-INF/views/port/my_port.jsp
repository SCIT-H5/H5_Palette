<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Palette - 내 포트폴리오</title>
<%@include file="/WEB-INF/views/navi.jsp"%>

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
			$(".replyT").hide();
			$(".reply").hide();
			var portNum = $(this).attr('value');
			var portId = '${sessionScope.loginId}';
			var portHeight = $(this).attr('portHeight');
			portHeight = Number(portHeight.split('px')[0])+200+'px';
			$('#mainDiv').css('height', portHeight);
			$('#portDiv').load('/h5/port/portView?portNum='+portNum+'&portId='+portId);
		});
		
		
		$('.openPortNum').on('click', function() {
			$(".replyT").show();
			$(".reply").show();
			var portNum = $(this).attr('value');
			var portId = $(this).attr('portId');
			var portHeight = $(this).attr('portHeight');
			portHeight = Number(portHeight.split('px')[0])+200+'px';
			$('#mainDiv').css('height', portHeight);
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
					var s_id = '${sessionScope.loginId}';
					var commentID = obj[i].commentID;
					var commentText = obj[i].commentText;
					var commentNum = obj[i].commentNum;
					var commentDate = obj[i].commentDate;
					var replyportNum = obj[i].replyportNum;
					//alert(replyportNum);
					str += "<tr class='row100 head' style='font-weight: bold;'><td class='cell100' style='width:25%; padding-left: 40px;'><b>"+commentID+"</b></td>";
					str +="<td class='cell100' style='width:25%;'>"+commentText+"</td>";
					str +="<td class='cell100' style='width: 26%;'>"+commentDate+"</td>";
					str +="<td class='cell100' style='width:15%; padding-right: 40px;'>";
					if(s_id == commentID){
						str += "<a href='javascript:replyEditForm("+commentNum+", "+replyportNum+",\""+commentText+"\")'>[修整]</a>";
					}
					str +="</td>";
					str +="<td class='cell100' style='width:15%; padding-right: 40px;'>";
					if(s_id == commentID){
						str +="<a href='javascript:replyDelete("+commentNum+", "+replyportNum+")'>[削除]</a>";
						
					}
					str +="</td>";
					
					str +="</tr><tr class='row100 body'><td class='cell100' style='width:40%;'colspan='4'><div id='div"+commentNum+"'></div></td></tr>";
					
				
					
				}
				//$('.reply').html("");
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
			alert('内容を入力してください。');
			retext.focus();
			retext.select();
			return false;
		}
		
		return true;
	}

	//리플 수정
	function replyEditForm(commentNum, replyportNum, retext) {
		//해당 리플번호를 붙여 생성한 <div>태그에 접근
		 alert('들어왓?'+commentNum); 
		var div = document.getElementById("div" + commentNum); //div를 만들어냄 댓글넘버를통해
	
		var str = '<form name="editForm' + commentNum + '" action="replyEdit" method="post">';
		str += '<input type="hidden" name="commentNum" value="'+commentNum+'">';
		str += '<input type="hidden" name="replyportNum" value="'+replyportNum+'">';
		str += '&nbsp;';
		str += '<input type="text" name="commentText" value="' + retext + '" style="width:697px;">';
		str += '&nbsp;';
		str += '<a href="javascript:replyEdit(document.editForm' + commentNum + ')">[セーブ]</a>';
		str += '&nbsp;';
		str += '<a href="javascript:replyEditCancle(document.getElementById(\'div' + commentNum + '\'))">[キャンセル]</a>';
		str += '</form>';
		div.innerHTML = str;
		
	}

	//리플 수정 취소
	function replyEditCancle(div) {
		div.innerHTML = '';
	}

	//리플 수정 정보 저장
	function replyEdit(form) {
		if (confirm('修正された内容をセーブしますか？')) {
			form.submit();
		}
	}

	//리플 삭제
	function replyDelete(replynum, boardnum) {
		if (confirm('コメントを削除しますか？')) {
			location.href = 'replyDelete?replynum=' + replynum + '&boardnum='
					+ boardnum;
		}
	}
	
	
</script>
<style type="text/css">
	.portNum, .openPortNum {
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
    	width: 430px;
    	margin: auto;
    	margin-top: 1000px;
	}
	
	.reply{
		    width: 830px;
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
    
<div class="bg-image-blur" style="">
	
	<img src="/h5/resources/img/myportfolio.png" style="width: 100%;">
					
</div>

<div>
	<!-- portfolio list -->
	<div  style="width: 16%; height: 1000px; position: absolute; margin-top: 20px; text-align: center; ">
		<p style="font-size: 15pt; background-color:#528FF8; padding:15px; border: 1px solid; font-weight:bold;">私のポートフォリオ</p>
		<c:forEach items="${portList }" var="list" varStatus="status">
			<span class="portNum" value="${list.portNum }" portHeight="${list.portHeight }">${status.index+1 }番ポートフォリオ</span>
			<br><br>
		</c:forEach>

		<p style="font-size: 15pt;  background-color:#528FF8; margin-top: 160px; padding:15px; border: 1px solid; font-weight:bold;">共有ポートフォリオ</p>

		<c:forEach items="${portOpenList }" var="openList">
			<span class="openPortNum" value="${openList.portNum }" portId="${openList.portId }" portHeight="${openList.portHeight }">${openList.portId }さまのポートフォリオ</span>
			<br><br>
		</c:forEach>
		
	</div>
</div>	

<div id="mainDiv" style="width:82%; height:1000px; float: right; margin: 20px; background-color: white;">

	<!-- portfolio view -->
			<div id="portDiv" class="portDiv">
				<img alt="" src="/h5/resources/portfolio/img/resume.gif" width="100%" height="1000px">
				
			</div>	
				
				
				
	
</div>		
				<!-- 리플 작성 폼 시작 -->
					<div id = "replyT" class="replyT">
						<form id="replyform" action="replyWrite" method="post" onSubmit="return replyFormCheck();">
							コメント内容 :<input type="hidden" name="replyportNum" id="replyportNum" />
			 		
							<input type="text" name="commentText" id="retext" style="margin-left: 25px; margin-right: 25px;"/>
							
							<input type="submit" value="確認" />
						</form>
					</div>
					<!-- /리플 작성 폼 끝 -->
				<br>
	<!-- 리플 목록 출력 시작 -->
				<table class="reply"></table>
				
	
</div>	

<section>
		<!-- Navigation -->
		<%@include file="/WEB-INF/views/footer-text-white.jsp"%>
	</section>			
	
</body>
</html>