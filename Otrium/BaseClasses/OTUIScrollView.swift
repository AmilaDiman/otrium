//
//  OTUIScrollView.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUIScrollView: UIScrollView {
    /// Adds sub view with contraints enabled
    /// - Parameter view: the view to add
    internal func addSubviewForConstrainted(view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

