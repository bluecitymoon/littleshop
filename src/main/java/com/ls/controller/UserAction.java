package com.ls.controller;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import com.ls.entity.User;
import com.ls.repository.UserRepository;
import com.ls.service.UserService;
import com.opensymphony.xwork2.ActionContext;

@Component("userAction")
public class UserAction extends BaseAction {

	private static final long serialVersionUID = -3519886427026056067L;
	private String username;

	private List<User> users;

	private Set<String> usersList;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Autowired
	private UserRepository userRepository;

	public void setUsername(String username) {

		this.username = username;
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

		if (StringUtils.isEmpty(name)) {
			users = userRepository.findAll(new Sort(Sort.Direction.ASC,"id"));
		} else {
			users = userService.findUserByName(name);
		}
		

		return SUCCESS;
	}

	/**
	 * for auto-complete plugin
	 * 
	 * @return
	 */
	public String getAllUserAccounts() {

		usersList = userService.findAllAccounts();

		return SUCCESS;
	}

	public String loadAllUsers() {

		users = userRepository.findAll(new Sort(Sort.Direction.ASC, "id"));

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

	public Set<String> getUsersList() {

		return usersList;
	}

	public void setUsersList(Set<String> usersList) {

		this.usersList = usersList;
	}
}