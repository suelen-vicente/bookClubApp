//
//  BookRating.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import Foundation

class BookRating{
    var user: User?
    var book: Book
    var rating: Rating
    
    init(){
        self.user = User()
        self.book = Book()
        self.rating = Rating()
    }
    
    init(book: Book){
        self.book = book
        self.rating = Rating()
    }
    
    init(user: User, book: Book, rating: Rating){
        self.user = user
        self.book = book
        self.rating = rating
    }
    
    func returnAverageGeneralRating(bookRatings: [BookRating]) -> Int{
        var averageRate = 0;
        var ratingCount = 0;
        
        for bookRating in bookRatings{
            if bookRating.rating.generalRating != 0{
                averageRate += bookRating.rating.generalRating
                ratingCount += 1
            }
        }
        
        return Int(averageRate/ratingCount)
    }
    
    func returnAverageSpecificRatingBasedOnSpecific(bookRatings: [BookRating]) -> Rating{
        var writingRating = 0;
        var plotRating = 0;
        var characterRating = 0;
        var endingRating = 0;
        
        var writingRatingCount = 0;
        var plotRatingCount = 0;
        var characterRatingCount = 0;
        var endingRatingCount = 0;
        
        for rating in bookRatings {
            if rating.rating.writingQualityRating != 0{
                writingRating += rating.rating.writingQualityRating
                writingRatingCount += 1
            }
            
            if rating.rating.plotRating != 0{
                plotRating += rating.rating.plotRating
                plotRatingCount += 1
            }
            
            if rating.rating.characterRating != 0{
                characterRating += rating.rating.characterRating
                characterRatingCount += 1
            }
            
            if rating.rating.endingRating != 0{
                endingRating += rating.rating.endingRating
                endingRatingCount += 1
            }
        }
        
        writingRating = Int(writingRating/writingRatingCount)
        plotRating = Int(plotRating/plotRatingCount)
        characterRating = Int(characterRating/characterRatingCount)
        endingRating = Int(endingRating/endingRatingCount)
        
        return Rating(writingRating: writingRating, plotRating: plotRating, characterRating: characterRating, endingRating: endingRating)
    }
    
    func updateRating(rating: Rating){
        self.rating = rating
    }
}
