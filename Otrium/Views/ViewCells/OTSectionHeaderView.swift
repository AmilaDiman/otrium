//
//  OTSectionHeaderView.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-23.
//

import UIKit

class OTSectionHeaderView: OTUIView {

    lazy var titleLabel : OTUILabel = {
        let label = OTUILabel()
        label.font = UIFont.init(name: "SourceSansPro-SemiBold", size: 24)
        label.text = "Repositories"
        return label
    }()
    
    lazy var viewAllButton : OTUIButton = {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "SourceSansPro-SemiBold", size: 16)!,
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "View all",
                                                         attributes: attributes)
        let button = OTUIButton()
        button.setAttributedTitle(attributeString, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubviewForConstraints(view: titleLabel)
        addSubviewForConstraints(view: viewAllButton)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: viewAllButton.leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            viewAllButton.heightAnchor.constraint(equalToConstant: 32),
            viewAllButton.widthAnchor.constraint(equalToConstant: 60),
            viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewAllButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
