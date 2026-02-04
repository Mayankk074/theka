package com.foryou.Theka.dto;

import com.foryou.Theka.model.UserProfile;
import com.foryou.Theka.model.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsersDto {

    private long id;
    private String email;
    private UserRole role;

    private UserProfileDto userProfile;
}
