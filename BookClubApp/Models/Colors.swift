//
//  Colors.swift
//  BookClubApp
//
//  Created by Suelen Vicente on 2022-05-04.
//

import Foundation
import UIKit

struct Colors {
    var objectsArray = [
        BooksTableViewCellModel(
            category: "Category #1",
            subcategory: ["SubCategory #1.1", "SubCategory #1.2"],
            colors: [
                // SubCategory #1.1
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#DA70D6"), name: "Orchid"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FA8072"), name: "Salmon"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FDF5E6"), name: "Old Lace"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#00FFFF"), name: "Aqua"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#2E8B57"), name: "Sea Green")],
                // SubCategory #1.2
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#2F4F4F"), name: "Dark Slate Gray"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#F0FFF0"), name: "Honeydew"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#DCDCDC"), name: "Gainsboro")]
            ]),
        BooksTableViewCellModel(
            category: "Category #2",
            subcategory: ["SubCategory #2.1"],
            colors: [
                // SubCategory #2.1
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#FFE4B5"), name: "Moccasin"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#AFEEEE"), name: "Pale Turquoise"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#9400D3"), name: "Dark Violet"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#3CB371"), name: "Medium Sea Green")]
            ]),
        BooksTableViewCellModel(
            category: "Category #3",
            subcategory: ["SubCategory #3.1", "SubCategory #3.2"],
            colors: [
                // SubCategory #3.1
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#FF6347"), name: "Tomato"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#4682B4"), name: "Steel Blue"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#778899"), name: "Light Slate Gray"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#191970"), name: "Midnight Blue"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#A52A2A"), name: "Brown")],
                // SubCategory #3.2
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#FFF8DC"), name: "Cornsilk"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FF00FF"), name: "Magenta"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#7CFC00"), name: "Lawn Green"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#000000"), name: "Black"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#00BFFF"), name: "Deep Sky Blue"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#6495ED"), name: "Cornflower Blue"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FF8C00"), name: "Dark Orange"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#20B2AA"), name: "Light Sea Green"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FFC0CB"), name: "Pink")]
            ]),
        BooksTableViewCellModel(
            category: "Category #4",
            subcategory: ["SubCategory #4.1", "SubCategory #4.2"],
            colors: [
                // SubCategory #4.1
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#DDA0DD"), name: "Plum"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FFF5EE"), name: "Seashell"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FFDEAD"), name: "Navajo White"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#00FF00"), name: "Lime"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#F0E68C"), name: "Khaki")],
                // SubCategory #4.2
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#FAEBD7"), name: "Antique White"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#C71585"), name: "Medium Violet Red"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#6B8E23"), name: "Olive Drab"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FF4500"), name: "Orange Red"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FFF0F5"), name: "Lavender Blush")]
            ]),
        BooksTableViewCellModel(
            category: "Category #5",
            subcategory: ["SubCategory #5.1", "SubCategory #5.2"],
            colors: [
                // SubCategory #5.1
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#9966CC"), name: "Amethyst")],
                // SubCategory #5.2
                [BookCollectionViewCellModel(color: UIColor.colorFromHex("#7B68EE"), name: "Medium Slate Blue"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#800000"), name: "Maroon"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FFA07A"), name: "Light Salmon"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#E6E6FA"), name: "Lavender"),
                 BookCollectionViewCellModel(color: UIColor.colorFromHex("#FFE4C4"), name: "Bisque")]
            ])
    ]
}

extension UIColor {
    static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
    }
    
    static func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            return UIColor.magenta
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor(red: CGFloat((rgb & 0xFF0000) >> 16) / 255,
                       green: CGFloat((rgb & 0x00FF00) >> 8) / 255,
                       blue: CGFloat(rgb & 0x0000FF) / 255,
                       alpha: 1.0)
    }
}
