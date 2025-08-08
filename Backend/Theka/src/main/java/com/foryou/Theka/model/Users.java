package com.foryou.Theka.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Users {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;
    private String email;
    private String password;
    private String role; // "CONTRACTOR" or "CLIENT"

    // relationships (optional)
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private UserProfile profile;

    @Override
    public String toString(){
        return email+"\n id: "+id;
    }
}
