//
//  Book.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import Foundation
import UIKit

enum EnumGender{
    case romance
    case thriller
    case suspense
    case noir
}

class Book{
    var cover: UIImage
    var title: String
    var author: String
    var launchYear: Int
    var gender: EnumGender
    var rating: Rating // this is the average rating for every criteria
    var comments: [Comment]
    
    init(){
        self.cover = UIImage()
        self.title = ""
        self.author = ""
        self.gender = .romance
        self.launchYear = 0
        self.rating = Rating()
        self.comments = []
    }
    
    init(cover: UIImage, title: String, author: String, gender: EnumGender, launchYear: Int, rating: Rating, comments: [Comment]){
        self.cover = cover
        self.title = title
        self.author = author
        self.gender = gender
        self.launchYear = launchYear
        self.rating = rating
        self.comments = comments
    }
    
    func search(title: String) -> Book{
        //query the book based on title
        return Book()
    }
    
    func search(author: String) -> [Book]{
        //query books based on author
        return []
    }
    
    func search(gender: EnumGender) -> [Book]{
        //query books based on gender
        return []
    }
    
    func search(rating: Int) -> [Book]{
        //query all books based on a rating (use only the general rating)
        return []
    }
    
    func leaveAComment(loggedUser: User, comment: String){
        comments.append(Comment(user: loggedUser, comment: comment))
    }
}
