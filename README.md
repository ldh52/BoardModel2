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
<br>

# 모델 2 : BookServlet, BookService, BookDAO, Book, BookCart
+ JSP는 View 역할만 하도록(비즈니스 로직은 모두 SVC 레이어에 포함)<br>
+ cmd 파라미터 방식이 아닌, 요청 URI를 분석하여 서버 로직이 분기되도록 한다.<br>
+ json-simple 라이브러리를 사용하여 JSON 생성/응답<br>
+ Model2BookCart 프로젝트 생성<br>
+ 서블릿 이름으로 끝나는 요청인 경우에는 bookindex.jsp가 표시되도록 한다.<br>


* uri에서 요청을 인식하는 예(http://localhost/Myproject/book/detail/3)<br>
* String uri= request.getRequestURI();<br><br>

String[] token = uri.split("/"); // [, Myproject, book, detail, 3]<br><br>

int len = token.length;<br>
path = Arrays.copyofRange(token, 3, len); // [detail, 3]<br>

# RESTful
+ URI, (GET, POST, PUT, DELETE)<br>
+ GET : 서버 -> 클라이언트 가져오기 위한 요청(서버로 전달하는 데이터량은 상대적으로 적다)<br>
+ POST : 클라이언트 -> 서버로 데이터를 보내기 위한 요청(서버로 양이 많은 데이터가 전달)<br>
+ PUT : Update<br>
+ DELETE : Delete<br>
+ Create(POST), Read(GET), Update(PUT), Delete(DELETE)

