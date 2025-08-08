package com.foryou.Theka.controller;

import com.foryou.Theka.dto.PostFilterDto;
import com.foryou.Theka.model.Post;
import com.foryou.Theka.service.PostService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PostController {

    private final PostService service;

    public PostController(PostService service){
        this.service=service;
    }

    @GetMapping("/posts")
    public ResponseEntity<List<Post>> allPosts(){
        List<Post> posts= service.allPosts();
        return ResponseEntity.ok(posts);
    }

    @PostMapping("/posts")
    public ResponseEntity<Post> createPost(@RequestBody Post post){
        Post post1=service.createPost(post);
        return new ResponseEntity<>(post1, HttpStatus.CREATED);
    }

    @PutMapping("/posts/{id}")
    public ResponseEntity<Post> editPost(@PathVariable long id, @RequestBody Post post){
        if (post.getId() != id) {
            throw new IllegalArgumentException("Post ID in URL and body must match");
        }
        Post updatedPost=service.editPost(post);
        return ResponseEntity.ok(updatedPost);
    }

    @GetMapping("/posts/{id}")
    public ResponseEntity<Post> getPost(@PathVariable long id){
        Post post=service.getPost(id);

        return ResponseEntity.ok(post);
    }

    @DeleteMapping("/posts/{id}")
    public ResponseEntity<Void> deletePost(@PathVariable long id){
        service.deletePost(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/posts/filter")
    public ResponseEntity<List<Post>> filterPost(@RequestBody PostFilterDto filterDto){
        List<Post> filteredPost=service.filterPost(filterDto);

        return ResponseEntity.ok(filteredPost);
    }

}
