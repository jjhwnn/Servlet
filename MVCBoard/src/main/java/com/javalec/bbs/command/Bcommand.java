package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// controller의 명령을 받아서 DAO에 요청
public interface Bcommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response);
	
	
}
