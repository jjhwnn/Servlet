package com.javalec.bbs.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.BDao;
import com.javalec.bbs.dto.BDto;

public class BModifyCommand implements Bcommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		BDao dao = new BDao();
		
		dao.modify(bId, bName, bTitle, bContent);

	}

}
