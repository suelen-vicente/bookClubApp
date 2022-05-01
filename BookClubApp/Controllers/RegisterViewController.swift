//
//  RegisterViewController.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-17.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UITableViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
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
        guard let email = emailTextField.text,
              !email.isEmpty,
              let password = firstPasswordTextField.text,
              !password.isEmpty,
              let confirmPassword = secondPasswordTextField.text,
              !confirmPassword.isEmpty else{
                  showError(title: "Error Registering", message: "All fields must be filled.")
                  return
              }

        guard password == confirmPassword else{
            showError(title: "Error Registering", message: "Passwords do not match!")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if error == nil {
                // Success
                strongSelf.showMainScreen()
            } else {
                // Failure
                strongSelf.showError(title: "Error Registering", message: error?.localizedDescription)
            }
        }
    }

}
