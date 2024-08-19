# 모델1 게시판 프로젝트 -> 모델2(BoardModel2) 변환
- JSP에서 EL, JSTL 사용<br>
- Servlet 추가<br>
- Service 추가<br>
- JSP 고쳐서 사용<br>
- DAO 그대로 사용<br>
- VO 그대로 사용<br>
- BoardModel2_CodeList 참조<br>



# 모델2(Model2BookCart) : BookServlet, BookService, BookDAO, Book, BookCart
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

