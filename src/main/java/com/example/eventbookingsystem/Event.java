package com.example.eventbookingsystem;

public class Event {
    private int id;
    private String name;
    private int availableSeats;

    public Event(int id, String name, int availableSeats) {
        this.id = id;
        this.name = name;
        this.availableSeats = availableSeats;
    }

    public int getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int seats) {
        this.availableSeats = seats;
    }

    public String toString() {
        return id + "," + name + "," + availableSeats;
    }

    public static Event fromString(String data) {
        String[] parts = data.split(",");
        return new Event(
                Integer.parseInt(parts[0]),
                parts[1],
                Integer.parseInt(parts[2])
        );
    }
}

