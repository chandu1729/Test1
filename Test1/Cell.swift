//
//  Cell.swift
//  Test1
//
//  Created by chandrasekhar yadavally on 7/24/21.
//

import UIKit

class Cell: UITableViewCell {
    let mySwitch = Switch(frame: .zero)
    let itemLabel = ItemLabel(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        mySwitch.center = contentView.center
        mySwitch.frame.size.width = 75
        mySwitch.frame.size.height = 35
        
        itemLabel.text = "Item 1"
        
        addSubview(mySwitch)
        addSubview(itemLabel)
                
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            itemLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            itemLabel.heightAnchor.constraint(equalToConstant: 44),
            itemLabel.widthAnchor.constraint(equalToConstant: 75),
            
            mySwitch.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
