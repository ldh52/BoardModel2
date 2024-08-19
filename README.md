# 모델1 게시판 프로젝트 -> 모델2 변환
- JSP에서 EL, JSTL 사용<br>
- Servlet 추가<br>
- Service 추가<br>
- JSP 고쳐서 사용<br>
- DAO 그대로 사용<br>
- VO 그대로 사용<br>

# 모델2 게시판 Java, Servlet, JSP 코드 리스트
모델2 게시판 프로젝트를 구성하는 Java, Servlet, JSP 파일 목록과 각 파일의 간략한 설명입니다.<br>

## Java
+ Board.java: 게시글 정보를 담는 모델 클래스 (VO 또는 DTO)<br>
bnum, title, author, contents, rdate, hit 등의 필드와 getter/setter 메서드 포함<br>
+ BoardDAO.java: 게시글 관련 데이터베이스 작업을 처리하는 DAO 클래스<br>
getBoardList(), getBoard(), addBoard(), updateBoard(), deleteBoard() 등의 메서드 포함<br>
+ BoardService.java: 게시판 관련 비즈니스 로직을 처리하는 서비스 클래스<br>
process() 메서드: 사용자 요청에 따라 적절한 메서드 호출 및 결과 처리<br>
listBoards(), viewBoard(), handleBoardAdd(), handleBoardUpdate(), handleBoardDelete() 등의 메서드 포함<br>
+ User.java: 사용자 정보를 담는 모델 클래스 (VO 또는 DTO)<br>
uid, pwd 등의 필드와 getter/setter 메서드 포함<br>
+ UserDAO.java: 사용자 관련 데이터베이스 작업을 처리하는 DAO 클래스<br>
login(), checkDuplicate() 등의 메서드 포함<br>
+ FormProc.java: 회원가입 처리 로직을 담당하는 클래스<br>
saveForm() 메서드: 사용자 입력 데이터를 받아 데이터베이스에 저장<br>
+ MemberVO.java: 회원 정보를 담는 모델 클래스 (VO 또는 DTO)<br>
uid, pwd, gender, hobby, history, age, birth, intro 등의 필드와 getter/setter 메서드 포함<br>

## Servlet
+ BoardServlet.java: 모든 게시판 관련 요청을 처리하는 컨트롤러 서블릿<br>
service() 메서드: 사용자 요청을 받아 BoardService 객체 생성 및 process() 메서드 호출<br>
doGet(), doPost() 메서드: service() 메서드로 요청 전달<br>

## JSP 파일
+ /board/boardList.jsp: 게시글 목록을 표시하는 뷰 페이지<br>
boardList 속성을 사용하여 게시글 목록 출력<br>
+ /board/boardDetail.jsp: 특정 게시글의 상세 내용을 표시하는 뷰 페이지<br>
board 속성을 사용하여 게시글 정보 출력<br>
+ /board/boardAddForm.jsp: 새 게시글 작성 폼을 표시하는 뷰 페이지<br>
+ /board/boardUpdate.jsp: 게시글 수정 폼을 표시하는 뷰 페이지<br>
board 속성을 사용하여 기존 게시글 정보 출력<br>
+ /board/index.jsp: 게시판 메인 페이지 (홈 페이지)<br>
+ /join/loginForm.jsp: 로그인 폼을 표시하는 뷰 페이지<br>
+ addProc.jsp: 새 게시글 추가 처리를 담당하는 JSP 페이지<br>
board 객체를 사용하여 데이터베이스에 게시글 추가<br>
+ updateProc.jsp: 게시글 수정 처리를 담당하는 JSP 페이지<br>
board 객체를 사용하여 데이터베이스에 게시글 수정<br>
+ deleteProc.jsp: 게시글 삭제 처리를 담당하는 JSP 페이지<br>
bnum을 사용하여 데이터베이스에서 게시글 삭제<br>
+ checkDuplicate.jsp: 아이디 중복 확인 처리를 담당하는 JSP 페이지<br>
UserDAO를 사용하여 아이디 중복 여부 확인<br>
+ formProc.jsp: 회원가입 처리를 담당하는 JSP 페이지<br>
FormProc 객체를 사용하여 사용자 입력 데이터 처리 및 데이터베이스 저장<br>
+ loginProc.jsp: 로그인 처리를 담당하는 JSP 페이지<br>
User 객체와 UserDAO를 사용하여 로그인 처리<br>
+ logout.jsp: 로그아웃 처리를 담당하는 JSP 페이지<br>
세션 무효화<br>

# 모델 2 : BookServlet, BookService, BookDAO, Book, BookCart
+ JSP는 View 역할만 하도록(비즈니스 로직은 모두 SVC 레이어에 포함)<br>
+ cmd 파라미터 방식이 아닌, 요청 URI를 분석하여 서버 로직이 분기되도록 한다.<br>
+ json-simple 라이브러리를 사용하여 JSON 생성/응답<br>
+ Model2BookCart 프로젝트 생성<br>
+ 서블릿 이름으로 끝나는 요청인 경우에는 bookIndex.jsp가 표시되도록 한다.<br>
+ 요청 URI가 서블릿 이름으로 끝나면 bookIndex.jsp를 보여준다.<br>


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

