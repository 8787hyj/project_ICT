

//비밀번호 찾기
$(document).ready(function() {
	$('#passCheckbtn').on('click', function() {
		var name = $('#name').val();
		var memberid = $('#memberid').val();
		var email = $('#email').val();
		var url = location.href;
		
		console.log(name+"/"+memberid+"/"+email);
		
		// 이름 값 있음
		if(name != ''){
			// 아이디 값 없음
			if (memberid == ''){ 
					alert("아이디를 입력해주세요");
			// 아이디 값 있음
			} else {
				// 이메일 값 없음
				if (email == ''){
					alert("이메일을 입력해주세요");
				// 이메일 값 있음	
				} else {
					var data = {
							name : name,
							memberid : memberid,
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
							}else if($.trim(data) == 'CheckEmail'){
								alert("입력정보를 확인 해주세요.");	
							}else {
								$('#pass_value').text("비밀번호는 " + data+ "입니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request);
							/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
							console.log("code" + request.status + "error" + error);
							alert("입력값을 확인 해주세요.");
						}
					}); //end ajax 
					
				}
			}	
		// 이름 값 없음	
		} else{
			alert("이름을 입력해주세요.");
		}
	}); //end on
});