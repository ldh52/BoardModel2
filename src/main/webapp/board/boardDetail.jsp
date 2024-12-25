<%@page import="com.test.join.User"%>
<%@page import="com.test.model2board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="dao" class="com.test.model2board.BoardDAO"/>

<%
   int bnum = Integer.parseInt(request.getParameter("bnum"));
   Board b = dao.getBoard(bnum); 
   pageContext.setAttribute("b", b);
   /* User u = new User();
   pageContext.setAttribute("user", u);
   pageContext.setAttribute("today", new Date());*/
%>
<c:set var="today" value="<%=b.getRdate()%>" scope="page"/>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
    function deleteBoard(bnum) {
        if(!confirm('삭제하시겠습니까?')) return;

        $.ajax({
            url: 'board',
            method: 'POST',
            data: {
                cmd: 'delete',
                bnum: bnum
            },
            dataType: 'json',
            success: function(res) {
                if (res.deleted) {
                    alert('게시글이 성공적으로 삭제되었습니다.');
                    window.location.href = 'board?cmd=list';
                } else {
                    alert('게시글 삭제에 실패했습니다.');
                }
            },
            error: function(xhr, status, err) {
                alert('에러 발생: ' + err);
            }
        });
        return false;
    }
</script>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style type="text/css">
main { width:fit-content; margin:0.5em auto; }
main>h3 { width:fit-content; margin:0.2em auto; border-bottom:3px double black;}
table { border-spacing: 0; border-collapse: collapse; border:1px solid black;}
th {background-color:#eef; text-align:right; border-right:3px double black;}
th,td { padding:0.2em 0.5em; border-bottom:1px dashed black; }
tr:last-child>td { width:20em; height:5em; overflow: auto;}
</style>
</head>
<body>
<main>
   <h3>게시글 상세보기</h3>
   <table>
      <tr><th>번호</th><td>${b.bnum}</td></tr>
      <tr><th>제목</th><td>${b.title}</td></tr>
      <tr><th>작성자</th><td>${b.author}</td></tr>
      <fmt:formatDate var="today2" value="${today}" pattern="yyyy-MM-dd HH:mm:ss"/>
      <tr><th>작성일</th><td>${today2}</td></tr>
      <tr><th>조회수</th><td>${b.hit}</td></tr>
      <tr><th>내용</th><td>${b.contents}</td></tr>
      
   </table>
   <a href="board?cmd=updateForm&bnum=<%= b.getBnum() %>">수정</a>
   <button onclick="deleteBoard(<%= b.getBnum() %>)">삭제</button>
   
   
</main>
</body>
</html>