<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.test.model2board.BoardDAO"%>
<%@page import="com.test.model2board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<jsp:useBean id="board" class="com.test.model2board.Board"/>
<jsp:setProperty name="board" property="*"/>
<%
board.setAuthor((String)session.getAttribute("uid"));

    java.util.Date uDate = new java.util.Date();
    java.sql.Date sDate = new java.sql.Date(uDate.getTime());
    
    board.setRdate(sDate);
%>
<jsp:useBean id="dao" class="com.test.model2board.BoardDAO"/>
<%
    int bnum = dao.addBoard(board);
    boolean saved = bnum > 0;
    
    JSONObject jsobj = new JSONObject();
    jsobj.put("saved", saved);
    jsobj.put("bnum", bnum);
    out.print(jsobj.toJSONString());
    out.flush();
%>

<%--
    글번호, 제목, 작성자, 내용, 작성일, 히트수
 --%>
<%--{"saved": <%=saved%>, "bnum": <%=bnum %>}--%>
