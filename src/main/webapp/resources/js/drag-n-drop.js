/**
 * 		Draggable & Droppable
 * 		2018-04-27
 * 		Made By H5_Palette
 */

function nodata() {
	var strong_cnt = 0;	//들어간 장점 갯수
	var weak_cnt = 0;	//들어간 단점 갯수
	
	//성격리스트에 드래그이벤트 생성
	$('.drag_word').draggable({
		revert: "invalid",
		helper: "clone",
		cursor: "move"
	});
	
	//장점div영역에 드롭이벤트 생성
	$('.drop_strongword').droppable({
		drop : function( event, ui ) {
			var word = ui.draggable.text();		//드래그 된 text값 변수에 담기
			if(strong_cnt >= 3){
				alert('장점은 3개까지만 가능합니다');
				return;
			}
			
			//중복단어검사
			for(var i=0; i<strong_cnt; i++){
				var txt = $('#strong'+i).text();
				if(txt == word){
					alert("중복 불가능");
					return;
				}
			}
			
			//div에 text추가
			$(this).append("<span class='in_strongword' id='strong"+strong_cnt+"' value='"+strong_cnt+"'>"+word+"</span> ");
			
			//추가된 단어 클릭시 단어에 대한 편집영역 보이기,또는 숨기기
			$('.in_strongword').off('click').on('click', function() {
				
				var v = $(this).attr('value');
				var display = $('#strong_detail'+v).css('display');
				if(display == 'none'){
					$('.strong_detail').css('display', 'none');
					$('#strong_detail'+v).css('display', 'block');
				}
				else if(display == 'block'){
					$('#strong_detail'+v).css('display', 'none');
				}
			});
			strong_cnt++;	//장점갯수 +
		}
	});
	
	//단점div영역에 드롭이벤트 생성
	$('.drop_weakword').droppable({
		drop : function( event, ui ) {
			var word = ui.draggable.text();
			if(weak_cnt >= 3){
				alert('단점은 3개까지만 가능합니다');
				return;
			}
			
			//중복단어검사
			for(var i=0; i<weak_cnt; i++){
				var txt = $('#weak'+i).text();
				if(txt == word){
					alert("중복불가능");
					return;
				}
			}
			
			//div에 text추가
			$(this).append("<span class='in_weakword' id='weak"+weak_cnt+"' value='"+weak_cnt+"'>"+word+"</span> ");
			
			//추가된 단어 클릭시 단어에 대한 편집영역 보이기,또는 숨기기
			$('.in_weakword').off('click').on('click', function() {
				var v = $(this).attr('value');
				var display = $('#weak_detail'+v).css('display');
				if(display == 'none'){
					$('.weak_detail').css('display', 'none');
					$('#weak_detail'+v).css('display', 'block');
				}
				else if(display == 'block'){
					$('#weak_detail'+v).css('display', 'none');
				}
			});
			
			weak_cnt++; //단점갯수 +
		}
	});
	
	$('#saveBtn').on('click', function() {
		for(var i=0; i<strong_cnt; i++){
			var s = $('#strong'+i).text();
			var sc = $('#strong_detail'+i).text();
			$('#s'+i).val(s);
			$('#sContent'+i).val(sc);
		}
		for(var j=0; j<weak_cnt; j++){
			var w = $('#weak'+j).text();
			var wc = $('#weak_detail'+j).text();
			$('#w'+j).val(w);
			$('#wContent'+j).val(wc);
		}
		$('#personalityForm').submit();
	});
	
}//nodata

