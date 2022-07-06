//
//  CollectionViewCell.swift
//  Redo_EALauKaPui
//
//  Created by Cyrus on 25/5/2021.
//

//collectionView:
import UIKit
class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var collectionViewCellButton:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
}
//collectionView end
