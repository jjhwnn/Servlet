package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;

public class PDeleteCommand implements PCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String seq = request.getParameter("seq");
		
		PDao dao = new PDao();
		
		dao.delete(seq);
	}

}
