//
//  Comment.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import Foundation

class Comment{
    var user: User
    var comment: String
    
    init(){
        self.user = User()
        self.comment = ""
    }
    
    init(user: User, comment: String){
        self.user = user
        self.comment = comment
    }
    
    func deleteComment(){
        //deletes the comment on the database
    }
    
    func editComment(editedComment: String){
        self.comment = editedComment
    }
}
