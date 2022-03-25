package com.javalec.bbs.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;
import com.javalec.bbs.dto.PDto;

public class PListCommand implements PCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<PDto> dtos = new ArrayList<PDto>();
		PDao dao = new PDao();
		
		dtos = dao.list();
		
		request.setAttribute("list", dtos);
	}

}
