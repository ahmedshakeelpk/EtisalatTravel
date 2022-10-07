//
//  DataUsageCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 06/10/2022.
//

import UIKit

class DataUsageCell: UITableViewCell {
    var modelCountries: ModelCountries!

    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var labelTotalData: LabelSetting!
    
    @IBOutlet weak var labelTotalData2: LabelSetting!
    @IBOutlet weak var imageViewCard: UIImageView!
    @IBOutlet weak var buttonShowMore: UIButton!
    @IBOutlet weak var viewFour: UIView!
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var labelValidity: UILabel!
    @IBOutlet weak var labelCountry: LabelSetting!
    
    @IBAction func buttonNotActivited(_ sender: Any) {
    }
    @IBOutlet weak var buttonNotActivited: UIButton!
    @IBAction func buttonShowMore(_ sender: Any) {
        viewController.pushToVC(toStoryboard: .main, toVC: Dashboard.self) {
            vc in
            if let vc = vc as? Dashboard {
                vc.isFromLoginScreen = false
            }
        }
    }
    
    
    
    @IBOutlet weak var viewBackGroundCard: UIView!
    
    var viewController: DataUsage!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.viewBackGroundCard.radius(radius: 15)
            self.imageViewCard.layer.cornerRadius = 12
            self.imageViewCard.clipsToBounds = true
            self.buttonNotActivited.layer.cornerRadius = 8
            self.buttonNotActivited.clipsToBounds = true
            self.viewOne.setShadow()
//            self.viewTwo.setShadow()
//            self.viewThree.setShadow()
            self.viewFour.setShadow()

            self.buttonShowMore.layer.cornerRadius = 8
            self.buttonShowMore.layer.borderWidth = 1
            self.buttonShowMore.layer.borderColor = UIColor.white.cgColor
            self.buttonShowMore.clipsToBounds = true
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData() {
        var packageType = defaults.value(forKey: "packageType") as! Int
        
        
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
        labelCountry.text = modelCountries.countryName
//        labelPrice.text = price
        labelValidity.text = validity + ""
        labelTotalData2.text = data + ""
        labelTotalData.text = data + ""

    }
}
