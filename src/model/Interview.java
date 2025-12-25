package model;

public class Interview {
    private String companyName;
    private String domain;
    private String jobType;
    private String startDate;
    private String duration;
    private String venue;
    private String interviewDate;
    private String interviewTime;
    private String offerId;
    private boolean isActive;

    public Interview(String companyName, String domain, String jobType,
        String startDate, String duration, String venue,
        String interviewDate, String interviewTime, String offerId, boolean isActive) {
        this.companyName = companyName;
        this.domain = domain;
        this.jobType = jobType;
        this.startDate = startDate;
        this.duration = duration;
        this.venue = venue;
        this.interviewDate = interviewDate;
        this.interviewTime = interviewTime;
        this.offerId = offerId;
        this.isActive = isActive;
    }

    public String getCompanyName() {
        return companyName;
    }
    public String getDomain() {
        return domain;
    }
    public String getJobType() {
        return jobType;
    }
    public String getStartDate() {
        return startDate;
    }
    public String getDuration() {
        return duration;
    }
    public String getVenue() {
        return venue;
    }
    public String getInterviewDate() {
        return interviewDate;
    }
    public String getInterviewTime() {
        return interviewTime;
    }
    public String getOfferId() {
        return offerId;
    }
    public boolean isActive() {
        return isActive;
    }
}