<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.hotel.entity.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("/login");
    }
%>
<!DOCTYPE html>
<html>
<head>
<title>Book Room - Hotel Management</title>
<link rel="stylesheet" href="/css/style.css">
</head>

<body class="dashboard-layout">

	<div class="navbar">
		<div class="nav-brand">🏨 Hotel Management</div>

		<ul class="nav-links">
			<li><a href="/dashboard">Home</a></li>
			<li><a href="/bookings/book">Book Room</a></li>
			<li><a href="/bookings/view">My Bookings</a></li>
		</ul>
		
		 <div class="nav-user">
        <span class="welcome-text">Welcome, <%= user.getName() %></span>

        <form class="logout-form" action="/logout" method="get">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
		
	</div>

	<div class="page-header">
		<h2>Book a Room</h2>
	</div>

	<div class="page-content">
		<form class="booking-form" action="/bookings/book" method="post">

			<label>Select Room</label> <select name="roomId">
				<c:forEach var="room" items="${rooms}">
					<option value="${room.id}">${room.roomType}-
						₹${room.price}</option>
				</c:forEach>
			</select> <label>Check-In Date</label> <input type="date" name="checkIn"
				required> <label>Check-Out Date</label> <input type="date"
				name="checkOut" required>

			<button type="submit">Book Now</button>
		</form>
	</div>

	<div class="footer">© 2025 Hotel Management System</div>
</body>
</html>
