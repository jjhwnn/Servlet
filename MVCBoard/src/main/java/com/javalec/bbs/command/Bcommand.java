package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// controller의 명령을 받아서 DAO에 요청
// Command의 메서드를 정의해줄 인터페이스
public interface Bcommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response);
	
//	public void executeUpdate(HttpServletRequest request, HttpServletResponse response);
	
}
