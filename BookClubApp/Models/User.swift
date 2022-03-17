//
//  User.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import Foundation
import UIKit

class User{
    var photo: UIImage
    var username: String
    var password: String
    var bio: String
    var active: Bool
    
    init(){
        self.photo = UIImage()
        self.username = ""
        self.password = ""
        self.bio = ""
        self.active = true
    }
    
    init(username: String, password: String){
        self.photo = UIImage()
        self.username = username
        self.password = password
        self.bio = ""
        self.active = true
        
    }
    
//    init(username: String){
//        //loads all the info from the database for the user
//    }
    
    func updateUsernameAndPassword(username: String, password: String){
        self.username = username
        self.password = password
    }
    
    func updateBio(bio: String){
        self.bio = bio
    }
    
    func updateProfilePhoto(photo: UIImage){
        self.photo = photo
    }
    
    func unregister(){
        self.active = false
    }
    
    func search(username: String) -> User{
        //search in the database for users that have this username
//        ref.child("user")
//           .queryOrderedByChild("username")
//           .queryEqualToValue(username)
//           .observeSingleEventOfType(.Value, withBlock: { (snapshot) -> Void in
//
//           }
        return User()
    }
    
    func persist(){
        //persist all modifications in database
    }
    
}
