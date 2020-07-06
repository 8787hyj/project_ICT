

/*제목과 내용 공백 확인 및 내용 글자수 200자 제한*/
$(function() {
      $('#submit').click(function() {
    	  theForm = document.frm1;  
    	  if(theForm.title.value=="" || theForm.content.value==""){
    	          alert("필수 입력란이 비었습니다. 확인해 주세요.");
    	          return false;
    	      }else{
    	         /* alert("필수 입력란을 모두 입력하셨습니다."); */
    	         return true;
    	      }
      });
   });
   
   $(function() {
	      $('#boardContent').keyup(function (e){
	          var boardContent = $(this).val();
	          $(this).height(((boardContent.split('\n').length + 1) * 1.5) + 'em');
	          $('#counter').html(boardContent.length + '/200');
	      });
	      $('#boardContent').keyup();
  });
   
   
function chkword(obj, maxByte) {
		
		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar = "";
	var str2 = "";

	for (var i = 0; i < strLen; i++) {
		oneChar = strValue.charAt(i);
		if (escape(oneChar).length > 4) {
			totalByte += 1;
		} else {
			totalByte++;
		}

		// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
		if (totalByte <= maxByte) {
			len = i + 1;
		}
	}

	// 넘어가는 글자는 자른다.
	if (totalByte > maxByte) {
		alert(maxByte + "자를 초과 입력 할 수 없습니다.");
		str2 = strValue.substr(0, len);
		obj.value = str2;
		chkword(obj, 4000);
	}
}