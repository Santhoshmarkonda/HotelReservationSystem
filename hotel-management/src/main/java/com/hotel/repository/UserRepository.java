package com.hotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hotel.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);
}

