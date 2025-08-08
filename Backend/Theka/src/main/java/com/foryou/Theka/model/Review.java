package com.foryou.Theka.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    private Users client; // reviewer

    @ManyToOne
    private Users contractor; // reviewed contractor

    private Integer rating; // 1 to 5
    private String comment;

    //When inserting a new row, automatically set this field to the current timestamp.
    @CreationTimestamp
    private LocalDateTime createdAt;
}
