//
//  ThankYou.swift
//  EtisalatTravel
//
//  Created by shakeel on 01/10/2022.
//

import UIKit

class ThankYou: UIViewController {

    
    @IBOutlet weak var viewBackGround: UIView!

    @IBOutlet weak var imageViewSuccess: UIImageView!
    @IBOutlet weak var buttonDone: UIButton!
    @IBAction func buttonDone(_ sender: Any) {
//        self.view.backgroundColor = .clear
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) {_ in
            self.dismiss(animated: true)
            self.doneButtonPress?()
        }
    }
    
    @IBOutlet weak var backGroundDetails: UIView!
    var doneButtonPress: (() -> ())?
    
    var modelCountries: ModelCountries!
    var packageType = 0
    @IBOutlet weak var labelCountryName: LabelSetting!
    @IBOutlet weak var labelPrice: LabelSetting!
    @IBOutlet weak var labelData: LabelSetting!
    @IBOutlet weak var labelValidity: LabelSetting!
    
    override func viewDidLoad() {
        defaults.set(true, forKey: "isPackageSubscribed")

        super.viewDidLoad()
//        imageViewSuccess.image = imageViewSuccess.image?.withRenderingMode(.alwaysTemplate)
//        imageViewSuccess.tintColor = .clrAppp
        
        backGroundDetails.setShadow()
        buttonDone.layer.cornerRadius = 8
        buttonDone.clipsToBounds = true
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {_ in
//            self.view.backgroundColor = .clrBlackBackGroundOccupacy
            self.viewBackGround.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        }
        
        var price = ""
        var validity = ""
        var data = ""
        if packageType == 1 {
            price = modelCountries.price1!
            data = "1 GB"
            validity = "1 DAY"
        }
        else if packageType == 2 {
            price = modelCountries.price2!
            data = "3 GB"
            validity = "7 DAYS"
        }
        else if packageType == 3 {
            price = modelCountries.price3!
            data = "5 GB"
            validity = "30 DAYS"
        }
        labelCountryName.text = modelCountries.countryName
        labelPrice.text = price
        labelValidity.text = validity + " Validity"
        labelData.text = data + " Data"
        
        
        defaults.set(packageType, forKey: "packageType")
        
        if let encoded = try? JSONEncoder().encode(modelCountries) {
            defaults.set(encoded, forKey: "modelCountries")
        }
    }
    

    

}




struct ModelCountries: Codable {
    let countryName: String?
    let countryFlag: String?
    let data: String?
    let validitys: String?
    let price1: String?
    let price2: String?
    let price3: String?
//    let color: UIColor?

    
//    enum CodingKeys: String, CodingKey {
//        case countryName
//        case countryFlag
//        case data
//        case validitys
//        case price1
//        case price2
//        case price3
////        case color
//    }
}


struct ModelUser: Codable {
    let name: String?
    let email: String?
    let password: String?
}
