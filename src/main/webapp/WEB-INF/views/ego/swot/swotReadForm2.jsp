<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jquery 가져오기 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- slide toggle -->
<script>

$(document).ready(function(){
   if ($("#swot1").text() || $("#swot2").text() || $("#swot3").text() || $("#swot4").text()) {
      for (var i = 1; i < 5; i++) {
         if ($("#swot" + i).text()) {
             $("#flip" + i).show();
             $("#panel" + i).slideToggle("slow");
         }
         else if(!$("#swot" + i).text()){
            $("#flip" + i).hide();
            $("#panel" + i).hide();
         }
      }
      
      $("#toggle").hide();
   }
   else{
      console.log("전부 비어있는값입니다.");
      $("#swottable").hide();
      $("#toggle").show();
   }
});

   $(document).ready(function() {
      $("#panel1").hide();
      $("#flip1").click(function() {
         $("#panel1").slideToggle("slow");
      });
   });

   $(document).ready(function() {
      $("#panel2").hide();
      $("#flip2").click(function() {
         $("#panel2").slideToggle("slow");
      });
   });

   $(document).ready(function() {
      $("#panel3").hide();
      $("#flip3").click(function() {
         $("#panel3").slideToggle("slow");
      });
   });

   $(document).ready(function() {
      $("#panel4").hide();
      $("#flip4").click(function() {
         $("#panel4").slideToggle("slow");
      });
   });
</script>

<script type="text/javascript">
function writeForm(){
	
	
 /* 	$(document).ready(function(){
		  $("#button_1").on("click", function(){
		    window.open("swotWriteForm", "swot_Write", "top=150,left=150,width=1000,height=300");
		    $("#swotWrite").submit();
		  });
		}); */ 
 	
/* var form_in = window.open("swotWriteForm","writeForm","top=150,left=150,width=1000,height=300");
var frm = document.swotWrite;
	
form_in.onload=function(){
		
		form_in.submit();
	}
	
	
   	frm.action="swotWrite";
   	frm.target="swotWrite";
   	frm.method="post";
   	frm.submit(); */
	window.open("swotWriteForm","writeForm","top=150,left=150,width=1000,height=300");
   	
}


function editForm(){
	   window.open("swotUpdateForm","UpdateForm","top=150,left=150,width=1000,height=300");
	}
	
function deleteForm(loginId){
	location.href="deleteswot";
	
}	
</script>

<title>자아분석 - SWOT READ PAGE</title>

<!-- 임시 테이블 css -->
<style type="text/css">
.divTable {
   display: table;
   width: 100%;
}

.divTableRow {
   display: table-row;
}

.divTableHeading {
   background-color: #EEE;
   display: table-header-group;
}

.divTableCell, .divTableHead {
   border: 1px solid #999999;
   display: table-cell;
   padding: 3px 10px;
}

.divTableHeading {
   background-color: #EEE;
   display: table-header-group;
   font-weight: bold;
}

.divTableFoot {
   background-color: #EEE;
   display: table-footer-group;
   font-weight: bold;
}

.divTableBody {
   display: table-row-group;
}

  #toggle {
    width: 1000px;
    height: 1000px;
    background: #ccc;
  }
</style>

</head>
<body>
   <h1>스왓분석페이지</h1>
   <!-- 테이블 -->
   <div class="divTable">
      <div class="divTableBody">
         <div class="divTableRow">
            <div class="divTableCell">S</div>
            <div class="divTableCell">S설명</div>
         </div>
         <div class="divTableRow">
            <div class="divTableCell">W</div>
            <div class="divTableCell">W설명</div>
         </div>
         <div class="divTableRow">
            <div class="divTableCell">O</div>
            <div class="divTableCell">O설명</div>
         </div>
         <div class="divTableRow">
            <div class="divTableCell">T</div>
            <div class="divTableCell">T설명</div>
         </div>
      </div>
   </div>
   <p></p>
   ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   <p></p>

   <!-- 스왓분석 작성란 -->
   
   <div class="divTable" id="swottable">
      <div class="divTableBody">
      
         <div class="divTableRow" id="flip1">
            <div class="divTableCell">S 강점</div>
         </div>
         <div class="divTableRow" id="panel1">
         
            <div class="divTableCell" id=swot1>${swotlist.swotS}</div>
        
         
          
         </div>
         <div class="divTableRow" id="flip2">
            <div class="divTableCell">W 약점</div>
         </div>
         <div class="divTableRow" id="panel2">
            <div class="divTableCell" id=swot2>${swotlist.swotW}</div>
             
              
         </div>
         <div class="divTableRow" id="flip3">
            <div class="divTableCell">O 기회</div>
         </div>
         <div class="divTableRow" id="panel3">
            <div class="divTableCell" id=swot3>${swotlist.swotO}</div>
            
             
         </div>
         <div class="divTableRow" id="flip4">
            <div class="divTableCell">T 위협</div>
         </div>
         <div class="divTableRow" id="panel4">
            <div class="divTableCell" id=swot4>${swotlist.swotT}</div>
             
            
         </div>
      </div>
   </div>
 
   
   <!-- 공백시 쓰기버튼 -->
  	<c:if test="${sessionScope.swotlist == null}">
  	  <input type="button" id="button_1" value="입력하기" onclick="writeForm()">
  	</c:if> 
  	<c:if test="${sessionScope.swotlist != null}">
     <input type="button" id="button_2" value="수정하기" onclick="editForm()">
  	  <input type="button" id="button_3" value="삭제하기" onclick="deleteForm()">
      </c:if>


</body>
</html>