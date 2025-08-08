package com.foryou.Theka.service;

import com.foryou.Theka.model.UserProfile;
import com.foryou.Theka.repository.ProfileRepo;
import org.springframework.stereotype.Service;

@Service
public class ProfileService {
    private final ProfileRepo profileRepo;

    public ProfileService(ProfileRepo profileRepo){
        this.profileRepo=profileRepo;
    }
    public UserProfile getProfile(long id) {
        return profileRepo.findById(id).orElseThrow();
    }

    public UserProfile updateProfile(long id, UserProfile updatedProfile) {
        UserProfile existing = profileRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Profile not found"));

        // Update only fields that are allowed
        existing.setName(updatedProfile.getName());
        existing.setPhone(updatedProfile.getPhone());
        existing.setAddress(updatedProfile.getAddress());
        existing.setProfilePicUrl(updatedProfile.getProfilePicUrl());
        existing.setBio(updatedProfile.getBio());
        existing.setSkills(updatedProfile.getSkills());
        existing.setExperienceYears(updatedProfile.getExperienceYears());
        existing.setServiceType(updatedProfile.getServiceType());

        return profileRepo.save(existing);
    }
}
