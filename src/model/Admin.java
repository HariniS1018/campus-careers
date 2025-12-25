package model;

public class Admin {
    private int id;
    private String password;

    public Admin(int id, String password) {
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