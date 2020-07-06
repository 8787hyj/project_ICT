

/* 아이디 찾기 */
$(document).ready(function() {
	$('#idCheckbtn').on('click', function() {
		var name = $('#name').val();
		var email = $('#email').val();
		/* var url = 'http://localhost:8080/www/user/IduserSearch'; */
		var url = location.href;
		
		console.log(name);
		console.log(email);
		/* console.log(url); */
		
		//이름 값 있음
		if(name != ''){ 
			//이메일 값 없음
			if (email == ''){ 
				alert("이메일을 입력해주세요");
			//이메일 값 있음	
			} else { 
				var data = {
						name : name,
						email : email
					};
				$.ajax({
					type : 'POST',
					url : url,
					data : data,
					success : function(data) {
						console.log("data: ", data);
						if ($.trim(data) == 'NonMember') {
							alert("가입되지 않은 회원 입니다.");
						}else if($.trim(data) == 'CheckName'){
							alert("입력정보를 확인 해주세요.");
						}else {
							$('#id_value').text("아이디는 " + data+ "입니다.");
						}
					},
					error : function(error){
						alert("error : " + error);
			       	}	
				}); //end ajax 
			}
		//이름 값 없음	
		} else { 
			alert("이름을 입력해주세요.");
		}  
	}); //end $('#idCheckbtn').on('click', function()
}); // end $(document).ready(function()