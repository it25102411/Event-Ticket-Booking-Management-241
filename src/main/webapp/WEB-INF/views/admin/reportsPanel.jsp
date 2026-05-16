<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reports Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background:#f0f2f5; }
        .sidebar { width:240px; height:100vh; background:#1e1b4b; position:fixed; top:0; left:0; padding:30px 20px; }
        .sidebar h4 { color:white; margin-bottom:30px; }
        .sidebar a { display:block; color:#c7d2fe; text-decoration:none; padding:10px 14px; border-radius:8px; margin-bottom:6px; }
        .sidebar a:hover { background:#3730a3; color:white; }
        .main { margin-left:240px; padding:30px; }
        .table-box { background:white; border-radius:12px; padding:24px; box-shadow:0 2px 10px rgba(0,0,0,0.07); }
        .form-box { background:white; border-radius:12px; padding:24px; margin-bottom:30px; box-shadow:0 2px 10px rgba(0,0,0,0.07); }
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
        <h3>📊 Reports Panel</h3>
        <p class="text-muted">Generate and view booking reports</p>

        <!-- Generate New Report Form -->
        <div class="form-box">
            <h5 class="mb-3">Generate New Report</h5>
            <form method="post" action="/reports/generate">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Report Title</label>
                        <input type="text" name="reportTitle" class="form-control" placeholder="e.g. Daily Report" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="form-label">Report Type</label>
                        <select name="reportType" class="form-select">
                            <option value="DAILY">Daily</option>
                            <option value="WEEKLY">Weekly</option>
                            <option value="MONTHLY">Monthly</option>
                        </select>
                    </div>
                    <div class="col-md-2 mb-3">
                        <label class="form-label">Total Bookings</label>
                        <input type="number" name="totalBookings" class="form-control" placeholder="0" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="form-label">Total Revenue (Rs.)</label>
                        <input type="number" name="totalRevenue" class="form-control" placeholder="0.00" step="0.01" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">📊 Generate Report</button>
            </form>
        </div>

        <!-- Reports Table -->
        <div class="table-box">
            <h5 class="mb-3">All Reports</h5>
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Bookings</th>
                        <th>Revenue</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${reports}" var="report">
                        <tr>
                            <td>${report.id}</td>
                            <td>${report.reportTitle}</td>
                            <td><span class="badge bg-primary">${report.reportType}</span></td>
                            <td>${report.totalBookings}</td>
                            <td>Rs. ${report.totalRevenue}</td>
                            <td>${report.reportDate}</td>
                            <td>
                                <a href="/reports/delete/${report.id}"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Delete this report?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>