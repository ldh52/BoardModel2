package com.test.model2board;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
        BoardService service = new BoardService(request, response);
        String viewPath = new BoardService(request, response).process();
        
        if(viewPath != null) {
            getServletContext().getRequestDispatcher(viewPath).forward(request, response);
        }
    }
}
