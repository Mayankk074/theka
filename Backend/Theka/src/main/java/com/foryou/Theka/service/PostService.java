package com.foryou.Theka.service;

import com.foryou.Theka.dto.PostFilterDto;
import com.foryou.Theka.model.Post;
import com.foryou.Theka.repository.PostRepo;
import jakarta.persistence.criteria.Predicate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PostService {

    private final PostRepo repo;

    public PostService(PostRepo repo){
        this.repo=repo;
    }


    public List<Post> allPosts() {
        return repo.findAll();
    }

    public Post createPost(Post post) {
        return repo.save(post);
    }

    public Post editPost(Post updatedPost) {
        return repo.save(updatedPost);
    }

    public Post getPost(long id) {
        return repo.findById(id).orElseThrow();
    }

    public void deletePost(long id) {
        repo.deleteById(id);
    }

    public List<Post> getPostsByUserId(long userId) {
        return repo.findAllByUserId(userId);
    }

    //Using Jpa Specification and Dto
    public List<Post> filterPost(PostFilterDto dto) {
        return repo.findAll((root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (dto.getSkills() != null) {
                predicates.add(cb.like(root.get("skills"), "%" + dto.getSkills() + "%"));
            }
            if (dto.getLocation() != null) {
                predicates.add(cb.equal(root.get("location"), dto.getLocation()));
            }

            if (dto.getCategory() != null) {
                predicates.add(cb.equal(root.get("category"), dto.getCategory()));
            }

            if (dto.getDateFrom() != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get("postedAt"), dto.getDateFrom()));
            }

            if (dto.getDateTo() != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get("postedAt"), dto.getDateTo()));
            }
            //sending single Predicate object
            return cb.and(predicates.toArray(new Predicate[0]));
        });
    }
}
