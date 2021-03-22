//
//  OTUIScrollView.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUIScrollView: UIScrollView {

}

extension OTUIScrollView {
    func addSubviewForContraints(view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
