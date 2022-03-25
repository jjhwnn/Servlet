package com.javalec.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.bbs.dto.PDto;

public class PDao {
	
	DataSource dataSource;
	
	public PDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvc");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<PDto> list() {
		ArrayList<PDto> dtos = new ArrayList<PDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "select * from mvc_onelineBoard";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String pName = rs.getString("pName");
				String pTitle = rs.getString("pTitle");
				Timestamp pDate = rs.getTimestamp("pDate");
				
				PDto dto = new PDto(seq, pName, pTitle, pDate);
				
				dtos.add(dto);
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		return dtos;
	}
	
	
	public void write(String pName, String bTitle) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String Query = "insert into mvc_onelineBoard(pName, pTitle, pDate) values(?, ?, now())";
			pstmt = conn.prepareStatement(Query);
			pstmt.setString(1, pName);
			pstmt.setString(2, bTitle);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	public void delete(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String Query = "delete from mvc_onelineBoard where seq = ?";
			pstmt = conn.prepareStatement(Query);
			
			pstmt.setInt(1, Integer.parseInt(seq));
			
			pstmt.executeUpdate();
	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
	}
	
	
}
