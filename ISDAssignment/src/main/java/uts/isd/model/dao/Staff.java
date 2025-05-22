package model.dao;

public class Staff {
    public int id;
    public String name, email, position, address;

    public Staff(int id, String name, String email, String position, String address) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.position = position;
        this.address = address;
    }
}
