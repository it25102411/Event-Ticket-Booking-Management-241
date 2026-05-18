package com.example.eventbookingsystem.repository;

import com.example.eventbookingsystem.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    // Find user by email - used for login
    User findByEmail(String email);

    // Check if email already exists - used for registration
    boolean existsByEmail(String email);
}