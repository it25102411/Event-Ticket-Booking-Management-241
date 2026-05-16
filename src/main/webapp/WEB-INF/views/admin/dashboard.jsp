<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f2f5; }
        .sidebar {
            width: 240px; height: 100vh;
            background: #1e1b4b; position: fixed;
            top: 0; left: 0; padding: 30px 20px;
        }
        .sidebar h4 { color: white; margin-bottom: 30px; }
        .sidebar a {
            display: block; color: #c7d2fe;
            text-decoration: none; padding: 10px 14px;
            border-radius: 8px; margin-bottom: 6px;
        }
        .sidebar a:hover { background: #3730a3; color: white; }
        .main { margin-left: 240px; padding: 30px; }
        .card-stat {
            background: white; border-radius: 12px;
            padding: 24px; box-shadow: 0 2px 10px rgba(0,0,0,0.07);
            text-align: center;
        }
        .card-stat h2 { font-size: 2.5rem; color: #4f46e5; margin: 0; }
        .card-stat p  { color: #888; margin: 6px 0 0; }
        .badge-super { background:#4f46e5; color:white; padding:6px 16px; border-radius:20px; font-size:14px; }
        .badge-mod   { background:#0891b2; color:white; padding:6px 16px; border-radius:20px; font-size:14px; }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4>🎟️ Event Admin</h4>
    <a href="/admin/dashboard">🏠 Dashboard</a>
    <c:if test="${isSuperAdmin}">
        <a href="/admin/manage">👥 Manage Admins</a>
    </c:if>
    <a href="/reports">📊 Reports</a>
    <a href="/admin/logout">🚪 Logout</a>
</div>

<!-- Main Content -->
<div class="main">
    <div class="d-flex align-items-center gap-3 mb-1">
        <h3 class="mb-0">Welcome, ${sessionScope.loggedAdmin.fullName}! 👋</h3>
        <c:if test="${isSuperAdmin}">
            <span class="badge-super">👑 Super Admin</span>
        </c:if>
        <c:if test="${!isSuperAdmin}">
            <span class="badge-mod">🛡️ Moderator</span>
        </c:if>
    </div>
    <p class="text-muted">Event Ticket Booking System — Admin Panel</p>

    <!-- Stats Cards -->
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card-stat">
                <h2>${totalAdmins}</h2>
                <p>Total Admins</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card-stat">
                <h2>🎫</h2>
                <p>Event Bookings</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card-stat">
                <h2>📈</h2>
                <p>Reports Generated</p>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="mt-5">
        <h5>Quick Actions</h5>
        <c:if test="${isSuperAdmin}">
            <a href="/admin/register" class="btn btn-primary me-2">➕ Add New Admin</a>
            <a href="/admin/manage" class="btn btn-secondary me-2">👥 Manage Admins</a>
        </c:if>
        <a href="/reports" class="btn btn-success me-2">📊 View Reports</a>
    </div>
</div>
</body>
</html>