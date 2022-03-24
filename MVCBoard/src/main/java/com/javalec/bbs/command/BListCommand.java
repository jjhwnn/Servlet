package com.javalec.bbs.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.BDao;
import com.javalec.bbs.dto.BDto;


	// list의 응답을 받을 커맨드 인터페이스 상속 클래스
public class BListCommand implements Bcommand {

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BDao dao = new BDao();
		ArrayList<BDto> dtos = dao.list();
		
		// list이름으로 dtos Session 데이터 세팅
		request.setAttribute("list", dtos);
	}

}
