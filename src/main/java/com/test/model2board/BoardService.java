package com.test.model2board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.simple.JSONObject;

import com.test.join.User;
import com.test.join.UserDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BoardService {

	private HttpServletRequest request;
    private HttpServletResponse response;
    private BoardDAO boardDAO;
    private UserDAO userDAO;

    public BoardService() {}
    
    public BoardService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.boardDAO = new BoardDAO();
        this.userDAO = new UserDAO();
    }
    
    public String process() {
        String cmd = request.getParameter("cmd");
        String viewPath = null;

        if (cmd == null) {
            return "/board/index.jsp";
        }
        
        switch (cmd) {
        case "loginForm":
        	viewPath = "/join/loginForm.jsp";
            break;
        case "login":
        	handleLogin(); 	
            break;
        case "list":
            
            listBoards();
            viewPath = "/board/boardList.jsp";
            break;
        case "view":
            
            viewBoard();
            viewPath = "/board/boardDetail.jsp";
            break;
        case "addForm":
        	
            viewPath = "/board/boardaddForm.jsp";
            break;
        case "add":
        	handleBoardAdd();
            break;
        case "updateForm":
        	showUpdateForm();
            viewPath = "/board/boardUpdate.jsp";
            break;
        case "update":
        	handleBoardUpdate();
            break;
        case "delete":
            handleBoardDelete();
            break;
        default:
        	viewPath = "/board/index.jsp";
            break;
    }
        
		return viewPath;
    }
    
    private void listBoards() {
        List<Board> boardList = boardDAO.getBoardList();
        request.setAttribute("boardList", boardList);
    }
    
    private void viewBoard() {
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        Board board = boardDAO.getBoard(bnum);
        request.setAttribute("board", board);
    }
    
    private void showEditForm() {
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        Board board = boardDAO.getBoard(bnum);
        request.setAttribute("board", board);
    }
    
   
    
    private Board getBoardFromRequest() {
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        String title = request.getParameter("title");
        String contents = request.getParameter("contents");

        Board board = new Board();
        board.setBnum(bnum);
        board.setTitle(title);
        board.setContents(contents);

        return board;
    }

    private void handleBoardDelete() {
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        boolean deleted = boardDAO.deleteBoard(bnum);
        
        try {
            sendJsonResponse("deleted", deleted);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    private void handleLogin()  {
        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");

        User user = new User(uid, pwd);
        if (user != null) {  // 로그인 성공
            HttpSession session = request.getSession();
            session.setAttribute("uid", user.getUid());  // 세션에 uid 저장

            // 추가적으로 로그인 성공 처리
        } 
        boolean isAuthenticated = userDAO.login(user);

        // JSON 응답 생성
        JSONObject json = new JSONObject();
        json.put("ok", isAuthenticated);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(json.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void showUpdateForm() {
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        Board board = boardDAO.getBoard(bnum);
        request.setAttribute("board", board);
    }
    
    private void handleBoardUpdate() {
        int bnum = Integer.parseInt(request.getParameter("bnum"));
        String title = request.getParameter("title");
        String contents = request.getParameter("contents");

        Board board = new Board();
        board.setBnum(bnum);
        board.setTitle(title);
        board.setContents(contents);

        boolean updated = boardDAO.updateBoard(board);

        // JSON 응답 전송
        try {
			sendJsonResponse("updated", updated);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
    }
    
    private void handleBoardAdd()  {
        // 클라이언트로부터 전달된 요청 파라미터를 받아옵니다.
    	 String title = request.getParameter("title");
    	    String contents = request.getParameter("contents");

    	    // 세션에서 author 값을 가져옵니다.
    	    String author = (String) request.getSession().getAttribute("uid");
    	    System.out.println(author);

    	    // 현재 날짜를 설정합니다.
    	    java.util.Date uDate = new java.util.Date();
    	    java.sql.Date sDate = new java.sql.Date(uDate.getTime());

    	    // 새로운 Board 객체를 생성하고, 받아온 파라미터를 설정합니다.
    	    Board board = new Board();
    	    board.setTitle(title);
    	    board.setContents(contents);
    	    board.setAuthor(author);  // 세션에서 가져온 author를 설정합니다.
    	    board.setRdate(sDate);  // 현재 날짜를 설정합니다.
    	    System.out.println(sDate);


        // DAO를 통해 데이터베이스에 게시글을 추가하고, 그 결과로 게시글 번호를 반환받습니다.
        int bnum = boardDAO.addBoard(board);

        // 게시글이 성공적으로 추가되었는지 여부를 판단합니다.
        boolean added = bnum > 0;

        // JSON 응답을 작성하여 클라이언트로 전송합니다.
        try {
			sendJsonResponse("added", added);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void sendJsonResponse(String key, boolean value) throws IOException {
        JSONObject json = new JSONObject();
        json.put(key, value);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
}
