//
//  ViewController.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func touchUpinsideLoginButton(_ sender: Any) {
            guard let email = emailTextField.text,
              !email.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty else{
                  showError(title: "Login Error", message: "You must fill both username and password.")
                  return
              }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }

            if error == nil {
                // Success
                let user = User(username: email, password: password)
                strongSelf.showMainScreen()
            } else {
                // Failure
                strongSelf.showError(title: "Incorrect Login or password", message: error?.localizedDescription)
            }

        }
    }
    
    @IBAction func touchUpInsideRegisterButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        let navVC = UINavigationController(rootViewController: registerVC)
        
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }

}

