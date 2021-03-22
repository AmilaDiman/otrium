//
//  OTUICollectionViewCell.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUICollectionViewCell: UICollectionViewCell {
    
}

extension OTUICollectionViewCell {
    func addSubviewForContraints(view: UIView) {
        self.contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
