//
//  ItemLabel.swift
//  Test1
//
//  Created by chandrasekhar yadavally on 7/24/21.
//

import UIKit

class ItemLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 26, weight: .ultraLight)
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        numberOfLines = 1
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
