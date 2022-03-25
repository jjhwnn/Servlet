package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;
import com.javalec.bbs.dto.PDto;

public class PWriteCommand implements PCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String pName = request.getParameter("pName");
		String pTitle = request.getParameter("pName");
		
		PDao dao = new PDao();

		dao.write(pName, pTitle);
	}

}
