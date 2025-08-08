package com.foryou.Theka.repository;

import com.foryou.Theka.model.UserProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileRepo extends JpaRepository<UserProfile, Long> {
}
