package com.foryou.Theka.repository;

import com.foryou.Theka.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepo  extends JpaRepository<Post, Long>, JpaSpecificationExecutor<Post> {
    List<Post> findAllByUserId(long userId);
}
