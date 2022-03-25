package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;
import com.javalec.bbs.dto.PDto;

public class PContentCommand implements PCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// list에서 타이틀을 누르면 개별 레코드 출력해주는 페이지
		String seq = request.getParameter("seq");

		PDao dao = new PDao();
		
		// contentView의 반환형이 PDto이므로 dto객채로 초기화
		PDto dto =  dao.contentView(seq);
		
		request.setAttribute("content_view", dto);
		
	}

}
