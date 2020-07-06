$(function() {
			$(".delete").click(function(event) {
				var password = $(".set-password").val();
				console.log(password + "password");
	
					$.ajax({
						url : "deleteMemberCheckInfo",
						type : "post",
						data : {
							password : password
						},
						success : function(result) {
							if ($.trim(result) == 'success') {
								alert("이용해 주셔서 감사합니다.")
								location.href = "/www";
								/* location.reload(); */
							} 
						},
						error : function(request, status, error) {
							console.log(request);
							console.log("code" + request.status + "error" + error);
							alert("잠시후 다시 시도해주세요");
						}

					});

				/* } */
			});
		});