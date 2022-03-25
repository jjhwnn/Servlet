package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;
import com.javalec.bbs.dto.PDto;

public class ProfileWriteCommand implements ProfileCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String pName = request.getParameter("pName");
		String pTel = request.getParameter("pTel");
		String pAddress = request.getParameter("pAddress");
		String pEmail = request.getParameter("pEmail");
		String pRel = request.getParameter("pRel");
		
		PDao dao = new PDao();
		
		dao.write(pName, pTel, pAddress, pEmail, pRel);
		
		
	}

}
