//
//  Shelf.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import Foundation

class Shelf{
    var user: User
    var currentReadings: [Book]
    var wishedReadings: [Book]
    var finishedReadings: [Book]
    var stared: [Book]
    
    init(){
        self.user = User()
        self.currentReadings = []
        self.wishedReadings = []
        self.finishedReadings = []
        self.stared = []
    }
    
    init(user: User){
        //loads all the lists from the database of the user
        self.user = user
        self.currentReadings = []
        self.wishedReadings = []
        self.finishedReadings = []
        self.stared = []
    }
    
    func addBookToCurrentReadings(book: Book){
        // loads the list from database
        self.currentReadings.append(book)
        //persists the changes in database
    }
    
    func addBookToWishedReadings(book: Book){
        // loads the list from database
        self.wishedReadings.append(book)
        //persists the changes in database
    }
    
    func addBookToFinishedReadings(book: Book){
        // loads the list from database
        self.finishedReadings.append(book)
        //persists the changes in database
    }
    
    func addBookToStared(book: Book){
        // loads the list from database
        self.stared.append(book)
        //persists the changes in database
    }
    
    func persist(){
        
    }
}
