package com.javalec.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.bbs.dto.BDto;

public class BDao {
	
	DataSource dataSource;
	
	public BDao() {
		
			// DB 연결
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvc");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 전체검색
	public ArrayList<BDto> list() {
		
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select bId, bName, bTitle, bContent, bDate from mvc_board";
			preparedStatement = connection.prepareStatement(query);
			resultset = preparedStatement.executeQuery();
			
			while(resultset.next()) {
				
				int bId = resultset.getInt("bId"); // 컬럼명으로 적어주면 순서에 상관없다
				String bName = resultset.getString("bName");
				String bTitle = resultset.getString("bTitle");
				String bContent = resultset.getString("bContent");
				Timestamp bDate = resultset.getTimestamp("bDate");

				BDto dto = new BDto(bId, bName, bTitle, bContent, bDate);
				
				// 필드 
				dtos.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally { // 소스가 분리되어 있기 때문에 finally에 
			try {
				if(resultset != null) resultset.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		return dtos;
	}
	
	public void write(String bName, String bTitle, String bContent) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into mvc_board(bName, bTitle, bContent, bDate) values(?, ?, ?, now())";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally { 
			try {
				if(resultset != null) resultset.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		
	}
	
	// 단일 레코드 하나만을 반환해줘서 DTO로 반환
	public BDto contentView(String sbId) {
		
		BDto dto = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from mvc_board where bId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(sbId));
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				
				int bId = resultset.getInt("bId"); // 컬럼명으로 적어주면 순서에 상관없다
				String bName = resultset.getString("bName");
				String bTitle = resultset.getString("bTitle");
				String bContent = resultset.getString("bContent");
				Timestamp bDate = resultset.getTimestamp("bDate");

				dto = new BDto(bId, bName, bTitle, bContent, bDate);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally { // 소스가 분리되어 있기 때문에 finally에 넣어서 메모리를 종료해줘야 한다.
			try {
				if(resultset != null) resultset.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		
		return dto;		
	}
	
	public void modify(String bId, String bName, String bTitle, String bContent) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update mvc_board set bName = ?, bTitle=?, bContent=? where bId = ?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			preparedStatement.setInt(4, Integer.parseInt(bId));
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally { 
			try {
				if(resultset != null) resultset.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		
	}
	
	public void delete(String sbId) {
		
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			connection = dataSource.getConnection();
			
			String query = "delete from mvc_board where bId = ?";
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(sbId));
			
			preparedStatement.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
			
		}finally { // 소스가 분리되어 있기 때문에 finally에 넣어서 메모리를 종료해줘야 한다.
			try {

				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		
		
		
	}
	
	
	
	
	
}
