package com.javalec.bbs.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;
import com.javalec.bbs.dto.PDto;

public class ProfileSearchCommand implements ProfileCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String sel = request.getParameter("sel");
		String search = request.getParameter("search");
		
		ArrayList<PDto> dtos = new ArrayList<PDto>();
		PDao dao = new PDao();
		
		dtos = dao.searchList(sel, search);		
		
		request.setAttribute("list", dtos);

	}

}
