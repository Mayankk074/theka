package com.foryou.Theka.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserProfile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne
    @JoinColumn(name = "user_id", unique = true)
    private Users user;

    private String name;
    private long phone;
    private String address;
    private String profilePicUrl;
    private String bio;

    //can be null for client
    private String skills; // comma-separated or @ElementCollection
    private Integer experienceYears;
    private String serviceType;

    private Double rating = 0.0;
    private Integer numReviews = 0;
}
