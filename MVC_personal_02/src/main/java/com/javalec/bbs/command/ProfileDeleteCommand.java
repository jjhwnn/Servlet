package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;

public class ProfileDeleteCommand implements ProfileCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String pId = request.getParameter("pId");
		
		PDao dao = new PDao();
		
		dao.delete(pId);
		
		
	}

}
