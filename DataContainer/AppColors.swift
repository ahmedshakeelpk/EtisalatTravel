//
//  AppColors.swift
//  AABEngage
//
//  Created by Shakeel Ahmed on 16/12/2021.
//

import Foundation
import UIKit

extension UIColor {
    // Ma Colors
    static let _375D73 = UIColor(hexString: "375D73")
    static let _171D4B = UIColor(hexString: "171D4B")
    static let clrAppp = UIColor(hexString: "D1392B")

    
    
    static let clrStatusBar: UIColor = #colorLiteral(red: 0, green: 0.5490196078, blue: 0.7882352941, alpha: 1) //UIColor(hexString: "008CC9")
    static let clrDashboardNavBar = UIColor(hexString: "E5E5EA")
    static let clrDashboardNavBarStatusBar = UIColor(hexString: "446190")
    static let clrRing = UIColor(hexString: "99685A")
    static let clrOrange = UIColor(hexString: "FC6F51")
    static let clrBlue = UIColor(hexString: "03236C")
    static let clrGreen = UIColor(hexString: "01B46F")
    static let clrDarkBlue = UIColor(hexString: "01133C")
    static let clrGray = UIColor(hexString: "555555")
    static let clrLightGray = UIColor(hexString: "A8A8A8")
    static let clrExtraLightGray = UIColor(hexString: "BABEC2")
    
    static let clrStart = UIColor(hexString: "F46161")
    static let clrMid = UIColor(hexString: "F8DB00")
    static let clrEnd = UIColor(hexString: "68F8C0")
    
    static let clrSkyBlue = UIColor(hexString: "E1E9F5")
    static let clrSkyBlueWithOccupacy1 = UIColor(hexString: "E5E9F3", alpha: 0.80)
    static let clrSkyBlueWithOccupacy2 = UIColor(hexString: "E5E9F3", alpha: 0.55)
    static let clrSkyBlueWithOccupacy3 = UIColor(hexString: "E5E9F3", alpha: 0.25)
    static let clrBlackBackGroundOccupacy = UIColor(hexString: "000000", alpha: 0.25)

    
    static let clrSkyBlueWithOccupacy4 = UIColor(hexString: "E5E9F3", alpha: 0.05)
    static let clrTotalBalance = UIColor(hexString: "122D6C", alpha: 0.16)
    static let clrBlueWithOccupacy10 = UIColor(hexString: "171D4B", alpha: 0.10)

    

    static let clrBlackWithOccupacy = UIColor(hexString: "000000", alpha: 0.51)
    static let clrWalkThroughSelected = UIColor(hexString: "375D73")
    static let clrWalkThroughDefault = UIColor(hexString: "171D4B")

    static let clrInvalid = UIColor(hexString: "FC6F51")
    static let clrValid = UIColor(hexString: "01B46F")
    static let clrTextNormal = UIColor(hexString: "555555")
    
    
    
    
    convenience init(hexString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
}

