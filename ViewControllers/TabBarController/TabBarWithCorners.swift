//
//  TabBarWithCorners.swift
//  etisalatWallet
//
//  Created by Shujaat Ali Khan on 14/04/2022.
//  Copyright © 2022 Etisalat UAE. All rights reserved.
//

import UIKit

class TabBarWithCorners: UITabBar {
    var radii: CGFloat = 16

    private var shapeLayer: CALayer?

    override func draw(_ rect: CGRect) {
        addShape()
    }
    func refreshCorner(radius:CGFloat = 16){
        radii = radius
        addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = createPath()
        //shapeLayer.strokeColor = UIColor.black.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        //shapeLayer.lineWidth = 2
        shapeLayer.shadowColor = UIColor.lightGray.withAlphaComponent(1).cgColor
        shapeLayer.shadowOffset = CGSize(width: 0 , height: -2);
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowRadius = 2
        shapeLayer.shadowPath =  createPath()//UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
        

        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft,.topRight],
            cornerRadii: CGSize(width: radii, height: 0.0))

        return path.cgPath
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.isTranslucent = true
        self.backgroundColor = UIColor.white
        
        var tabFrame            = self.frame
        tabFrame.size.height    = 65 + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero)
        tabFrame.origin.y       = self.frame.origin.y +   ( self.frame.height - 65 - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero))
        self.layer.cornerRadius = 20
        self.frame            = tabFrame
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
    }

}
