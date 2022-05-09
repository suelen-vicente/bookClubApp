//
//  HomeTableViewCell.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-05-02.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    weak var cellDelegate: CollectionViewCellDelegate?
    
    var rowWithColors: [BookCollectionViewCellModel]?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        self.booksCollectionView.collectionViewLayout = flowLayout
        self.booksCollectionView.showsHorizontalScrollIndicator = false
        
//        self.booksCollectionView.dataSource = self
//        self.booksCollectionView.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        self.booksCollectionView.register(cellNib, forCellWithReuseIdentifier: "BookCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? BookCollectionViewCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
    
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [BookCollectionViewCellModel]) {
        self.rowWithColors = row
        self.booksCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rowWithColors?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell {
            cell.bookCoverImageView.backgroundColor = self.rowWithColors?[indexPath.item].color ?? UIColor.black
            cell.bookTitleLabel.text = self.rowWithColors?[indexPath.item].name ?? ""
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

protocol CollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: BookCollectionViewCell?, index: Int, didTappedInTableViewCell: HomeTableViewCell)
    // other delegate methods that you can define to perform action in viewcontroller
}
