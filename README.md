# 모델1 게시판 프로젝트 -> 모델2 변환
- JSP에서 EL, JSTL 사용<br>
- Servlet 추가<br>
- Service 추가<br>
- JSP 고쳐서 사용<br>
- DAO 그대로 사용<br>
- VO 그대로 사용<br>

# Java 코드 (서블릿 및 서비스)

- BoardServlet.java: 게시판 관련 요청 처리 (목록, 상세보기, 추가, 수정, 삭제)
- BoardService.java: 게시판 관련 비즈니스 로직 처리
- BoardDAO.java: 게시판 관련 데이터베이스 작업 처리
- UserServlet.java: 사용자 관련 요청 처리 (로그인, 로그아웃, 회원가입, 프로필 수정, 회원 탈퇴)
- UserService.java: 사용자 관련 비즈니스 로직 처리
- UserDAO.java: 사용자 관련 데이터베이스 작업 처리
- Board.java: 게시글 정보를 담는 모델 클래스
- User.java: 사용자 정보를 담는 모델 클래스
- MemberVO.java: 회원 가입 폼 데이터를 담는 VO 클래스

# JSP 페이지 (View)
- index.jsp: 게시판 메인 페이지 (로그인, 회원가입, 게시글 목록, 게시글 입력 링크 포함)
- boardList.jsp: 게시글 목록 페이지
- boardDetail.jsp: 게시글 상세 페이지
- boardAddForm.jsp: 게시글 작성 페이지
- boardUpdate.jsp: 게시글 수정 페이지
- login.jsp: 로그인 페이지
- register.jsp: 회원가입 페이지
