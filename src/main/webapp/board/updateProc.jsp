<%@page import="com.test.model2board.BoardDAO"%>
<%@page import="com.test.model2board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.test.model2board.BoardDAO"/>
<%
    int bnum = Integer.parseInt(request.getParameter("bnum"));
    String title = request.getParameter("title");
    String contents = request.getParameter("content");
    
    Board board = dao.getBoard(bnum);
    board.setTitle(title);
    board.setContents(contents);
    
    boolean updated = dao.updateBoard(board);
    
    if (updated) {
        response.sendRedirect("boardDetail.jsp?bnum=" + bnum);
    } else {
        out.println("<script>alert('업데이트 실패'); history.back();</script>");
    }
%>
{"updated":<%=updated %>}