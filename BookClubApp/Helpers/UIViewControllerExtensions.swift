//
//  UIViewControllerExtensions.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-05-01.
//

import Foundation
import UIKit

extension UIViewController {
    func showError(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showMainScreen(){
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
    
//    func showLogin(animated: Bool) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
//        loginViewController.modalPresentationStyle = .fullScreen
//        present(loginViewController, animated: animated, completion: nil)
//    }
}
