<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>My Bookings - Hotel Management</title>
<link rel="stylesheet" href="/css/style.css">
</head>

<body class="dashboard-layout">

	<div class="navbar">
		<div class="nav-brand">🏨 Hotel Management</div>

		<ul class="nav-links">
			<li><a href="/dashboard">Home</a></li>
			<li><a href="/bookings/book">Book Room</a></li>
			<li><a class="active" href="/bookings/view">My Bookings</a></li>
		</ul>
		
		<div class="nav-user">
        <span class="welcome-text">Welcome, <%= user.getName() %></span>

        <form class="logout-form" action="/logout" method="get">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
	</div>

	<div class="page-header">
		<h2>Your Bookings</h2>
	</div>

	<div class="page-content">
		<div class="bookings-table-container">
			<table class="bookings-table">
				<thead>
					<tr>
						<th>Room</th>
						<th>Check-In</th>
						<th>Check-Out</th>
						<th>Status</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="b" items="${bookings}">
						<tr>
							<td>${b.room.roomType}</td>
							<td>${b.checkInDate}</td>
							<td>${b.checkOutDate}</td>
							<td><span class="status-confirmed">${b.status}</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div class="footer">© 2025 Hotel Management System</div>
</body>
</html>
