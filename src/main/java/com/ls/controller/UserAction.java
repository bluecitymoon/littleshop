package com.ls.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ls.entity.User;
import com.ls.service.UserService;
import com.opensymphony.xwork2.ActionContext;

@Component("userAction")
public class UserAction extends BaseAction {

	private static final long serialVersionUID = -3519886427026056067L;
	private String username;
	
	private List<User> users;
	
	@Resource(name="userService")
	private UserService userService;

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
	
	public String ajaxFindUser() {
		
		String name = getParameter("userName");
		
		users = userService.findUserByName(name);
		
		return SUCCESS;
	}
	public String getUsername() {

		return username;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

}