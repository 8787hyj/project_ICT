
	/* 핸드폰 번호 업데이트 */
		function changePhone() {
			var phone = $('#newPhoneNum').val();
			var regExp = /[0-9]/; 	
			if(phone.length < 1){
				alert('전화번호를 입력해주세요.');
				return false;
			}
			if(!regExp.test(phone)){
				alert('형식에 알맞게 입력해주세요. ex) 01012345678');
				return false;
			}
			$.ajax({
				url : "update",
				type : "post",
				data : {
					phone : phone
				},
				success : function(result) {
					if ($.trim(result) == 'success') {
						alert("변경되었습니다.")
						location.reload();
					}
				},
				error : function(request, status, error) {
					console.log(request);
					console.log("code" + request.status + "error" + error);
					alert("입력값을 확인 해주세요.");
				}
			});// end ajax
		}// end functiom

		
		
		/* 주소 업데이트 */
		function changeAddress() {
			var address = $('#newAddress').val();
			if(address.length < 1){
				alert('주소를 입력해주세요.');
				return false;
			}
			$.ajax({
				url : "update",
				type : "post",
				data : {
					address : address
				},
				success : function(result) {
					if ($.trim(result) == 'success') {
						alert("변경되었습니다.")
						location.reload();
					}
				},
				error : function(request, status, error) {
					console.log(request);
					console.log("code" + request.status + "error" + error);
					alert("입력값을 확인 해주세요.");
				}
			});// end ajax
		}// end functiom

		/* 이메일 업데이트 */
		function changeEmail() {
			var email = $('#newEmail').val();
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(email.length < 1){
				alert('이메일을 입력해주세요.');
				return false;
			}
			if(!regExp.test(email)){
				alert('형식에 알맞게 입력해주세요. ex) epbooksg@email.com');
				return false;
			}
			$.ajax({
				url : "update",
				type : "post",
				data : {
					email : email
				},
				success : function(result) {
					if ($.trim(result) == 'success') {
						alert("변경되었습니다.")
						location.reload();
					}
				},
				error : function(request, status, error) {
					console.log(request);
					console.log("code" + request.status + "error" + error);
					alert("입력값을 확인 해주세요.");
				}
			});// end ajax
		}// end functiom
	
		/* 이름 */
		jQuery('#memberName').click(function() {
			jQuery('#memberName').css("display", "none"); /* 변경하기 버튼을 클릭하면 변경하기 버튼도 같이 숨김 */
			if ($("#memberNameMenu").css("display") == "none") {
				jQuery('#memberNameMenu').css("display", "block");
				jQuery('#memberNameMenuShow').css("display", "none");
			} else {
				jQuery('#memberNameMenu').css("display", "none");
				jQuery('#memberNameMenuShow').css("display", "block");

			}
		});

		/* 이름취소버튼 */
		jQuery('#showNameButton').click(function() {
			jQuery('#memberName').css("display", "block");
			jQuery('#memberNameMenuShow').css("display", "block");
			jQuery('#memberNameMenu').css("display", "none");
		});

		/* 이메일 */
		jQuery('#memberEamil').click(function() {
			jQuery('#memberEamil').css("display", "none");
			if ($("#memberEamilMenu").css("display") == "none") {
				jQuery('#memberEamilMenu').css("display", "block");
				jQuery('#memberEamilMenuShow').css("display", "none");
			} else {
				jQuery('#memberEamilMenu').css("display", "none");
				jQuery('#memberEamilMenuShow').css("display", "block");

			}
		});

		/* 이메일 취소버튼 */
		jQuery('#showEmailButton').click(function() {
			jQuery('#memberEamil').css("display", "block");
			jQuery('#memberEamilMenuShow').css("display", "block");
			jQuery('#memberEamilMenu').css("display", "none");
		});

		/* 주소 */
		jQuery('#memberAdderss').click(function() {
			jQuery('#memberAdderss').css("display", "none");
			if ($("#memberAdderssMenu").css("display") == "none") {
				jQuery('#memberAdderssMenu').css("display", "block");
				jQuery('#memberAdderssMenuShow').css("display", "none");
			} else {
				jQuery('#memberAdderssMenu').css("display", "none");
				jQuery('#memberAdderssMenuShow').css("display", "block");
			}
		});

		/* 주소 취소버튼 */
		jQuery('#showAddressButton').click(function() {
			jQuery('#memberAdderss').css("display", "block");
			jQuery('#memberAdderssMenuShow').css("display", "block");
			jQuery('#memberAdderssMenu').css("display", "none");
		});

		/* 휴대전화 */
		jQuery('#memberPhone').click(function() {
			jQuery('#memberPhone').css("display", "none");
			if ($("#memberPhoneMenu").css("display") == "none") {
				jQuery('#memberPhoneMenu').css("display", "block");
				jQuery('#memberPhoneMenuShow').css("display", "none");
			} else {
				jQuery('#memberPhoneMenu').css("display", "none");
				jQuery('#memberPhoneMenuShow').css("display", "block");
			}
		});

		/* 휴대전화 취소버튼 */
		jQuery('#showPhoneButton').click(function() {
			jQuery('#memberPhone').css("display", "block");
			jQuery('#memberPhoneMenuShow').css("display", "block");
			jQuery('#memberPhoneMenu').css("display", "none");
		});

		/* 개인정보 유효기간 */
		jQuery('#memberPrivate').click(function() {
			jQuery('#memberPrivate').css("display", "none");
			if ($("#memberPrivateMenu").css("display") == "none") {
				jQuery('#memberPrivateMenu').css("display", "block");
				jQuery('#memberPrivateMenuShow').css("display", "none");
			} else {
				jQuery('#memberPrivateMenu').css("display", "none");
				jQuery('#memberPrivateMenuShow').css("display", "block");
			}
		});

		/* 개인정보 유효기간  취소버튼 */
		jQuery('#showPrivateButton').click(function() {
			jQuery('#memberPrivate').css("display", "block");
			jQuery('#memberPrivateMenuShow').css("display", "block");
			jQuery('#memberPrivateMenu').css("display", "none");
		});