<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Hotel Management</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body class="login-page-body">
<div class="login-container">
    <div class="form-box">
        <div class="form-header">
            <div class="form-logo">🏨 Hotel Management</div>
            <div class="form-title">Welcome Back</div>
            <div class="form-subtitle">Login to continue</div>
        </div>

        <c:if test="${not empty error}">
            <div class="message error">${error}</div>
        </c:if>

        <form action="/login" method="post">
            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" required />
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password" required />
            </div>

            <button class="login-btn-primary" type="submit">Login</button>

            <div class="form-link">
                <p>Don't have an account?
                    <a href="/register">Register</a>
                </p>
            </div>
        </form>
    </div>
</div>
</body>
</html>
