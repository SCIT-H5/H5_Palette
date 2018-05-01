<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Palette - 자격증명</title>

	<!-- Navigation -->
	<%@include file="/WEB-INF/views/navi.jsp"%>  

	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/table/css/jquery.edittable.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/table/css/jquery-ui.css">
	
	<!-- Table_Fixed_Header CSS -->	
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->

	<script type="text/javascript">
		var toggle = true;
		var jaatable;
		var tablehtml;
		var datatable;
		var dataable = true;
		var fileIdx = 0;
	
		$(function readtable() {
			$.ajax({
				url : "certificateRead",
				type : "POST",
				datatype : "json",
				//받아오는 데이터타입
				success : function(obj) {
					//console.log(JSON.stringify(obj));
					jaatable = obj.certJSON; //DB json 불러오기
					tablehtml = obj.certHtml; //DB html 불러오기
					console.log(jaatable);
					console.log(tablehtml);
					if(jaatable === undefined && tablehtml === undefined){ //두개다 널일시
						//alert("노데이트");
						dataable = false;
						nodata(); //초기화테이블 생성
						tableresize(); //테이블 리사이즈 생성
						imgupload();
					} else{
						//alert("노데이트 아님"); //값이 있을때
						$('#edittable2').html(tablehtml); //테이블 html로 값을 그림
						fileIdx = $('#fileNum').val();
						tableresize();
						tableresizedis();
						addrow(); //addrow
				         imgupload(); 
				         for(var i=0; i<fileIdx; i++){ 
				            $('#file'+i).on('click', function() { 
				              var src = $(this).attr('src'); 
				              $('.bigimg').remove(); 
				              $('body').append('<img src="'+src+'" class="bigimg cert_img" width="500px" height="500px" style="position:absolute; top:30%; left:30%;">'); 
				              $('.bigimg').on('click', function() { 
				                $(this).remove(); 
				              }); 
				            }); 
				          } 
					}
					
					// Example of jQuery UI datePicker
					$("#edittable2").on("focusin", "td:nth-child(3) input", function() {
						$(this).datepicker();
					});
				},
				error : function(e) {
					alert(e);
				}
			});
		});
	
		//edittable function
		function nodata() {
			jaatable = $("#edittable2") //edittable생성
					.editTable(
							{
								field_templates : {
									'textarea' : {
										html : '<textarea class="jaatextarea" style="width: 100%; height: 100%; resize: none; border: 0; text-align: center; font-family: Arial; "/>',
										getValue : function(input) {
											return $(input).val();
										},
										setValue : function(input, value) {
											return $(input).text(value);
										}
									}, 
					                'file' : { 
					                  html : '<input type="file" class="jaa_file">', 
					                  getValue : function(input) { 
					                    return $(input).val(); 
					                  }, 
					                  setValue : function(input, value) { 
					                    return $(input).text(value); 
					                  } 
									}
								},
								row_template : [ 'textarea', 'textarea', 'text',
										'textarea', 'file' ], 
								headerCols : [ '취득자격구문', '기관명', '취득일자', '비고',
										'자격증이미지' ],
								first_row : false
							});
			/* 
			// Example of jQuery UI datePicker
			$("#edittable2").on("focusin", "td:nth-child(3) input", function() {
				$(this).datepicker();
			});
			 */
			
		}; //end edittable function
		 
		$(document).ready(function() {
			$("#complete").click(function() {
				//테이블리사이즈 디스트로이
				tableresize();
				tableresizedis();
				$('bigimg').remove(); 
				
				//row추가 히든
				$(".addrowtd").hide();
				//수정버튼 히든
				//$("#updatetoggle").hide();
				//$("#complete").hide();
				if(dataable == true){
					datatable = JSON.stringify(exportData());
					//alert("데이터" + datatable);
				} else{
					datatable = jaatable.getJsonData();
					//alert("노데이터" + datatable);
				}
				//alert(datatable);
				if(datatable != "[]"){
		        	var json = JSON.parse(datatable);
		            var cnt = 0;
		            for(var i=0; i<json.length; i++){
		            	for(var j=0; j<json[i].length; j++){
		            		if(j == json[i].length-1){ 
		                        var path = $('#file'+i).attr('src'); 
		                        if(path == "undefined"){ 
		                          $(".inputtable .hi2td:eq("+cnt+")").html('<img src="'+path+'" class="cert_img" id="file'+i+'" width="50px" height="50px">');   
		                        } 
		                         
		                      } 
		                      else{ 
		                        $(".inputtable .hi2td:eq("+cnt+")").html("<input type='text' value='"+json[i][j]+"'>"); 
		                      } 
		            		cnt++;
		            	}	
		            }
		        }
				console.log(datatable);
				
<<<<<<< HEAD
			    $('#edittable2').prepend('<input type="hidden" id="fileNum" value="'+fileIdx+'">'); 
=======
<<<<<<< HEAD
				 $('input[type="text"]').attr("readonly", true);
=======
			    $('#edittable2').prepend('<input type="hidden" id="fileNum" value="'+fileIdx+'">'); 
>>>>>>> 4-30.6차합병브런치
>>>>>>> 4-28지농점심
				tablehtml = $('#edittable2').html();
				console.log(tablehtml);
	
				var datasum = {
					tablehtml : tablehtml,
					datatable : datatable
				};
	
				console.log(datasum);
	
				var datasum2 = JSON.stringify(datasum);
	
				//table data json 보내기
				$.ajax({
					url : "certificateWrite",
					type : "POST",
					data : {
						tablehtml : tablehtml,
						datatable : datatable
					},
					success : function() {
					},
					error : function(e) {
						alert(JSON.stringify(e));
					}
				});
	
			});
		});
	
		$(document).ready(function() { //업데이트 펑션
			$("#updatetoggle").click(function() {
				 $('.addrowtd').css('display', 'table-cell');
		    	  //$(".addrowtd").slideToggle("slow");
		         $('input[type="text"]').attr("readonly", false);
				if (toggle == true) {
					$(".jaatextarea").attr("readonly", true);
					tableresize();
					toggle = false;
				} else {
					$(".jaatextarea").attr("readonly", false);
					tableresizedis();
					toggle = true;
				}
			});
		});
	
	
		// Resizable function
		function tableresize() {
			$(".inputtable").resizable();
			$(".hi2td").resizable();
		};
		
		function tableresizedis() {
			$(".inputtable").resizable('destroy');
			$(".hi2td").resizable('destroy');
		};
	
		  function imgupload() { 
			    $(".jaa_file").off("change").on("change", function(){ 
			      var $upfile = $(this); 
			        var fileNm = $(this).val();  //업로드하려는 파일의 value값 
			         
			        //이미지 파일인지 검사 
			        if (fileNm != "") { 
			            var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase(); 
			         
			            if (!(ext == "gif" || ext == "jpg" || ext == "png")) { 
			                alert("이미지파일 (.jpg, .png, .gif )만 업로드 가능합니다."); 
			                $upfile.val(''); 
			                return false; 
			            } 
			        } 
			         
			        var maxSize  = 30 * 1024 * 1024    //30MB 
			        var file = $(this)[0].files[0]; 
			          var fileSize = file.size/(1024*1024); 
			 
			         
			 
			          if(fileSize > maxSize) 
			          { 
			            alert("파일사이즈 : "+ fileSize +"MB, 첨부파일 사이즈는 30MB 이내로 등록 가능합니다."); 
			            $upfile.val(''); 
			              return; 
			          } 
			         
			      var formData = new FormData(); 
			      formData.append("file", file); 
			       
			      //위젯에 업로드한 이미지 추가 
			      $.ajax({ 
			        type:"POST",             
			        url:"/h5/port/fileupload",         
			        data:formData, 
			        processData: false, 
			          contentType: false, 
			        dataType:"text",         
			        success:function(data){   
			          console.log(data); 
			          $upfile.css('display', 'none'); 
			          $upfile.parent('td').append('<img src="'+data+'" class="cert_img" id="file'+fileIdx+'" width="50px" height="50px">'); 
			          $('#file'+fileIdx).on('click', function() { 
			            $('.bigimg').remove(); 
			            $('body').append('<img src="'+data+'" class="bigimg cert_img" width="500px" height="500px" style="position:absolute; top:30%; left:30%;">'); 
			            $('.bigimg').on('click', function() { 
			              $(this).remove(); 
			            }); 
			          }); 
			          fileIdx++; 
			        }, 
			        error: function(e){       
			          console.log(e); 
			        } 
			      });//ajax 
			    });//change이벤트 
			  } 

	
	</script>

</head>

<body style="background-color: rgb(104,22,22);">
	<header>
		<div class="my-auto" >
			<div class="mx-auto" style="text-align: center;">
				<img src="/h5/resources/img/certification.png" style="width: 100%;">					
			</div>         
		</div>      
	</header>
	<section style="width: 90%;">
		<div id="edittable2" class="table100 ver2" style="margin-left: 150px;"></div>
	</section>
	<div class="divOne">
		<input type="button" id="updatetoggle" class="button_4" value="수정"/>
		<input type="button" id="complete" class="button_5" value="완료"/>
	</div>
	
	<section>
		<!-- Navigation -->
		<%@include file="/WEB-INF/views/footer-text-white.jsp"%>
	</section>
	
	
	<script
		src="${pageContext.request.contextPath}/resources/table/js/test3.js"></script>	
	<script 
		src="${pageContext.request.contextPath}/resources/table/js/wiget_table.js"></script>		
	<script
		src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.min.js"></script>
</body>
</html>
