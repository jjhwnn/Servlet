package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.BDao;

public class BDeleteCommand implements Bcommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bId = request.getParameter("bId");

		BDao dao = new BDao();
		
		// 레코드 삭제해 줄 delete메소드 호출
		dao.delete(bId);
		
	}

}
