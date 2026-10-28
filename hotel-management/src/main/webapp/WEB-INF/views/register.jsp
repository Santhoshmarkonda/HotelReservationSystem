<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Hotel Management</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body class="login-page-body">
<div class="login-container">
    <div class="form-box">
        <div class="form-header">
            <div class="form-logo">🏨 Hotel Management</div>
            <div class="form-title">Create Account</div>
            <div class="form-subtitle">Join now to enjoy our services</div>
        </div>

        <form action="/register" method="post">

            <div class="input-group">
                <label>Full Name</label>
                <input type="text" name="name" required />
            </div>

            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" required />
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password" required />
            </div>

            <button class="login-btn-primary" type="submit">Register</button>

            <div class="form-link">
                <p>Already have an account? 
                    <a href="/login">Login</a>
                </p>
            </div>

        </form>
    </div>
</div>
</body>
</html>
