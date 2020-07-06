
$(document).ready(function() {
	// 최상단 체크박스 클릭
	$("#checkall").click(function() {
		// 클릭되었으면
		if ($("#checkall").prop("checked")) {
			// input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			$("input[name=chk]").prop("checked", true);
			// 클릭이 안되있으면
		} else {
			// input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
			$("input[name=chk]").prop("checked", false);
		}
	})
})

/* 결제 페이지로 넘기기 */

$(function() {
	$("#order").click(function(event) {
		/* 체크박스 값 확인 */
		var orderCount = new Array();
		var amount = new Array();
		var temp;

		console.log(amount);
		$('input:checkbox[name=chk]').each(function() {
			if ($(this).is(':checked')) {
				temp = ($(this).val());
				console.log(temp)
				orderCount.push(temp);
			}

		});

		$('.amount').each(function() {
			if ($('input:checkbox[name=chk]').is(':checked')) {
				temp = ($(this).val());
				console.log(temp)
				amount.push(temp);
			}
		});

		var sJson = {
			'orderCount' : orderCount
		};
		var result = encodeURI((JSON.stringify(sJson)));
		location.href = "/www/order/fromcart?result=" + result;
	});
});

$(function() {
	$(".cart-change-ajax").click(function(event) {
		event.preventDefault();
		var numCheck = RegExp(/[^a-zA-Z]$/);
		var negnumCgeck = RegExp(/[^1-9]/g);
		var amount = $(this).closest('div').children().first().val();
		var isbn = $(this).closest('tr').children(".isbn").first().text();
		if (!numCheck.test(amount)) {
			alert("숫자만 입력하세요.");
			return;
		}
		if (negnumCgeck.test(amount)) {
			alert("0보다 큰 수를 입력하세요.");
			location.reload();
			return;
		}

		$.ajax({
			url : "cart/update",
			type : "post",
			dataType : "text",
			data : {
				amount : amount,
				isbn : isbn
			},
			success : function(result) {
				console.log(">>>>>>>>>>>>>>>>", result);
				if ($.trim(result) == 'success') {
					alert("수량을 변경했습니다.");
					location.reload();
				}
			},
			error : function(request, status, error) {
				console.log(request);
				alert("입력값을 확인 해주세요.");
			}
		});
	});

});

$(function() {
	$(".deleteCart").click(function(event) {
		event.preventDefault();
		var isbn = $(this).val();
		console.log(isbn);

		if (confirm("정말 삭제하시겠습니까?")) {

			$.ajax({
				url : "cart/cartdel/" + isbn,
				type : "post",
				data : {
					isbn : isbn
				},
				success : function(result) {
					if ($.trim(result) == 'success') {
						alert("삭제 했습니다.")
						location.reload();
					}
				},
				error : function(request, status, error) {
					console.log(request);
					alert("입력값을 확인 해주세요.");
				}

			});

		}
	});
});
