<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!-- 
	@comment	: 카드 등록을 테스트하는 페이지
	@author		: 정보승
 -->
 
<html lang="ko">
<head>
	<title>카드 등록</title>
	<%-- <%@ include file="/WEB-INF/views/common/headPart.jsp" %> --%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
    <!-- Bootstrap -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" media="screen">
    <link href="<c:url value="/resources/myinfo/insertYourCard/css/imgareaselect-default.css"/>" rel="stylesheet" media="screen">
    <link href="<c:url value="/resources/myinfo/insertYourCard/css/pick-a-color-1.1.7.min.css"/>" rel="stylesheet" media="screen">
	<link href="<c:url value="/resources/myinfo/insertYourCard/css/main.css"/>" rel="stylesheet" media="screen" rel="stylesheet">
	
	<script type="text/javascript">
		
		// 이미지 정보들을 담을 배열
		var sel_files = [];
		var firstImg = true;
		var index = 0;
		
		$(document).ready(function() {
			$("#input_imgs").on("change", handleImgFileSelect);			
		});

		function fileUploadAction() {
			console.log("fileUpLoadAction");
			$("#input_imgs").trigger('click');
		}
		

		function handleImgFileSelect(e) {
			// 이미지 정보들을 초기화
			sel_files = [];
			
			 if(firstImg == true){
				$(".imgs_wrap").empty();
				firstImg = false;
			};
			var files = e.target.files; //alert찍어보니 배열이 나옴 {"0":{},"1":{},"2":{}} ...
			var filesArr = Array.prototype.slice.call(files); 

			
			filesArr[index];
			
			
			filesArr.forEach(function(f) {
				alert(index);
				if(!f.type.match("image.*")) {
					
					alert("이미지 파일만 가능합니다.");
					return;
				};
				$("#comment").hide();
				sel_files.push(f);
				var reader = new FileReader();
				reader.onload = function(e) {
					var src = e.target.result;
					
					//var img_html = "<img src=\"" + e.target.result + "\" />";
					var html = "<div class='imgPreview'><a href=\"javascript:void(0)\"   onclick=\"moveToDiv(\'"   + src + "\'" +"," +  index + ")\" id=\"img_id_" + index + "\"><img style='width : 200px;' src=\"" + e.target.result + 
								"\" data-file='" + f.name + "' class='selProductFile' title='설렉트 된 이미지들'></a></div>";
					$(".imgs_wrap").append(html);
					index++;
					
				 $(".img_wrap").append(html);
				};
			
				reader.readAsDataURL(f);
			
				
			});
		}

		 function moveToDiv(src, index){
			
			 $(".selectedImg img").attr("src", src);
			 
			 //console.log($("#input_imgs")[0].files[]);// 멀티파일 업로드에서의 파일명 확인
			 
			 var form = $('#tempUpload')[0];
             var formData = new FormData(form);
             formData.append("fileObj", $("#input_imgs")[0].files[0]);
             $("#input_imgs0").files[0]; 
             $("#input_imgs0").files[1];
             $("#input_imgs1").files[0];
			// 이미지 미리보기를 하는 순간 OCR 분석을 위해 이미지를 서버로 전송.
			 $.ajax({
				 
				 url : "tempUpload"
				 , processData: false
                 , contentType: false
				 , type : "post"
				 , data : formData
				 , success : function(savedfile) {
					 
					 // 이미지 전송이 성공함과 동시에 OCR분석
					 $.ajax({
						
						url : "detectTextFromImage"
						, type : "GET"
						, data : {
							
							 "savedfile" : savedfile
							}
						, success : function (detectResult) {
							
							console.log(detectResult);
							$("#comment").show();
							var str = detectResult;
							$("#comment").html(str);
							resultInput(detectResult);
						}
						, error : function (e) {
							
							alert("실패: "+e);
						}
					});
				 }
			 	, error : function(e) {
			 		console.log(e);
			 	}
			 });
			
		 }

		 // OCR분석 결과를 텍스트에 집어넣기
		 function resultInput(detectResult) {
			 
		 }
		 
		 
		 
		 
		
		// 다중 파일 미리보기에서 특정 이미지만 삭제하기
		//onclick=\"deleteImageAction(" + index + ")\"
		function deleteImageAction(index) {

			if(sel_files.length == 0) {
				
				// 이미지 정보들을 초기화
				sel_files = [];
				$(".imgs_wrap").empty();
			}
			
			console.log("index : " + index);

			sel_files.splice(index, 1);

			var img_id = "#img_id_" + index;
			$(img_id).remove();

			console.log(sel_files);
		
		}

		// 다중 파일 POST 전송
		function submitAction() {

			var data = new FormData();

			for(var i=0, len = sel_files.length; i < len; i++) {

				var name = "image_" + i;
				data.append(name, sel_files[i]);
			}

			data.append("image_count", sel_files.length);

			var xhr = new XMLHttpRequest();
			// 수정 필요
			xhr.open("POST", "./study01_af.php");
			xhr.onload = function(e) {
				if(this.status == 200) {
					console.log("Result : " + e.currentTarget.responseText);
				}
			}

			xhr.send(data);
		}

	</script>
