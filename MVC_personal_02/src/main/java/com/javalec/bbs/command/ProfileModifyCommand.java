package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.bbs.dao.PDao;

public class ProfileModifyCommand implements ProfileCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String pId = request.getParameter("pId");
		String pName = request.getParameter("pName");
		String pTel = request.getParameter("pTel");
		String pAddress = request.getParameter("pAddress");
		String pEmail = request.getParameter("pEmail");
		String pRel = request.getParameter("pRel");
		
		//수정 완료시 리스트로 다시 돌아감
		PDao dao = new PDao();
		
		dao.modify(pId, pName, pTel, pAddress, pEmail, pRel);
		
	}

}
