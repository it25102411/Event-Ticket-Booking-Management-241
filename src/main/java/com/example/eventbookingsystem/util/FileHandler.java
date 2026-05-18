package com.example.eventbookingsystem.util;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * FileHandler.java
 * This class handles ALL file reading and writing
 * for admins.txt, reports.txt and activity_log.txt
 */
public class FileHandler {

    // File paths — files will be created in your project folder
    private static final String ADMINS_FILE   = "data/admins.txt";
    private static final String REPORTS_FILE  = "data/reports.txt";
    private static final String LOG_FILE      = "data/activity_log.txt";

    // ── CREATE data folder if it doesn't exist ──────────────────
    static {
        new File("data").mkdirs();
    }

    // ── WRITE admin to admins.txt ────────────────────────────────
    /**
     * Every time a new admin is created,
     * this method writes their details to admins.txt
     */
    public static void writeAdmin(String username, String email,
                                  String fullName, String role) {
        try (FileWriter fw = new FileWriter(ADMINS_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw)) {

            String line = "Username: " + username +
                    " | Name: "  + fullName  +
                    " | Email: " + email     +
                    " | Role: "  + role      +
                    " | Date: "  + getCurrentTime();

            bw.write(line);
            bw.newLine(); // go to next line

        } catch (IOException e) {
            System.out.println("Error writing to admins.txt: " + e.getMessage());
        }
    }

    // ── WRITE report to reports.txt ──────────────────────────────
    /**
     * Every time a report is generated,
     * this method writes the details to reports.txt
     */
    public static void writeReport(String reportTitle, String reportType,
                                   int totalBookings, double totalRevenue) {
        try (FileWriter fw = new FileWriter(REPORTS_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw)) {

            String line = "Title: "    + reportTitle   +
                    " | Type: "  + reportType    +
                    " | Bookings: " + totalBookings +
                    " | Revenue: Rs." + totalRevenue +
                    " | Date: "  + getCurrentTime();

            bw.write(line);
            bw.newLine();

        } catch (IOException e) {
            System.out.println("Error writing to reports.txt: " + e.getMessage());
        }
    }

    // ── WRITE activity log ───────────────────────────────────────
    /**
     * Every time someone logs in or does something important,
     * this method writes it to activity_log.txt
     */
    public static void writeLog(String action, String username) {
        try (FileWriter fw = new FileWriter(LOG_FILE, true);
             BufferedWriter bw = new BufferedWriter(fw)) {

            String line = "[" + getCurrentTime() + "] " +
                    username + " → " + action;

            bw.write(line);
            bw.newLine();

        } catch (IOException e) {
            System.out.println("Error writing to activity_log.txt: " + e.getMessage());
        }
    }

    // ── READ all lines from a file ───────────────────────────────
    /**
     * Reads a .txt file and returns all lines as a String
     * Used to display file contents on the dashboard
     */
    public static String readFile(String filePath) {
        StringBuilder content = new StringBuilder();

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                content.append(line).append("\n");
            }
        } catch (IOException e) {
            return "No data found in file yet.";
        }

        return content.toString();
    }

    // ── Helper method — get current date and time ────────────────
    private static String getCurrentTime() {
        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return LocalDateTime.now().format(formatter);
    }

    // ── Read admins.txt ──────────────────────────────────────────
    public static String readAdminsFile() {
        return readFile(ADMINS_FILE);
    }

    // ── Read reports.txt ─────────────────────────────────────────
    public static String readReportsFile() {
        return readFile(REPORTS_FILE);
    }

    // ── Read activity_log.txt ────────────────────────────────────
    public static String readLogFile() {
        return readFile(LOG_FILE);
    }
}
