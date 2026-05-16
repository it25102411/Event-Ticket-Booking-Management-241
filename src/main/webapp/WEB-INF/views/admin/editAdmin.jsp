<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background:#f0f2f5; }
        .sidebar { width:240px; height:100vh; background:#1e1b4b; position:fixed; top:0; left:0; padding:30px 20px; }
        .sidebar h4 { color:white; margin-bottom:30px; }
        .sidebar a { display:block; color:#c7d2fe; text-decoration:none; padding:10px 14px; border-radius:8px; margin-bottom:6px; }
        .sidebar a:hover { background:#3730a3; color:white; }
        .main { margin-left:240px; padding:30px; }
        .form-box { background:white; border-radius:12px; padding:30px; max-width:550px; box-shadow:0 2px 10px rgba(0,0,0,0.07); }
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
        <h3>✏️ Edit Admin</h3>
        <p class="text-muted">Update the admin details below</p>

        <div class="form-box">
            <form method="post" action="/admin/edit/${admin.id}">
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="fullName" class="form-control" value="${admin.fullName}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" value="${admin.username}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="${admin.email}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" value="${admin.password}" required>
                </div>
                <div class="mb-4">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-select">
                        <option value="SUPER_ADMIN" ${admin.role == 'SUPER_ADMIN' ? 'selected' : ''}>Super Admin</option>
                        <option value="MODERATOR"   ${admin.role == 'MODERATOR'   ? 'selected' : ''}>Moderator</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary w-100">Save Changes</button>
                <a href="/admin/manage" class="btn btn-light w-100 mt-2">Cancel</a>
            </form>
        </div>
    </div>
</body>
</html>