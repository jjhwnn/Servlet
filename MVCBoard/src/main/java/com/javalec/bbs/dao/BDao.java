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
	
	
	
	
	
	
	
	
	
	
	
}