</head>

<body>

	<%-- <%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %> --%>

<form action="../yourcard/insertYourCard" method="post" enctype="multipart/form-data">
<div class="mainView" >
	

	<!-- 업로드한 이미지가 나오는 부분 -->
	<div class="col-8">
	    
	    <div class="tab-content" style="float: left;">
	        <div class="tab-pane active" id="image" >
	            <!-- <input type="file" multiple="multiple" id="fileSelection" name="upload[]" onclick="readAllURL();" onchange="readURL(this);"/> -->
				<!-- <img id="selImage" src="<c:url value="/resources/myinfo/insertYourCard/img/bg4(B).png "/>" width="400px"> -->
				<!-- <a href="javascript:" onclick="fileUploadAction();" class="my_button">Upload</a> -->
				
				<button type="button" class="btn btn-primary my_button" onclick="fileUploadAction();"> Upload </button>
				<input type="file" class="fileUploadBtn" id="input_imgs" multiple/>
			</div>
			
			<!-- 가장 좌측에 이미지들이 세로로 정렬되는 부분 : 미리보기 -->
			<div class="imgs_wrap" style="float: left; width: 320px"> 
				<img id="img" src="<c:url value="/resources/myinfo/insertYourCard/img/bg4(B).png "/>" width="400px">
			</div>
			
			<!-- 미리보기 선택시 확대된 이미지가 보이는 부분 -->
			<div class="centerDiv" style="float: left; width: 60%; margin-left: 30px; ">
				<div class="selectedImg">
					<img style="width : 100%;" src=""  />
						<pre id="comment">NO IMAGES , PLEASE CLICK YOUR IMAGES.</pre>
				</div>
			</div>
		
	    </div>
	</div>
</div>


</form>

<form id="tempUpload" enctype="multipart/form-data">

</form>
	<!-- JavaScript plugins (requires jQuery) -->
	<script src="<c:url value="/resources/myinfo/insertYourCard/js/jquery.min.js"/>"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<c:url value="/resources/myinfo/insertYourCard/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/myinfo/insertYourCard/js/jquery.imgareaselect.js"/>"></script>
	<script src="<c:url value="/resources/myinfo/insertYourCard/js/tinycolor-0.9.15.min.js"/>"></script>
	<script src="<c:url value="/resources/myinfo/insertYourCard/js/pick-a-color-1.1.7.min.js"/>"></script>
	<script src="<c:url value="/resources/myinfo/insertYourCard/js/main.js"/>"></script>



	<script type="text/javascript" src="<c:url value="/resources/js/anime.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js "/>"></script>
</body>
</html>