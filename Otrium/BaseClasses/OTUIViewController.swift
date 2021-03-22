//
//  OTUIViewController.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension OTUIViewController {
    func addSubviewForContraints(view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
