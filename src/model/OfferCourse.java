package model;

public class OfferCourse {
    private int offerId;
    private String courseId;

    public OfferCourse(int offerId, String courseId) {
        this.offerId = offerId;
        this.courseId = courseId;
    }

    public int getOfferId() {
        return offerId;
    }

    public String getCourseId() {
        return courseId;
    }
}