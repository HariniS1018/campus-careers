package model;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class Interview {
    private String companyName;
    private String role;
    private int stipend;
    private double ctc;
    private int duration;
    private String interviewVenue;
    private LocalDate interviewDate;
    private LocalTime interviewTime;
    private int offerId;
    private int adminId;
    private boolean isActive;
    private List<String> eligibleCourses;

    public Interview(String companyName, String role, int stipend, double ctc,
        int duration, String interviewVenue, LocalDate interviewDate, LocalTime interviewTime, 
        int offerId, int adminId, boolean isActive) {
        this.companyName = companyName;
        this.role = role;
        this.stipend = stipend;
        this.ctc = ctc;
        this.duration = duration;
        this.interviewVenue = interviewVenue;
        this.interviewDate = interviewDate;
        this.interviewTime = interviewTime;
        this.offerId = offerId;
        this.adminId = adminId;
        this.isActive = isActive;
    }

    public Interview(String companyName, String role, int stipend, double ctc,
        int duration, String interviewVenue, LocalDate interviewDate, LocalTime interviewTime,
        int adminId) {
        this.companyName = companyName;
        this.role = role;
        this.stipend = stipend;
        this.ctc = ctc;
        this.duration = duration;
        this.interviewVenue = interviewVenue;
        this.interviewDate = interviewDate;
        this.interviewTime = interviewTime;
        this.adminId = adminId;
    }
    
    public void setOfferId(int offerId) {
        this.offerId = offerId;
    }   
    public void setEligibleCourses(List<String> eligibleCourses) {
        this.eligibleCourses = eligibleCourses;
    }

    public List<String> getEligibleCourses() {
        return eligibleCourses;
    }
    public String getCompanyName() {
        return companyName;
    }
    public String getRole() {
        return role;
    }
    public int getStipend() {
        return stipend;
    }
    public double getCtc() {
        return ctc;
    }
    public int getDuration() {
        return duration;
    }
    public String getInterviewVenue() {
        return interviewVenue;
    }
    public LocalDate getInterviewDate() {
        return interviewDate;
    }
    public LocalTime getInterviewTime() {
        return interviewTime;
    }
    public int getOfferId() {
        return offerId;
    }
    public int getAdminId() {
        return adminId;
    }
    public boolean isActive() {
        return isActive;
    }
}   