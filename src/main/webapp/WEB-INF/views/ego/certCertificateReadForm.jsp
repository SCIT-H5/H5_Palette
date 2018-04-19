<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main_page.css">
	
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Palette - 자격증명</title>
	
	<!-- Bootstrap core CSS -->
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">

	<!-- HTML5UP-Parallelism CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/html5up-parallelism/assets/css/main.css" />
	
    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.css">
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'>
    <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'>

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/creative.css">
	
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	
	<style type="text/css">
		.filebox label { 
			width: 200px;
			text-align: center;
			display: inline-block; 
			padding: .5em .75em; 
			color: rgb(255,255,255); 
			font-size: inherit; 
			line-height: normal; 
			vertical-align: middle;
			background: rgba(71,71,71,0.6);
			cursor: pointer; 			
			border-bottom-color: #e2e2e2; 
			border-radius: .25em; 
		} 
		
		/* 파일 필드 숨기기 */ 
		.filebox input[type="file"] { 
			position: absolute; 
			width: 1px; 
			height: 1px; 
			padding: 0; 
			margin: -1px; 
			overflow: hidden; 
			clip:rect(0,0,0,0); 
			border: 0; 
		}
		
		.text-white {
			color: white;
		}
		
		.text-red {
			color: #F05F40;
		}
		
	</style>
	<script type="text/javascript">	
	
		// 이미지 정보들을 담을 배열
		var sel_files = []; //파일 저장될 배열
		var firstImg = true; //첫이미지
		var index = 0;
		
		$(document).ready(function() {
			$("#input_imgs").on("change", handleImgFileSelect); //이미지가 변경되었을때 handleImgFileSelect 실행
		});
		
		/* 
		function fileUploadAction() {
			console.log("fileUpLoadAction");
			$("#input_imgs").trigger('click');
		} */
			
		function handleImgFileSelect(e) { //파일 업데이트를 하면 object가 e값으로 들어온다.
			
			//console.log(e);
			//alert(e);
			
			// 이미지 정보들을 초기화
			sel_files = [];

			/* 
			if(firstImg == true){ //첫번째 이미지가 참일때 .imgs_wrap을 비운다.
				$(".imgs_wrap").empty();
				firstImg = false;
			};
			 */
			
			var files = e.target.files; //alert찍어보니 배열이 나옴 {"0":{},"1":{},"2":{}} ... 파일 인스턴스를 검색하는 이벤트
										//변경된 파일 인스턴스를 가져옴
			
			//console.log(files);
			//alert("파일" + files);
			
			var filesArr = Array.prototype.slice.call(files);  //변경되서 날라온 파일을 어레이형으로 불러오기위한 설정
			
			//console.log(filesArr);
			//alert("파일리스트" + filesArr);
			
			filesArr[index];
			
			//console.log(filesArr[index]);
			
			
			filesArr.forEach(function(f) {
				//console.log(f); //지금까지 출력된 filesArr[index]
				
				//5.	type:"image/jpeg
				if(!f.type.match("image.*")) { //만약 타입이 이미지랑 매칭
					alert("이미지 파일만 가능합니다.");
					return;
				};
				
				//이미지가 올라갈시 코맨트를 숨김
				$("#comment").hide();
				
				//배열에다가 file값 삽입
				sel_files.push(f);
				
				//리더변수 FileReader()선언
				var reader = new FileReader();
				
				//FileReader.onload속성에는 load이벤트가 발생하면 readAsArrayBuffer , readAsBinaryString , readAsDataURL 또는 readAsText 로 읽은 내용을 읽을 수 있는 이벤트 핸들러가 포함되어 있습니다.
				reader.onload = function(e) {
					var src = e.target.result;
					console.log(src);
					
					var html = "<div class='imgPreview'><a href=\"javascript:void(0)\"   onclick=\"moveToDiv(\'"   + src + "\'" +"," +  index + ")\" id=\"img_id_" + index + "\"><img style='width : 200px;' src=\"" + e.target.result + 
								"\" data-file='" + f.name + "' class='selProductFile' title='설렉트 된 이미지들'></a></div>";
					$(".imgs_wrap").append(html);
					//인덱스 번호 증가
					index++;
				};

				reader.readAsDataURL(f);
				 
			});
		} //end to handleImgFileSelect

		function moveToDiv(src, index){ //이미지 프리뷰
				
			$(".selectedImg img").attr("src", src);
			 
			//console.log($("#input_imgs")[0].files[]);// 멀티파일 업로드에서의 파일명 확인
			 
			var form = $('#tempUpload')[0];
            var formData = new FormData(form);
            
            formData.append("fileObj", $("#input_imgs")[0].files[0]);
            
            $.ajax({
				type:"POST",						
				url:"../certificate",				
				data:formData,
				processData: false,
			    contentType: false,
				//dataType:"json",				
				success:function(data){	
					console.log(data);
					$("#imgs_wrap").empty();
					$("#imgs_wrap").html('<img alt="" src="download?origin='+data.originalFileName+'&saved='+data.savedFileName+'">');
				},
				error: function(e){	
					console.log(e);
				}
			});							 
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
	
	</script>
</head>


<body>

	<!-- Navigation -->
    <%@include file="/WEB-INF/views/navi.jsp"%> 	
	<header id="bg-primary" style="height:70px; background-color: black;"></header>   	
	     
    <form action="fileupload_certificate" method="post" enctype="multipart/form-data">
				
		<!-- 업로드한 이미지가 나오는 부분 -->
		<div class="col-8">
		    
		    <div class="tab-content" style="float: left; margin-left: 50px;">
		        <div class="filebox">
		        	<br><br> 				
					<label for="input_imgs">Upload</label> 
					<input type="file" id="input_imgs" multiple="multiple"> 
				</div>
				
				<!-- 가장 좌측에 이미지들이 세로로 정렬되는 부분 : 미리보기 -->
				<div class="imgs_wrap" style="float: left; width: 320px; margin-bottom: 30px;"> 
					<img id="img" src="" width="400px">						
				</div>							
    			
		    </div>
		    
		    <!-- 미리보기 선택시 확대된 이미지가 보이는 부분 -->
			<div class="centerDiv" style="float: left; margin-left: 30px; width: 50%;">
				<div class="selectedImg">
					<br><br>
					<img style="width : 100%;" src=""  />
					<pre id="comment">NO IMAGES , PLEASE CLICK YOUR IMAGES.</pre>
				</div>
			</div>	
		</div>			
	</form>		
	
	<form id="tempUpload" enctype="multipart/form-data"></form>
		
	<div id="wrapper">

			<div id="footer_1">
				<div class="left text-white">
					<p>This is <strong class="text-red">Palette</strong>, a responsive portfolio site template by <a href="/h5/#contact">H5_Palette</a><br /></p>
				</div>
				<div class="right text-white">					
					<ul class="copyright">
						<li>&copy; Palette</li><li>Design: <a href="/h5/#contact">H5_Palette</a></li>
					</ul>
				</div>
			</div>

		</div>
			
	<!-- Bootstrap core JavaScript -->
	    <script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
	    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>

    <!-- Plugin JavaScript -->
	    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.js'/>"></script>
	    <script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.js'/>"></script>
	    <script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.js'/>"></script>

    <!-- Custom scripts for this template -->
    	<script src="<c:url value='/resources/js/creative.js'/>"></script>

</body>
</html>