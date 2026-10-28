<%@ page contentType="text/html;charset=UTF-8" %>
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
    <title>Dashboard - Hotel Management</title>
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
    <h2>Dashboard</h2>
</div>

<div class="page-content home-content">
    <p>Welcome to your personal hotel dashboard.</p>

    <h3>What would you like to do?</h3>

    <ul>
        <li>Book a new hotel room</li>
        <li>View your bookings</li>
        <li>Explore room options</li>
    </ul>
</div>

<div class="footer">
    © 2025 Hotel Management System
</div>
</body>
</html>
