//
//  TextFieldView.swift
//  EtisalatTravel
//
//  Created by Shujaat Ali Khan on 07/10/2022.
//

import UIKit

class TextFieldView: UIView {
    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }

    func setup () {
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = UIColor.init(hexString: "#c9c9c9").cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
        
//        let borderView = UIView()
//        borderView.frame = self.bounds
//        borderView.layer.cornerRadius = 5
//        borderView.layer.borderColor = UIColor.init(hexString: "#D9D9D9").cgColor
//        borderView.layer.borderWidth = 1.0
//        borderView.layer.masksToBounds = true
//        self.insertSubview(borderView, at: 0)
//        self.addConstraint(NSLayoutConstraint(item: borderView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: borderView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: borderView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: borderView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 0))
//
//        self.setNeedsUpdateConstraints()
        
    }

}
