package com.foryou.Theka.dto;


import com.foryou.Theka.model.UserProfile;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserProfileDto {

    private long id;

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

    public static UserProfileDto fromEntity(UserProfile profile) {
        return new UserProfileDto(
                profile.getId(), profile.getName(), profile.getPhone(), profile.getAddress(),
                profile.getProfilePicUrl(), profile.getBio(), profile.getSkills(), profile.getExperienceYears(),
                profile.getServiceType(), profile.getRating(), profile.getNumReviews()
        );
    }
}
