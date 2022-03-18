//
//  ShelfViewController.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-17.
//

import UIKit

class ShelfViewController: UIViewController {
    
    @IBAction func touchUpInsideBookButton(_ sender: Any) {
        navigationController?.pushViewController(BookViewController(), animated: true)
    }
}
