<%@page import="com.test.model2board.BoardDAO"%>
<%@page import="com.test.model2board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.test.model2board.BoardDAO"/>
<%
    int bnum = Integer.parseInt(request.getParameter("bnum"));
    
    boolean deleted = dao.deleteBoard(bnum);
    
    if (deleted) {
        response.sendRedirect("boardList.jsp"); // 삭제 후 목록으로 이동
    } else {
        out.println("<script>alert('삭제 실패'); history.back();</script>");
    }
%>
{"deleted":<%=deleted %>}
