//
//  OTUIButton.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-23.
//

import UIKit

class OTUIButton: UIButton {
    /// Adds sub view with contraints enabled
    /// - Parameter view: the view to add
    internal func addSubviewForConstrainted(view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
