package com.foryou.Theka.controller;

import com.foryou.Theka.dto.UserProfileDto;
import com.foryou.Theka.model.UserProfile;
import com.foryou.Theka.service.ProfileService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/profiles")
public class ProfileController {
    private final ProfileService profileService;

    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserProfileDto> getProfile(@PathVariable long id){
        UserProfile profile=profileService.getProfile(id);
        UserProfileDto dto= UserProfileDto.fromEntity(profile);
        return ResponseEntity.ok(dto);
    }

    @PutMapping("/{id}")
    public ResponseEntity<UserProfileDto> updateProfile(@PathVariable long id, @RequestBody UserProfile profile){
        UserProfile updatedProfile=profileService.updateProfile(id, profile);
        UserProfileDto dto= UserProfileDto.fromEntity(updatedProfile);
        return ResponseEntity.ok(dto);
    }




}
