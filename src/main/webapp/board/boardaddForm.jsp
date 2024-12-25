<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
function saveBoard() {
    if(!confirm('작성된 글을 저장하시겠어요?')) return;

    // 폼 데이터를 직렬화
    var ser = $('#addForm').serialize();
    
    $.ajax({
        url: 'board', // 변경된 URL
        method: 'post',
        cache: false,
        data: ser,
        dataType: 'json',
        success: function(res) {
            alert(res.added ? '저장 성공' : '저장 실패');
            if (res.added) {
                location.href = "board?cmd=list";
            }
        },
        error: function(xhr, status, err) {
            alert('에러: ' + err);
        }
    });
}
</script>
</head>
<body>
<main>
    <h3>게시글 작성</h3>
    <form id="addForm" method="post">
        <!-- 제목 입력 필드 -->
        <div>
        	<input type="hidden" name="cmd" value="add">
        </div>
        <div>
            <label for="title">제목</label>
            <input type="text" id="title" name="title" required>
        </div>
        
        <!-- 내용 입력 필드 -->
        <div>
            <label for="contents">내용</label>
            <textarea id="contents" name="contents" rows="10" cols="50" required></textarea>
        </div>
        
        <!-- 저장 버튼 -->
        <div>
            <button type="button" id="submitBtn" onclick="saveBoard()">저장</button>
        </div>
    </form>
</main>
</body>
</html>
