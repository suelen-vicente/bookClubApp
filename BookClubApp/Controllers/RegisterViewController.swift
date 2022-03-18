//
//  RegisterViewController.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-17.
//

import UIKit

class RegisterViewController: UITableViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var firstPasswordTextField: UITextField!
    
    @IBOutlet weak var secondPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Register"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed))
    }
    
    @objc
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func touchUpInsideRegisterButton(_ sender: Any) {
        if validUserInfo(){
            showMainScreen()
        }
    }
    
    func showMainScreen(){
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
    
    func validUserInfo() -> Bool{
        guard let username = usernameTextField.text,
              !username.isEmpty,
              let password = firstPasswordTextField.text,
              !password.isEmpty,
              let confirmPassword = secondPasswordTextField.text,
              !confirmPassword.isEmpty else{
                  createAlertControllerOKAction(message: "All fields must be filled.")
                  return false
              }
        
        guard password == confirmPassword else{
            createAlertControllerOKAction(message: "Passwords do not match!")
            return false
        }
        
        return true
    }
    
    func createAlertControllerOKAction(message: String){
        let alertController = UIAlertController(title: "Attention!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)

        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
