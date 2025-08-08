package com.foryou.Theka.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne(fetch = FetchType.EAGER) // Use ManyToOne for multiple posts per user
    @JoinColumn(name = "user_id")
    private Users user;

    private String title;             // e.g., "Need a plumber" or "Offering web dev services"
    private String about;             // Description of the work or service
    private String category;          // What category it serves like plumbing, construction etc
    private String skills;            // Required or offered skills
    private String location;          // Optional: city/state
    private String workAttachments;   // File URL or filenames (PDFs, images)
    private LocalDateTime postedAt;   // Useful for sorting/searching

    private boolean isRequest;        // true = client posting job, false = contractor offering service
}
