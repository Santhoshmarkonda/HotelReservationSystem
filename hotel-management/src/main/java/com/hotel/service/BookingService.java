package com.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.Booking;
import com.hotel.entity.User;
import com.hotel.repository.BookingRepository;

@Service
public class BookingService {

	@Autowired
	private BookingRepository bookingRepo;

	public Booking saveBooking(Booking booking) {
		return bookingRepo.save(booking);
	}

	public List<Booking> getAllBookings() {
		return bookingRepo.findAll();
	}

	public List<Booking> getBookingsByUser(User user) {
		return bookingRepo.findAll().stream().filter(b -> b.getUser().getId() == user.getId()).toList();
	}
}
