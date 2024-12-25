<%@page import="com.test.model2board.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.test.model2board.BoardDAO"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	List<Board> boardList = dao.getBoardList();
%>
<c:set var="blist" value="<%=boardList%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>

   <h3>게시글 상세보기</h3>
   <table>
    <tr>
        <th>글 번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
<c:forEach var="blist" items="${blist}" varStatus="status">
    <tr>
        	<td class="bnum">${status.index + 1}</td><!--bnum으로 바꾸면 순서나옴-->
            <td class="title"><a href="board?cmd=view&bnum=${blist.bnum}">${blist.title}</a></td>
            <td>${blist.author}</td>
            <fmt:formatDate var="today" value="${blist.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            <td class="rdate">${today}</td>
            <td class="hit">${blist.hit}</td>
    </tr>
</c:forEach>
</table>
<li><a href="/BoardModel2/board">HOME</a>
</main>
</body>
</html>