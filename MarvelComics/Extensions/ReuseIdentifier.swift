//
//  ReuseIdentifier.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/5/22.
//

import UIKit.UICollectionViewCell

/// Provides a default reuse id for collectionview cells
extension UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
