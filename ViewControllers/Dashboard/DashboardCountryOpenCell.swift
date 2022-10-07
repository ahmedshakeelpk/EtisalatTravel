//
//  DashboardCountryOpenCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit

class DashboardCountryOpenCell: UITableViewCell {

    @IBOutlet weak var imageViewCard1: UIImageView!
    @IBOutlet weak var imageViewCard2: UIImageView!
    @IBOutlet weak var imageViewCard3: UIImageView!

    @IBOutlet weak var viewFlagBackGround: UIView!
    @IBOutlet weak var imageViewFlag: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var stackViewData: UIStackView!
    @IBOutlet weak var stackViewData2: UIStackView!

    @IBOutlet weak var stackViewData3: UIStackView!

    @IBOutlet weak var labelPrice1: UILabel!
    @IBOutlet weak var labelPrice2: UILabel!
    @IBOutlet weak var labelPrice3: UILabel!
    
    @IBOutlet weak var labelData1: UILabel!
    @IBOutlet weak var labelData2: UILabel!
    @IBOutlet weak var labelData3: UILabel!
    @IBOutlet weak var stackViewContainer: UIStackView!
    
    @IBOutlet weak var labelValidity1: UILabel!
    @IBOutlet weak var labelValidity2: UILabel!
    @IBOutlet weak var labelValidity3: UILabel!

    @IBOutlet weak var buttonBuyNow: UIButton!

    @IBAction func buttonBuyNow(_ sender: Any) {
        viewController.pushToVC(toStoryboard: .main, toVC: PayNow.self) {
            vc in
            (vc as! PayNow).modelCountries = self.modelCountries
            (vc as! PayNow).packageType = 1

        }
    }
    @IBOutlet weak var buttonBuyNow2: UIButton!

    @IBAction func buttonBuyNow2(_ sender: Any) {
        viewController.pushToVC(toStoryboard: .main, toVC: PayNow.self) {
            vc in
            (vc as! PayNow).modelCountries = self.modelCountries
            (vc as! PayNow).packageType = 2
        }
    }
    @IBOutlet weak var buttonBuyNow3: UIButton!

    @IBAction func buttonBuyNow3(_ sender: Any) {
        viewController.pushToVC(toStoryboard: .main, toVC: PayNow.self) {
            vc in
            (vc as! PayNow).modelCountries = self.modelCountries
            (vc as! PayNow).packageType = 3
        }
    }
    @IBOutlet weak var viewButton1: UIView!
    @IBOutlet weak var viewButton2: UIView!
    @IBOutlet weak var viewButton3: UIView!
    
    var modelCountries: ModelCountries!

    var viewController: Dashboard!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageViewFlag.circle()
        self.viewFlagBackGround.circle()
        
        DispatchQueue.main.async {
            self.viewBackGround.setShadow()
            self.buttonBuyNow.setShadow()
           
            
            
            self.imageViewCard1.radius(radius: 8)
            self.imageViewCard2.radius(radius: 8)
            self.imageViewCard3.radius(radius: 8)

            
            self.buttonBuyNow.setShadow()
            self.buttonBuyNow2.setShadow()
            self.buttonBuyNow3.setShadow()
            self.viewButton1.setShadow()
            self.viewButton2.setShadow()
            self.viewButton3.setShadow()
            
            self.stackViewData.roundCorners(corners: [.topLeft, .bottomRight], radius: 12)
            self.stackViewData2.roundCorners(corners: [.topLeft, .bottomRight], radius: 12)
            self.stackViewData3.roundCorners(corners: [.topLeft, .bottomRight], radius: 12)

            self.stackViewContainer.layer.cornerRadius = 8
            self.stackViewContainer.layer.borderWidth = 1
            self.stackViewContainer.layer.borderColor = UIColor.lightGray.cgColor
            self.stackViewContainer.clipsToBounds = true
        }
        

        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
