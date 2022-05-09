//
//  HomeViewController.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-03-17.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCoverImageView: UIImageView!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    //This will be replaced by books and was used only for test
    var colorsArray = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Need to put those lines in here to inform the app that this is the view responsible
        //for filling and configuring the table view
        homeTableView.delegate = self
        homeTableView.dataSource = self

        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        self.homeTableView.register(cellNib, forCellReuseIdentifier: "HomeTableViewCell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.objectsArray[section].subcategory.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // Category Title
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.green
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 200, height: 44))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = colorsArray.objectsArray[section].category
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell {
            
            cell.cellDelegate = self
            
            // Show SubCategory Title
            // Probably this will not be used
            let subCategoryTitle = colorsArray.objectsArray[indexPath.section].subcategory
            cell.categoryLabel.text = subCategoryTitle[indexPath.row]
            
            // Pass the data to colletionview inside the tableviewcell
            let rowArray = colorsArray.objectsArray[indexPath.section].colors[indexPath.row]
            cell.updateCellWith(row: rowArray)
            
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeViewController: CollectionViewCellDelegate {
    func collectionView(collectionviewcell: BookCollectionViewCell?, index: Int, didTappedInTableViewCell: HomeTableViewCell) {
        if let colorsRow = didTappedInTableViewCell.rowWithColors {
            print("You tapped the cell \(index) in the row of colors \(colorsRow)")
            // You can also do changes to the cell you tapped using the 'collectionviewcell'
        }
    }
}
