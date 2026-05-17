<!DOCTYPE html>
<html>
<head>
    <title>Event Management Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 65%;
            margin: 40px auto;
        }

        h1 {
            text-align: center;
            color: #1e3a8a;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            margin-bottom: 25px;
        }

        h3 {
            color: #2563eb;
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 18px;
            margin-top: 10px;
            margin-right: 10px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .add-btn {
            background-color: #16a34a;
        }

        .view-btn {
            background-color: #2563eb;
        }

        .update-btn {
            background-color: #f59e0b;
        }

        .delete-btn {
            background-color: #dc2626;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table, th, td {
            border: 1px solid #d1d5db;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #2563eb;
            color: white;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Event Management Dashboard</h1>

    <div class="card">
        <h3>Add / Delete Event</h3>

        <form action="/add-event-form" method="post">
            <input type="text" name="id" placeholder="Event ID" required>
            <input type="text" name="name" placeholder="Event Name" required>
            <input type="text" name="type" placeholder="Event Type" required>
            <input type="text" name="date" placeholder="Date" required>
            <input type="text" name="venue" placeholder="Venue" required>
            <input type="text" name="seats" placeholder="Seats" required>
            <input type="text" name="price" placeholder="Price" required>

            <br>
            <button type="submit" class="add-btn">Add Event</button>
        </form>

        <br>

        <form action="/delete-event-form" method="post">
            <input type="text" name="id" placeholder="Enter Event ID to Delete" required>
            <button type="submit" class="delete-btn">Delete Event</button>
        </form>
    </div>

    <div class="card">
        <h3>View Events</h3>

        <button class="view-btn">View All Events</button>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Date</th>
                <th>Venue</th>
            </tr>
            <%@ taglib prefix="c" uri="jakarta.tags.core" %>

            <c:forEach var="event" items="${events}">
                <tr>
                    <td>${event.id}</td>
                    <td>${event.name}</td>
                    <td>${event.type}</td>
                    <td>${event.date}</td>
                    <td>${event.venue}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>