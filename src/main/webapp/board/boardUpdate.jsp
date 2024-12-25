<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.test.model2board.Board"%>
<jsp:useBean id="dao" class="com.test.model2board.BoardDAO"/>
<%
    int bnum = Integer.parseInt(request.getParameter("bnum"));
    Board board = dao.getBoard(bnum);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function updateBoard() {
            var bnum = document.querySelector('input[name="bnum"]').value;
            var title = document.querySelector('input[name="title"]').value;
            var contents = document.querySelector('textarea[name="content"]').value;
            
            $.ajax({
                url: 'board',
                method: 'POST',
                data: {
                    cmd: 'update',
                    bnum: bnum,
                    title: title,
                    contents: contents
                },
                dataType: 'json',
                success: function(res) {
                    if (res.updated) {
                        alert('게시글이 성공적으로 수정되었습니다.');
                        window.location.href = 'board?cmd=list';
                    } else {
                        alert('게시글 수정에 실패했습니다.');
                    }
                },
                error: function(xhr, status, err) {
                    alert('에러 발생: ' + err);
                }
            });
            return false;
        }
    </script>
</head>
<body>
    <h3>게시글 수정</h3>
    <form action="updateProc.jsp" method="post" onsubmit="return updateBoard();">
        <input type="hidden" name="bnum" value="<%= board.getBnum() %>">
        
        <div>
            <label for="title">제목</label>
            <input type="text" id="title" name="title" value="<%= board.getTitle() %>" required>
        </div>
        
        <div>
            <label for="content">내용</label>
            <textarea id="content" name="content" rows="10" cols="50" required><%= board.getContents() %></textarea>
        </div>
        
        <div>
            <button type="submit">수정</button>
        </div>
    </form>
</body>
</html>
