package com.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.Room;
import com.hotel.repository.RoomRepository;
import java.util.List;

@Service
public class RoomService {

	@Autowired
	private RoomRepository roomRepo;

	public List<Room> getAllRooms() {
		return roomRepo.findAll();
	}
}
