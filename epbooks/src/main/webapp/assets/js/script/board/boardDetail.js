
// 게시글 상세글보기
function del(boardNo) {
	var chk = confirm("정말 삭제하시겠습니까?");
	
	if (chk) {
		location.href = "delete?no=" + $boardDetail.boardNo;
	}
}	