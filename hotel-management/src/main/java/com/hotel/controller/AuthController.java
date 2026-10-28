package com.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.entity.User;
import com.hotel.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    // SHOW LOGIN PAGE
    @GetMapping("/login")
    public String loginPage() {
        return "login";   // NOT login.jsp
    }

    // HANDLE LOGIN
    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        User user = userService.login(email, password);

        if (user == null) {
            model.addAttribute("error", "Invalid email or password!");
            return "login";  // NOT login.jsp
        }

        // SAVE USER INFO IN SESSION
        session.setAttribute("user", user);

        return "dashboard";  
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";   // NOT register.jsp
    }

    // HANDLE REGISTRATION
    @PostMapping("/register")
    public String register(@ModelAttribute User user) {
        userService.register(user);
        return "redirect:/login"; // NOT redirect:/login.jsp
    }

    // LOGOUT
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login"; // NOT redirect:/login.jsp
    }
}
