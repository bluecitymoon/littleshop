package com.ls.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.ls.entity.User;


public interface UserRepository extends JpaRepository<User, Integer> , JpaSpecificationExecutor<User>{
	/**
	 * 
	 * JPQL:from User u where u.name=?1
	 * 
	 * @param name
	 * @return
	 */
	List<User> findByName(String name);
}
