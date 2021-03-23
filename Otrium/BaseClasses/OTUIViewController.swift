//
//  OTUIViewController.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUIViewController: UIViewController {
    /// Adds sub view with contraints enabled
    /// - Parameter view: the view to add
    internal func addSubviewForConstrainted(view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
