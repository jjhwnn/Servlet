package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;
import com.javalec.bbs.dto.PDto;

public class ProfileContentViewCommand implements ProfileCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String pId = request.getParameter("pId");
		
		PDao dao = new PDao();
		
		PDto dto = dao.contentView(pId);
		
		request.setAttribute("content_view", dto);

	}

}
