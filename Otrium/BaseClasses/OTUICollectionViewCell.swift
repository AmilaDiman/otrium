//
//  OTUICollectionViewCell.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUICollectionViewCell: UICollectionViewCell {
    /// Adds sub view with contraints enabled
    /// - Parameter view: the view to add
    internal func addSubviewForConstrainted(view: UIView) {
        self.contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
