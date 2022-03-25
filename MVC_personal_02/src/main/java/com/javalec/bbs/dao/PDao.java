package com.javalec.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
	
	public ArrayList<PDto> list(){
		ArrayList<PDto> dtos = new ArrayList<PDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "select * from mvc_profile";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pId = rs.getInt("pId");
				String pName = rs.getString("pName");
				String pTel = rs.getString("pTel");
				String pAddress = rs.getString("pAddress");
				String pEmail = rs.getString("pEmail");
				String pRel = rs.getString("pRel");
				
				PDto dto = new PDto(pId, pName, pTel, pAddress, pEmail, pRel);
				
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

	public void write(String pName, String pTel, String pAddress, String pEmail, String pRel) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String Query = "insert into mvc_profile(pName, pTel, pAddress, pEmail, pRel) values(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(Query);
			pstmt.setString(1, pName.trim()); // 양쪽 공백을 제거하기 위한 메서드
			pstmt.setString(2, pTel.trim());
			pstmt.setString(3, pAddress.trim());
			pstmt.setString(4, pEmail.trim());
			pstmt.setString(5, pRel.trim());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	public PDto contentView(String spId) {
		PDto dto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "select * from mvc_profile where pId = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(spId));
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				
				int pId = rs.getInt("pId");
				String pName = rs.getString("pName");
				String pTel = rs.getString("pTel");
				String pAddress = rs.getString("pAddress");
				String pEmail = rs.getString("pEmail");
				String pRel = rs.getString("pRel");
				
				dto = new PDto(pId, pName, pTel, pAddress, pEmail, pRel);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return dto;
	}
	
	public void modify(String pId, String pName, String pTel, String pAddress, String pEmail, String pRel) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = dataSource.getConnection();
			String query = "update mvc_profile set pName = ?, pTel = ?,"
					+ " pAddress = ?, pEmail = ?, pRel = ? where pId = ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, pName);
			pstmt.setString(2, pTel);
			pstmt.setString(3, pAddress);
			pstmt.setString(4, pEmail);
			pstmt.setString(5, pRel);
			pstmt.setInt(6, Integer.parseInt(pId));
			
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch (Exception e){
				e.printStackTrace();
			}
			
		}
		
	}
		
		public void delete(String pId) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				
				conn = dataSource.getConnection();
				
				String query = "delete from mvc_profile where pId = ?";
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(pId));
				
				pstmt.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
				
			}finally { // 소스가 분리되어 있기 때문에 finally에 넣어서 메모리를 종료해줘야 한다.
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					
				}catch (Exception e){
					e.printStackTrace();
				}
				
			}
			
		}
		
		public ArrayList<PDto> searchList(String sel, String search){
			
			ArrayList<PDto> dtos = new ArrayList<PDto>();
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String whereQuery = " where " + sel + " like '%" + search + "%'";
			
			String query = "select * from mvc_profile";
			sel = "pAddress";
			
			if(search != null){
				search = null;
				query += whereQuery;
			}
			
			try {
				conn = dataSource.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				
				while(rs.next()) {
					int pId = rs.getInt("pId");
					String pName = rs.getString("pName");
					String pTel = rs.getString("pTel");
					String pAddress = rs.getString("pAddress");
					String pEmail = rs.getString("pEmail");
					String pRel = rs.getString("pRel");
					
					PDto dto = new PDto(pId, pName, pTel, pAddress, pEmail, pRel);
					
					dtos.add(dto);
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			
			return dtos;
		}
	
	
	
	
	
}
