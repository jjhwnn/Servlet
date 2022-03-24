package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.BDao;
import com.javalec.bbs.dto.BDto;

public class BContentCommand implements Bcommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// write_view 페이지에서 받아온 bId를 가져옴
		String bId = request.getParameter("bId");
		
		BDao dao = new BDao();
		
		// 넘겨받은 bId를 매개변수로 넘겨줌
		BDto dto = dao.contentView(bId);
		
		request.setAttribute("content_view", dto);
	}

}
