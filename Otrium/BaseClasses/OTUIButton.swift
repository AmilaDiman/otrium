//
//  OTUIButton.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-23.
//

import UIKit

class OTUIButton: UIButton {

    func addSubviewForContraints(view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }

}
