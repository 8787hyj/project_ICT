
//비밀번호 변경
function check() {
	var form = document.getElementById("changePasswordForm");
    
    if (form.password1.value == '' && form.password2.value == '') {
    	alert("비밀번호는 공백 없이 입력해주세요.");
    	return false;
    } else if (form.password1.value != '' && form.password2.value != '') {
    	if (form.password1.value == form.password2.value) {
    		alert("비밀번호가 변경 되었습니다.");
            return true;   
    	} else {
    		alert("변경 비밀번호와 변경 비밀번호 확인 값이 같지 않습니다.");
            return false;
    	}
    } else if (form.password1.value != '' && form.password2.value != '') {
    	alert("변경 비밀번호 확인 을 입력해주세요.");
    	return false;
    } else {
        alert("변경 비밀번호 확인 을 입력해주세요.");
        return false;
    } 
}      