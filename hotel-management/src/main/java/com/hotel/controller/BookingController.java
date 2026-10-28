package com.hotel.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.entity.Booking;
import com.hotel.entity.Room;
import com.hotel.entity.User;
import com.hotel.service.BookingService;
import com.hotel.service.RoomService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/bookings")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private RoomService roomService;

    // SHOW BOOK ROOM PAGE
    @GetMapping("/book")
    public String bookRoomPage(Model model) {
        model.addAttribute("rooms", roomService.getAllRooms());
        return "bookRoom";      // NOT bookRoom.jsp
    }

    // HANDLE BOOKING
    @PostMapping("/book")
    public String bookRoom(@RequestParam int roomId,
                           @RequestParam String checkIn,
                           @RequestParam String checkOut,
                           HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null)
            return "redirect:/login"; // FIXED

        Booking booking = new Booking();
        booking.setUser(user);
        booking.setRoom(new Room(roomId));
        booking.setCheckInDate(LocalDate.parse(checkIn));
        booking.setCheckOutDate(LocalDate.parse(checkOut));
        booking.setStatus("Confirmed");

        bookingService.saveBooking(booking);

        return "redirect:/bookings/view";  // FIXED
    }

    // SHOW USER BOOKINGS
    @GetMapping("/view")
    public String viewBookings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null)
            return "redirect:/login"; // FIXED

        model.addAttribute("bookings", bookingService.getBookingsByUser(user));
        return "viewBookings";   // NOT viewBookings.jsp
    }
}
