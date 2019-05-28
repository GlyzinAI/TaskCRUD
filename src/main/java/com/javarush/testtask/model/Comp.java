package com.javarush.testtask.model;

import javax.persistence.*;

@Entity
@Table(name = "computer_components")
public class Comp {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "title")
    private String title;

    @Column(name = "necessary")
    private boolean necessary;

    @Column(name = "quantity")
    private int quantity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isNecessary() {
        return necessary;
    }

    public void setNecessary(boolean necessary) {
        this.necessary = necessary;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int count) {
        this.quantity = count;
    }

    @Override
    public String toString() {
        return "Comp{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", necessary=" + necessary +
                ", count=" + quantity +
                '}';
    }
}
