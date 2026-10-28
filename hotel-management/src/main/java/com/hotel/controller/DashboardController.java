package com.hotel.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {

		Object user = session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		model.addAttribute("user", user);
		return "dashboard"; 
	}
}
