package com.foryou.Theka.service;

import com.foryou.Theka.model.Review;
import com.foryou.Theka.repository.ReviewRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    final private ReviewRepo reviewRepo;

    public ReviewService(ReviewRepo reviewRepo){
        this.reviewRepo=reviewRepo;
    }

    public void rateContractor(Review review) {
        reviewRepo.save(review);
    }

    public Double getContractorRating(long id) {
        //Getting all ratings of contractor
        List<Review> reviews=reviewRepo.findAllByContractorId(id);
        double sum=0;
        for(Review review:reviews){
            sum += review.getRating();
        }
        //Average of ratings
        return (sum/reviews.size());
    }
}
