package com.hotel.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.entity.User;
import com.hotel.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;

	public User register(User user) {
		return userRepo.save(user);
	}

	public User login(String email, String password) {
		User user = userRepo.findByEmail(email);
		if (user != null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}
}
