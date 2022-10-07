//
//  ViewShape.swift
//  Scorpio
//
//  Created by Mag on 28/09/2021.
//

import Foundation
import SwiftUI

extension UITextField {
    
}
extension UIView {
    func setSetting() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func BottomCorner() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    func Toporner() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    func setRadiusWithBorder(BorderClr:UIColor) {
        self.layer.borderWidth = 0.2
        self.layer.borderColor = BorderClr.cgColor
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
    //Manzar Saleem
    func setRadius() {
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    //Manzar Saleem
    func setRadiusWithBlueBorder() {
        
        self.layer.borderWidth = 0.7
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    func setCircle() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    func setCircleWithoutBorder() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    ///Manzar Saleem
     func setCircleShadow() {
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.cornerRadius = self.frame.height / 2
    self.clipsToBounds = true
    self.layer.shadowColor = UIColor.red.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 10)
    self.layer.shadowOpacity = 1
    self.layer.shadowRadius = 10

}
    func setCirclewithColor(BorderClr:UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = BorderClr.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    //Manzar
    func setCirclewithoutborder() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
//    func setShade() {
//        self.layer.cornerRadius = 8
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.gray.cgColor
//
//            //MARK:- Shade a view
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
//        self.layer.shadowRadius = 3.0
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.masksToBounds = false
//
//    }
    
    func setShade()    {
//        let borderColor = UIColor( red: CGFloat(242/255.0), green: 242/255.0, blue: 247/255.0, alpha: 1.0)//

        // corner radius
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true

        // border
       // self.layer.borderWidth = 0.5
       // self.layer.borderColor = borderColor.cgColor

        // shadow
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
    }
    func setCorner()
    {
        layer.cornerRadius = self.frame.height / 2.0
        layer.masksToBounds = true
    }
    func setShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.cornerRadius = 6
    }
}
