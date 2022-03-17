//
//  BookClubAppTests.swift
//  BookClubAppTests
//
//  Created by Suelen Vicente on 2022-03-16.
//

import XCTest
@testable import BookClubApp

var user: User!
var book: Book!
var shelf: Shelf!
var bookRating: BookRating!
var rating: Rating!
var userProfile: UserProfile!
var comment: Comment!
class BookClubAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        user = User()
        book = Book()
        shelf = Shelf()
        bookRating = BookRating()
        rating = Rating()
        userProfile = UserProfile()
        comment = Comment()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        user = nil
        user = nil
        book = nil
        shelf = nil
        bookRating = nil
        rating = nil
        userProfile = nil
        comment = nil
        try super.tearDownWithError()
    }
    
    func testIfUserWasCreated(){
        //given
        let username = "sue"
        let password = "12345"
        
        //when
        user = User(username: "sue", password: "12345")
        
        // then
        XCTAssertEqual(user.username, username, "The username is not the same")
        XCTAssertEqual(user.password, password, "The username is not the same")
    }
    
    func testUpdateUserUsernameAndPassword(){
        //given
        let username = "sue"
        let password = "12345"
        
        //when
        user.updateUsernameAndPassword(username: username, password: password)
        
        //then
        XCTAssertEqual(user.username, username, "The username is not the same")
        XCTAssertEqual(user.password, password, "The password is not the same")
    }
    
    func testUpdateUserBio(){
        //given
        let bio = "Hey, my name is Sue and I really like reading books!"
        
        //when
        user = User(username: "sue", password: "12345")
        user.updateBio(bio: bio)
        
        //then
        XCTAssertEqual(user.bio, bio, "The bio is not the same")
    }
    
    func testUserUnregister(){
        //given
        user = User(username: "sue", password: "12345")
        
        //when
        user.unregister()
        
        //then
        XCTAssertEqual(user.active, false, "The user unregistering failed")
    }
    
    func testUpdateProfilePhoto(){
        //given
        let image = UIImage()
        
        //when
        user.updateProfilePhoto(photo: image)
        
        //then
        XCTAssertEqual(user.photo, image, "The user photo update failed")
    }
    
    func testCreateComment(){
        //given
        let user = User(username: "sue", password: "12345")
        let commentString = "hey, this book is awesome!"
        
        //when
        comment = Comment(user: user, comment: commentString)
        
        //then
        XCTAssertEqual(comment.user.username, user.username, "User creation failed.")
        XCTAssertEqual(comment.comment, commentString, "Comment creation failed.")
    }
    
    func testEditingComment(){
        //given
        let user = User(username: "sue", password: "12345")
        let commentOriginal = "hey, this is my original comment"
        let commentEdited = "hey, this is my edited comment"
        
        //when
        comment = Comment(user: user, comment: commentOriginal)
        comment.editComment(editedComment: commentEdited)
        
        //then
        XCTAssertEqual(comment.user.username, user.username, "User creation failed.")
        XCTAssertEqual(comment.comment, commentEdited, "Comment edition failed.")
    }
    
    func testBookCreation(){
        //given
        
        // user
        user = User(username: "sue", password: "12345")
        
        // comments
        let comment1 = Comment(user: user, comment: "this is my first comment")
        let comment2 = Comment(user: user, comment: "this is my second comment")
        let comment3 = Comment(user: user, comment: "this is my third comment")
        
        // book info
        let cover = UIImage()
        let title = "Title"
        let author = "Author"
        let launchYear = 2000
        let gender = EnumGender.romance
        let rating = Rating(writingRating: 5, plotRating: 3, characterRating: 5, endingRating: 3)
        let comments = [comment1, comment2, comment3]
        
        //when
        book = Book(cover: cover, title: title, author: author, gender: gender, launchYear: launchYear, rating: rating, comments: comments)
        
        //then
        XCTAssertEqual(book.cover, cover, "Book cover is wrong.")
        XCTAssertEqual(book.title, title, "Book title is wrong.")
        XCTAssertEqual(book.author, author, "Book author is wrong.")
        XCTAssertEqual(book.launchYear, launchYear, "Book launchYear is wrong.")
        XCTAssertEqual(book.gender, gender, "Book gender is wrong.")
        XCTAssertEqual(book.rating.generalRating, rating.generalRating, "Book general rating is wrong.")
        XCTAssertEqual(book.rating.writingQualityRating, rating.writingQualityRating, "Book writing rating is wrong.")
        XCTAssertEqual(book.rating.plotRating, rating.plotRating, "Book plot rating is wrong.")
        XCTAssertEqual(book.rating.characterRating, rating.characterRating, "Book character rating is wrong.")
        XCTAssertEqual(book.rating.endingRating, rating.endingRating, "Book ending rating is wrong.")
        XCTAssertEqual(book.comments[0].comment, comments[0].comment, "Book first comments is wrong.")
        XCTAssertEqual(book.comments[1].comment, comments[1].comment, "Book second comments is wrong.")
        XCTAssertEqual(book.comments[2].comment, comments[2].comment, "Book third comments is wrong.")
    }
    
    func testBookLeavingAComment(){
        //given
        //existing data
        user = User(username: "sue", password: "12345")
        
        let comment1 = Comment(user: user, comment: "First Comment")
        let comment2 = Comment(user: user, comment: "Second Comment")
        let comment3 = Comment(user: user, comment: "Third Comment")
        let comments = [comment1, comment2, comment3]
        book = Book(cover: UIImage(), title: "Test Book", author: "Test Author", gender: EnumGender.suspense, launchYear: 2020, rating: Rating(), comments: comments)
        
        // new comment
        let otherUser = User(username: "user2", password: "12345")
        let forthComment = "This is my comment"
        
        //when
        book.leaveAComment(loggedUser: otherUser, comment: forthComment)
        
        //then
        
        //checks if all the existing comments are still the same
        XCTAssertEqual(book.comments[0].user.username, comments[0].user.username, "Book first comment user is wrong.")
        XCTAssertEqual(book.comments[0].comment, comments[0].comment, "Book first comment is wrong.")
        XCTAssertEqual(book.comments[1].user.username, comments[1].user.username, "Book second comment user is wrong.")
        XCTAssertEqual(book.comments[1].comment, comments[1].comment, "Book second comment is wrong.")
        XCTAssertEqual(book.comments[2].user.username, comments[2].user.username, "Book third comment user is wrong.")
        XCTAssertEqual(book.comments[2].comment, comments[2].comment, "Book third comment is wrong.")
        
        //checks if the new comment was added to the list of comments in the book
        XCTAssertEqual(book.comments[3].user.username, otherUser.username, "Book forth comment user is wrong.")
        XCTAssertEqual(book.comments[3].comment, forthComment, "Book forth comment is wrong.")
    }
    
    func testGeneralRatingBook(){
        //given
        let users = creates20Users()
        let comments = creates5Comments(users: users)
        let books = creates10Books(comments: comments)
        
        //when
        let rating = Rating(generalRating: 5)
        let bookRating = BookRating(user: users[0], book: books[0], rating: rating)
        
        //then
        XCTAssertEqual(bookRating.user?.username, users[0].username, "Rating user is wrong.")
        XCTAssertEqual(bookRating.book.title, books[0].title, "Rating book is wrong.")
        XCTAssertEqual(bookRating.rating.generalRating, rating.generalRating, "General rating is wrong.")
    }
    
    func testAverageGeneralRatingBook(){
        //given
        let users = creates20Users()
        let comments = creates5Comments(users: users)
        let books = creates10Books(comments: comments)
        let ratings = creates10GeneralRatings()
        let book = books[0]
        let bookRatings = creates10RatingsForBook(book: book, users: users, ratings: ratings)
        let givenAverageRating = 3
        
        //when
        let averageRating = bookRating.returnAverageGeneralRating(bookRatings: bookRatings)
        
        //then
        XCTAssertEqual(averageRating, givenAverageRating, "averageRating: \(averageRating)")
    }
    
    func testCalculateAverageSpecificRating(){
        //given
        let users = creates20Users()
        let comments = creates5Comments(users: users)
        let books = creates10Books(comments: comments)
        let ratings = creates10SpecificRatings()
        let bookRatings = creates10RatingsForBook(book: books[0], users: users, ratings: ratings)
        
        let givenRating = Rating(writingRating: 3, plotRating: 3, characterRating: 3, endingRating: 3)
        
        //when
        let averageRating = bookRating.returnAverageSpecificRatingBasedOnSpecific(bookRatings: bookRatings)
        
        //then
        XCTAssertEqual(averageRating.writingQualityRating, givenRating.writingQualityRating, "writingQualityRating: \(averageRating.writingQualityRating)")
        XCTAssertEqual(averageRating.plotRating, givenRating.plotRating, "plotRating: \(averageRating.plotRating)")
        XCTAssertEqual(averageRating.characterRating, givenRating.characterRating, "characterRating: \(averageRating.characterRating)")
        XCTAssertEqual(averageRating.endingRating, givenRating.endingRating, "endingRating: \(averageRating.endingRating)")
    }
    
    func testUpdateAverageBookRating(){
        //given
        let users = creates20Users()
        let comments = creates5Comments(users: users)
        let books = creates10Books(comments: comments)
        let rating = Rating(generalRating: 5)
        let bookRating = BookRating(user: users[0], book: books[0], rating: rating)
        
        //when
        let updatedRating = Rating(generalRating: 4)
        bookRating.rating = updatedRating
        
        //then
        XCTAssertEqual(bookRating.rating.generalRating, updatedRating.generalRating, "Rating was not updated.")
    }

    func testUpdateSpecificRating(){
        //given
        let users = creates20Users()
        let comments = creates5Comments(users: users)
        let books = creates10Books(comments: comments)
        let rating = Rating(writingRating: 5, plotRating: 3, characterRating: 3, endingRating: 5)
        let bookRating = BookRating(user: users[0], book: books[0], rating: rating)
        
        //when
        let updatedRating = Rating(writingRating: 5, plotRating: 5, characterRating: 5, endingRating: 5)
        bookRating.rating = updatedRating
        
        //then
        XCTAssertEqual(bookRating.rating.generalRating, updatedRating.generalRating, "General rating was not updated.")
        XCTAssertEqual(bookRating.rating.writingQualityRating, updatedRating.writingQualityRating, "Writing rating was not updated.")
        XCTAssertEqual(bookRating.rating.plotRating, updatedRating.plotRating, "Plot rating was not updated.")
        XCTAssertEqual(bookRating.rating.characterRating, updatedRating.characterRating, "Character rating was not updated.")
        XCTAssertEqual(bookRating.rating.endingRating, updatedRating.endingRating, "Ending rating was not updated.")
    }
    
    func creates20Users() -> [User]{
        let user1 = User(username: "user1", password: "12345")
        let user2 = User(username: "user2", password: "12345")
        let user3 = User(username: "user3", password: "12345")
        let user4 = User(username: "user4", password: "12345")
        let user5 = User(username: "user5", password: "12345")
        let user6 = User(username: "user6", password: "12345")
        let user7 = User(username: "user7", password: "12345")
        let user8 = User(username: "user8", password: "12345")
        let user9 = User(username: "user9", password: "12345")
        let user10 = User(username: "user10", password: "12345")
        let user11 = User(username: "user11", password: "12345")
        let user12 = User(username: "user12", password: "12345")
        let user13 = User(username: "user13", password: "12345")
        let user14 = User(username: "user14", password: "12345")
        let user15 = User(username: "user15", password: "12345")
        let user16 = User(username: "user16", password: "12345")
        let user17 = User(username: "user17", password: "12345")
        let user18 = User(username: "user18", password: "12345")
        let user19 = User(username: "user19", password: "12345")
        let user20 = User(username: "user20", password: "12345")
        
        return [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, user11, user12, user13, user14, user15, user16, user17, user18, user19, user20]
    }
    
    func creates5Comments(users: [User]) -> [Comment]{
        let comment1 = Comment(user: users[0], comment: "First comment")
        let comment2 = Comment(user: users[1], comment: "Second comment")
        let comment3 = Comment(user: users[2], comment: "Third comment")
        let comment4 = Comment(user: users[3], comment: "Forth comment")
        let comment5 = Comment(user: users[4], comment: "Fifth comment")
        
        return [comment1, comment2, comment3, comment4, comment5]
    }
    
    func creates10Books(comments: [Comment]) -> [Book]{
        let book1 = Book(cover: UIImage(), title: "Test Book 1", author: "Author Test 1", gender: EnumGender.suspense, launchYear: 2020, rating: Rating(), comments: comments)
        
        let book2 = Book(cover: UIImage(), title: "Test Book 2", author: "Author Test 2", gender: EnumGender.romance, launchYear: 2021, rating: Rating(), comments: comments)
        
        let book3 = Book(cover: UIImage(), title: "Test Book 3", author: "Author Test 3", gender: EnumGender.noir, launchYear: 1999, rating: Rating(), comments: comments)
        
        let book4 = Book(cover: UIImage(), title: "Test Book 4", author: "Author Test 4", gender: EnumGender.thriller, launchYear: 1998, rating: Rating(), comments: comments)
        
        let book5 = Book(cover: UIImage(), title: "Test Book 5", author: "Author Test 5", gender: EnumGender.romance, launchYear: 2009, rating: Rating(), comments: comments)
        
        let book6 = Book(cover: UIImage(), title: "Test Book 6", author: "Author Test 6", gender: EnumGender.suspense, launchYear: 1970, rating: Rating(), comments: comments)
        
        let book7 = Book(cover: UIImage(), title: "Test Book 7", author: "Author Test 7", gender: EnumGender.noir, launchYear: 1980, rating: Rating(), comments: comments)
        
        let book8 = Book(cover: UIImage(), title: "Test Book 8", author: "Author Test 8", gender: EnumGender.romance, launchYear: 2010, rating: Rating(), comments: comments)
        
        let book9 = Book(cover: UIImage(), title: "Test Book 9", author: "Author Test 9", gender: EnumGender.thriller, launchYear: 2020, rating: Rating(), comments: comments)
        
        let book10 = Book(cover: UIImage(), title: "Test Book 10", author: "Author Test 10", gender: EnumGender.noir, launchYear: 2007, rating: Rating(), comments: comments)
        
        return [book1, book2, book3, book4, book5, book6, book7, book8, book9, book10]
    }
    
    func creates10GeneralRatings() -> [Rating]{
        let rating1 = Rating(generalRating: 1)
        let rating2 = Rating(generalRating: 2)
        let rating3 = Rating(generalRating: 3)
        let rating4 = Rating(generalRating: 4)
        let rating5 = Rating(generalRating: 5)
        let rating6 = Rating(generalRating: 5)
        let rating7 = Rating(generalRating: 5)
        let rating8 = Rating(generalRating: 3)
        let rating9 = Rating(generalRating: 4)
        let rating10 = Rating(generalRating: 1)
        
        return [rating1, rating2, rating3, rating4, rating5, rating6, rating7, rating8, rating9, rating10]
    }
    
    func creates10SpecificRatings() -> [Rating]{
        let rating1 = Rating(writingRating: 1, plotRating: 2, characterRating: 1, endingRating: 1)
        let rating2 = Rating(writingRating: 5, plotRating: 5, characterRating: 3, endingRating: 2)
        let rating3 = Rating(writingRating: 4, plotRating: 4, characterRating: 3, endingRating: 5)
        let rating4 = Rating(writingRating: 3, plotRating: 5, characterRating: 5, endingRating: 1)
        let rating5 = Rating(writingRating: 1, plotRating: 4, characterRating: 4, endingRating: 4)
        let rating6 = Rating(writingRating: 5, plotRating: 5, characterRating: 5, endingRating: 5)
        let rating7 = Rating(writingRating: 4, plotRating: 4, characterRating: 3, endingRating: 3)
        let rating8 = Rating(writingRating: 3, plotRating: 3, characterRating: 3, endingRating: 3)
        let rating9 = Rating(writingRating: 5, plotRating: 1, characterRating: 1, endingRating: 5)
        let rating10 = Rating(writingRating: 3, plotRating: 2, characterRating: 2, endingRating: 2)
        
        //Average
        //writing: 3.4 plot: 3.5 char: 3 ending: 3.1
        
        return [rating1, rating2, rating3, rating4, rating5, rating6, rating7, rating8, rating9, rating10]
    }
    
    func creates10RatingsForBook(book: Book, users: [User], ratings: [Rating]) -> [BookRating]{
    
        let bookRating1 = BookRating(user: users[0], book: book, rating: ratings[0])
        let bookRating2 = BookRating(user: users[1], book: book, rating: ratings[1])
        let bookRating3 = BookRating(user: users[2], book: book, rating: ratings[2])
        let bookRating4 = BookRating(user: users[3], book: book, rating: ratings[3])
        let bookRating5 = BookRating(user: users[4], book: book, rating: ratings[4])
        let bookRating6 = BookRating(user: users[5], book: book, rating: ratings[5])
        let bookRating7 = BookRating(user: users[6], book: book, rating: ratings[6])
        let bookRating8 = BookRating(user: users[7], book: book, rating: ratings[7])
        let bookRating9 = BookRating(user: users[8], book: book, rating: ratings[8])
        let bookRating10 = BookRating(user: users[9], book: book, rating: ratings[9])
        
        return [bookRating1, bookRating2, bookRating3, bookRating4, bookRating5, bookRating6, bookRating7, bookRating8, bookRating9, bookRating10]
    }
    
    

}
