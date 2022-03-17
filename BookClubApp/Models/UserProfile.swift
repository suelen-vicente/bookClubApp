//
//  UserProfile.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import Foundation

class UserProfile{
    var user: User
    var shelf: Shelf
    var followedProfiles: [User]
    
    init(){
        self.user = User()
        self.shelf = Shelf()
        self.followedProfiles = []
    }
}
