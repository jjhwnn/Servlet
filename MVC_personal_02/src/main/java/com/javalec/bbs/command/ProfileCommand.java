package com.javalec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ProfileCommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response);
	
}
