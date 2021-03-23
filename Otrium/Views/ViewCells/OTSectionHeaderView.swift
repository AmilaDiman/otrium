//
//  OTSectionHeaderView.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-23.
//

import UIKit

class OTSectionHeaderView: OTUIView {

    lazy var usernameLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "Source Sans Pro", size: 16)
        label.text = "Amila"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
    }
}
