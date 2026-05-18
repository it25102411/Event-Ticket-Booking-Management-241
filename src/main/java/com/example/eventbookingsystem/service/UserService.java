package com.example.eventbookingsystem.service;

import com.example.eventbookingsystem.model.User;
import com.example.eventbookingsystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // LOGIN - check email and password
    public User loginUser(String email, String password) {
        User user = userRepository.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            return user; // login success
        }
        return null; // login failed
    }

    // REGISTER - save new user
    public boolean registerUser(User user) {
        if (userRepository.existsByEmail(user.getEmail())) {
            return false; // email already taken
        }
        user.setRole("user");
        userRepository.save(user);
        return true;
    }

    // READ - get all users (for admin)
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // READ - get one user by id
    public User getUserById(int id) {
        return userRepository.findById(id).orElse(null);
    }

    // UPDATE - save updated user
    public void updateUser(User user) {
        userRepository.save(user);
    }

    // DELETE - remove user by id
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
}