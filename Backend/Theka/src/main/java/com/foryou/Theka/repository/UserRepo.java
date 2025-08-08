package com.foryou.Theka.repository;

import com.foryou.Theka.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<Users, Integer> {
    Users findUserByEmail(String email);
}
