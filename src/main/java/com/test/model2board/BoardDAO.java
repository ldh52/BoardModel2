package com.test.model2board;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Connection getConn() 
	{
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
	                "jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int addBoard(Board b) {
	    conn = getConn();
	    String sql = "INSERT INTO board1(bnum, title, author, contents, rdate, hit) "
	               + "VALUES(board1_num_seq.NEXTVAL, ?, ?, ?, ?, 0) "
	               + "RETURNING bnum INTO ?";
	    try {
	        CallableStatement cstmt = conn.prepareCall("{CALL " + sql + "}");
	        cstmt.setString(1, b.getTitle());
	        cstmt.setString(2, b.getAuthor());
	        cstmt.setString(3, b.getContents());
	        cstmt.setDate(4, b.getRdate());
	        cstmt.registerOutParameter(5, Types.INTEGER);

	        int rows = cstmt.executeUpdate();        
	        int bnum = cstmt.getInt(5);
	        return bnum;
	    } catch (SQLException sqle) {
	        sqle.printStackTrace();
	    } finally {
	        closeAll();
	    }
	    return 0;
	}

	 public List<Board> getBoardList() {
	        List<Board> boardList = new ArrayList<>();
	        String sql = "SELECT * FROM board1 ORDER BY bnum DESC"; // 글 번호를 기준으로 내림차순 정렬
	        conn = getConn();
	        try {
	            pstmt = conn.prepareStatement(sql);
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	                Board board = new Board();
	                board.setBnum(rs.getInt("bnum"));
	                board.setTitle(rs.getString("title"));
	                board.setAuthor(rs.getString("author"));
	                board.setContents(rs.getString("contents"));
	                board.setRdate(rs.getDate("rdate"));
	                board.setHit(rs.getInt("hit"));
	                boardList.add(board);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            closeAll();
	        }
	        return boardList;
	    }
	 
	 public boolean updateBoard(Board board) {
		    String sql = "UPDATE board1 SET title = ?, contents = ? WHERE bnum = ?";
		    conn = getConn();
		    try {
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, board.getTitle());
		        pstmt.setString(2, board.getContents());
		        pstmt.setInt(3, board.getBnum());
		        int rows = pstmt.executeUpdate();
		        return rows > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        closeAll();
		    }
		    return false;
		}
	 
	 public boolean deleteBoard(int bnum) {
		    String sql = "DELETE FROM board1 WHERE bnum = ?";
		    conn = getConn();
		    try {
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, bnum);
		        int rows = pstmt.executeUpdate();
		        return rows > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        closeAll();
		    }
		    return false;
		}
	
	public Board getBoard(int bnum) {
	    String sql = "SELECT * FROM board1 WHERE bnum = ?";
	    Board board = null;
	    conn = getConn();
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, bnum);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            board = new Board();
	            board.setBnum(rs.getInt("bnum"));
	            board.setTitle(rs.getString("title"));
	            board.setAuthor(rs.getString("author"));
	            board.setContents(rs.getString("contents"));
	            board.setRdate(rs.getDate("rdate"));
	            board.setHit(rs.getInt("hit"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeAll();
	    }
	    return board;
	}
	
	private void closeAll() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
