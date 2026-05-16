<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Admins</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background:#f0f2f5; }
        .sidebar { width:240px; height:100vh; background:#1e1b4b; position:fixed; top:0; left:0; padding:30px 20px; }
        .sidebar h4 { color:white; margin-bottom:30px; }
        .sidebar a { display:block; color:#c7d2fe; text-decoration:none; padding:10px 14px; border-radius:8px; margin-bottom:6px; }
        .sidebar a:hover { background:#3730a3; color:white; }
        .main { margin-left:240px; padding:30px; }
        .table-box { background:white; border-radius:12px; padding:24px; box-shadow:0 2px 10px rgba(0,0,0,0.07); }
        .badge-super { background:#4f46e5; color:white; padding:4px 10px; border-radius:20px; font-size:12px; }
        .badge-mod   { background:#0891b2; color:white; padding:4px 10px; border-radius:20px; font-size:12px; }
    </style>
</head>
<body>
    <div class="sidebar">
        <h4>🎟️ Event Admin</h4>
        <a href="/admin/dashboard">🏠 Dashboard</a>
        <a href="/admin/manage">👥 Manage Admins</a>
        <a href="/reports">📊 Reports</a>
        <a href="/admin/logout">🚪 Logout</a>
    </div>

    <div class="main">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>👥 Manage Admins</h3>
            <a href="/admin/register" class="btn btn-primary">➕ Add Admin</a>
        </div>

        <div class="table-box">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>#</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${admins}" var="admin">
                        <tr>
                            <td>${admin.id}</td>
                            <td>${admin.fullName}</td>
                            <td>${admin.username}</td>
                            <td>${admin.email}</td>
                            <td>
                                <c:if test="${admin.role == 'SUPER_ADMIN'}">
                                    <span class="badge-super">Super Admin</span>
                                </c:if>
                                <c:if test="${admin.role == 'MODERATOR'}">
                                    <span class="badge-mod">Moderator</span>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${admin.active}">
                                    <span class="text-success">● Active</span>
                                </c:if>
                                <c:if test="${!admin.active}">
                                    <span class="text-danger">● Inactive</span>
                                </c:if>
                            </td>
                            <td>
                                <a href="/admin/edit/${admin.id}" class="btn btn-sm btn-warning">Edit</a>
                                <a href="/admin/delete/${admin.id}" class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>