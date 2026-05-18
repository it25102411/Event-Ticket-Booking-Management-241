package com.example.eventbookingsystem.controller;

import com.example.eventbookingsystem.model.User;
import com.example.eventbookingsystem.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    // Show login page
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // loads WEB-INF/views/login.jsp
    }

    // Process login form
    @PostMapping("/login")
    public String processLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        User user = userService.loginUser(email, password);

        if (user != null) {
            // Save user in session
            session.setAttribute("loggedUser", user);
            session.setAttribute("userName", user.getName());
            session.setAttribute("userRole", user.getRole());

            // Admin goes to user management, user goes to events
            if ("admin".equals(user.getRole())) {
                return "redirect:/users";
            } else {
                return "redirect:/events";
            }
        } else {
            // Login failed - show error
            model.addAttribute("error",
                    "Wrong email or password. Try again.");
            return "login";
        }
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}