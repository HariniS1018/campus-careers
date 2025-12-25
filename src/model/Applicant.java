package model;

public class Applicant {
    private int id;
    private String password;

    public Applicant(int id, String password) {
        this.id = id;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }
}