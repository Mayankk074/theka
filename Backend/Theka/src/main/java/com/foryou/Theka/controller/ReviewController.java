package com.foryou.Theka.controller;
import com.foryou.Theka.model.Review;
import com.foryou.Theka.service.ReviewService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class ReviewController {

    final private ReviewService reviewService;

    public ReviewController(ReviewService reviewService){
        this.reviewService=reviewService;
    }

    @PostMapping("/review")
    public ResponseEntity<Void> rateContractor(@RequestBody Review review){
        reviewService.rateContractor(review);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/review/{id}")
    public ResponseEntity<Double> getContractorRating(@PathVariable long id){
        Double rating=reviewService.getContractorRating(id);

        return new ResponseEntity<>(rating, HttpStatus.OK);
    }
}
