package com.foryou.Theka.service;

import com.foryou.Theka.model.UserProfile;
import com.foryou.Theka.model.Users;
import com.foryou.Theka.repository.ProfileRepo;
import com.foryou.Theka.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepo userRepo;
    private final ProfileRepo profileRepo;
    private final JwtService jwtService;
    private final AuthenticationManager authManager;

    public UserService(UserRepo userRepo, ProfileRepo profileRepo, JwtService jwtService,
                       AuthenticationManager authManager) {
        this.userRepo = userRepo;
        this.profileRepo=profileRepo;
        this.jwtService=jwtService;
        this.authManager=authManager;
    }

    //For encoding password text to non-readable text
    @Autowired
    private BCryptPasswordEncoder encoder;

    public Users register(Users user){
        //encode the password first then save it in user object.
        user.setPassword(encoder.encode(user.getPassword()));
        UserProfile profile = user.getProfile();

        if (profile != null) {
            profile.setUser(user); //UserProfile is the owning side so you need to setUser.
        }

        return userRepo.save(user);
    }

    //Here authenticationManager will send the user to authenticationProvider
    // and that will verify
    public String verify(Users user) {
        Authentication authentication=
                authManager.authenticate(new UsernamePasswordAuthenticationToken(
                        user.getEmail(), user.getPassword()));

        if(authentication.isAuthenticated())
            return jwtService.generateToken(user.getEmail());

        return "fail";
    }
}
