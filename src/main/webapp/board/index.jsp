<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model 2 게시판</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">		
function logout() {
	   $.ajax({
	      url: 'logout.jsp', // logout.jsp로 요청을 보냄
	      method: 'get',
	      cache: false,
	      dataType: 'json',
	      success:function(res){
	         alert(res.logout ? '로그아웃 성공':'로그아웃 실패');
	         if(res.logout) {
	            <%--window.location.href = "../join/loginForm.jsp"; // 로그아웃 후 로그인 페이지로 이동--%>
	            location.href = "index.jsp";
	         }
	      },
	      error:function(xhr,status,err){
	         alert('에러:' + err);
	      }
	   });
	}
</script>
</head>
<h3>JSP개발방법론 Model 2을 사용한 게시판 프로젝트</h3>
<body>
	<li><a href="board?cmd=loginForm">로그인</a></li>
	<li><a href="board?cmd=list">게시글 목록</a>
	<li><a href="board?cmd=addForm">게시글 입력</a>
	<li><a href="javascript:logout();">로그아웃</a>
</body>
</html>