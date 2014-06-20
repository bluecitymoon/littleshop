package com.ls.controller;

import com.opensymphony.xwork2.ActionContext;

public class UserAction extends BaseAction {

	private static final long serialVersionUID = -3519886427026056067L;
	private String username;

	public void setUsername(String username) {

		this.username = username;
	}

	// all struts logic here
	public String execute() {

		return "SUCCESS";

	}

	public String doLogin() {

		String username = getParameter("username");
		System.out.println(ActionContext.getContext().getParameters().toString());

		System.out.println(username);
		return SUCCESS;
	}

	public String loadGrabPage() {
		return SUCCESS;
	}
	
	public String loadAssignLocationToUser() {
		return SUCCESS;
	}
	public String getUsername() {

		return username;
	}

}