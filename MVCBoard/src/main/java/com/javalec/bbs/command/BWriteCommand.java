package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.BDao;

public class BWriteCommand implements Bcommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 웹에서 입력한 이름 제목 내용 정보 받아오기
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");

		BDao dao = new BDao();
		
		// dao에서 정의한 write메소드에 받아온 값 넘겨주기
		dao.write(bName, bTitle, bContent);
	}

	
	
}
