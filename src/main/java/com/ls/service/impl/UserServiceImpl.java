package com.ls.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ls.entity.User;
import com.ls.repository.UserRepository;
import com.ls.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;

	public List<User> findUserByName(String name) {
		return userRepository.findByName(name);
	}

}
