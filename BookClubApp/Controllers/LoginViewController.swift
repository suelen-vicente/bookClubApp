//
//  ViewController.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-16.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func touchUpinsideLoginButton(_ sender: Any) {
            guard let email = usernameTextField.text,
              !email.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty else{
              createAlertControllerOKAction(message: "You must fill both username and password.")
                  return
              }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }

            if error == nil {
                // Success
                let user = User(username: email, password: password)
                strongSelf.showMainView()
            } else {
                // Failure
                strongSelf.createAlertControllerOKAction( message: error?.localizedDescription ?? "")
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
    
    func createAlertControllerOKAction(message: String){
        let alertController = UIAlertController(title: "Attention!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)

        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showMainView(){
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }

}

