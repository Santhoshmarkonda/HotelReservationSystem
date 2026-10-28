package com.hotel.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "rooms")
public class Room {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false)
	private String roomType;

	@Column(nullable = false)
	private double price;

	@Column(nullable = false)
	private boolean available;

	public Room() {
	}

	public Room(int id) {
		this.id = id;
	}

	public Room(String roomType, double price, boolean available) {
		this.roomType = roomType;
		this.price = price;
		this.available = available;
	}

	public int getId() {
		return id;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

}
