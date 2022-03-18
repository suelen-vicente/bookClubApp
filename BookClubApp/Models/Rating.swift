//
//  BookRating.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import Foundation

class Rating{
    var generalRating: Int
    var writingQualityRating: Int
    var plotRating: Int
    var characterRating: Int
    var endingRating: Int
    
    init(){
        self.generalRating = 0
        self.writingQualityRating = 0
        self.plotRating = 0
        self.characterRating = 0
        self.endingRating = 0
    }
    
    init(generalRating: Int){
        self.generalRating = generalRating
        self.writingQualityRating = 0
        self.plotRating = 0
        self.characterRating = 0
        self.endingRating = 0
    }
    
    init(writingRating: Int, plotRating: Int, characterRating: Int, endingRating: Int){
        self.writingQualityRating = writingRating
        self.plotRating = plotRating
        self.characterRating = characterRating
        self.endingRating = endingRating
        self.generalRating = (writingRating + plotRating + characterRating + endingRating)/4
    }
    
}
