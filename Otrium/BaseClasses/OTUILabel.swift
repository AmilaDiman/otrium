//
//  OTUILabel.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUILabel: UILabel {

    init() {
        super.init(frame: .zero)
        self.font = UIFont.init(name: "Source Sans Pro", size: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
