package com.foryou.Theka.controller;

import com.foryou.Theka.dto.UserResponseDto;
import com.foryou.Theka.model.Post;
import com.foryou.Theka.model.Users;
import com.foryou.Theka.service.PostService;
import com.foryou.Theka.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {
    private final UserService userService;
    private final PostService postService;

    public UserController(UserService userService, PostService postService){
        this.userService=userService;
        this.postService=postService;
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestBody Users user){
        String token=userService.verify(user);

        if(token != null){
            Map<String, Object> response = new HashMap<>();
            response.put("token", token);
            response.put("user", user);
            return new ResponseEntity<>(response, HttpStatus.OK);
        }else{
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    }

    @PostMapping("/register")
    public ResponseEntity<Map<String, UserResponseDto>> register(@RequestBody Users user){
        Users user1=userService.register(user);
        UserResponseDto dto=new UserResponseDto(user1.getId(), user1.getProfile().getId(), user1.getEmail());
        Map<String, UserResponseDto> response = new HashMap<>();
        response.put("user", dto);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/users/{userId}/posts")
    public ResponseEntity<List<Post>> getUserPosts(@PathVariable long userId){
        List<Post> userPosts=postService.getPostsByUserId(userId);

        return new ResponseEntity<>(userPosts, HttpStatus.OK);
    }
}
