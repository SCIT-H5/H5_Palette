<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Palette - 이수과목</title>
   
   <%@include file="/WEB-INF/views/navi.jsp"%>
   
   <!-- Table_Fixed_Header CSS -->
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/fonts/font-awesome-4.7.0/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/select2/select2.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/vendor/perfect-scrollbar/perfect-scrollbar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Table_Fixed_Header/css/main.css">
	<!--===============================================================================================-->
   <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/table/js/test3.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/table/js/wiget_table.js"></script>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/table/css/jquery.edittable.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/table/css/jquery-ui.css">


<script type="text/javascript">
   var toggle = true;
   var jaatable;
   var tablehtml;
   var datatable;
   var dataable = true;
   var fileIdx = 0;
   
   $(function readtable() {
      $.ajax({
         url : "certLectRead",
         type : "POST",
         datatype : "json",
         //받아오는 데이터타입
         success : function(obj) {
            console.log(JSON.stringify(obj));
            jaatable = obj.lectJson; //DB json 불러오기
            tablehtml = obj.lectHtml; //DB html 불러오기
            console.log(jaatable);
            console.log(tablehtml);
            if(jaatable === undefined && tablehtml === undefined){ //두개다 널일시
               //alert("노데이트");
               dataable = false;
               nodata(); //초기화테이블 생성
               tableresize(); //테이블 리사이즈 생성
            } else{
               //alert("노데이트 아님"); //값이 있을때
               $('#edittable2').html(tablehtml); //테이블 html로 값을 그림
               tableresize();
               tableresizedis();
               addrowLect(); //addrow
            }
            
            // Example of jQuery UI datePicker
            /* $("#edittable2").on("focusin", "td:nth-child(3) input", function() {
               $(this).datepicker();
            }); */
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
                        }
                     },
                     row_template : [ 'textarea', 'textarea', 'textarea','textarea', 'textarea' ],
                    /*  headerCols : [ '区分', '年/学期', '科目', '評点', '備考' ], */
                     first_row : false
                  });
      /* 
      // Example of jQuery UI datePicker
      $("#edittable2").on("focusin", "td:nth-child(3) input", function() {
         $(this).datepicker();
      });
       */
      
   }; //end edittable function
    //저장버튼 클릭
   $(document).ready(function() {
      $("#complete").click(function() {
         //테이블리사이즈 디스트로이
         tableresize();
         tableresizedis();

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
         if(datatable != "[]"){
              var json = JSON.parse(datatable);
              var cnt = 0;
               for(var i=0; i<json.length; i++){
                  for(var j=0; j<json[i].length; j++){
                     $(".inputtable .hi2td:eq("+cnt+")").html("<input type='text' value='"+json[i][j]+"'>");
                     cnt++;
                  }
                  
               }
           }
         console.log(datatable);
         
         $('input[type="text"]').attr("readonly", true);
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
            url : "certLectWrite",
            type : "POST",
            data : {
               tablehtml : tablehtml,
               datatable : datatable
            },
            success : function() {
               //alert('저장됨');
            },
            error : function(e) {
               alert(JSON.stringify(e));
            }
         });

      });
   });

   //수정버튼 클릭
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

</script>
<style type="text/css">
.btndiv{
    width: 300px;
    margin: auto;
    margin-top: 90px;
}
.back{
		 background-color: rgb(64,64,64);
	}
.addcolth{
	color: red;
	}
#updatetoggle{
 float: left;
 margin-right: 10px;
}	
#edittable2{
	width: 80%;
    margin: auto;
    margin-top: 100px;
}

</style>

</head>
<body class="back">
<div class="bg-image-blur" style="">
	<img src="/h5/resources/img/subject.png" style="width: 100%;">
<div id="edittable2"></div>

<div class="btndiv">
   <button id="updatetoggle" class="button_2 btn-xl">修正</button>
   <button id="complete" class="button_2 btn-xl">セーブ</button>
</div>   

<section>
		<!-- Navigation -->
		<%@include file="/WEB-INF/views/footer-text-white.jsp"%>
	</section>
	
	<script
		src="${pageContext.request.contextPath}/resources/table/js/test3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/table/js/jquery-ui.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/table/js/wiget_table.js"></script>
</body>
</html>