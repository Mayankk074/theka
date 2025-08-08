package com.foryou.Theka.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostFilterDto {
    private String skills;
    private String category;
    private LocalDate dateFrom;
    private LocalDate dateTo;
    private String location;
    // Add more as needed
}
