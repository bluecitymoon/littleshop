package com.ls.service;

import java.util.List;

import com.ls.entity.User;

public interface UserService {
	List<User> findUserByName(String name);

}
