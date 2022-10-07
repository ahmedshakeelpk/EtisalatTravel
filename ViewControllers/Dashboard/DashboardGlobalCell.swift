//
//  DashboardGlobalCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 28/09/2022.
//

import UIKit

class DashboardGlobalCell: UITableViewCell {
    @IBOutlet weak var viewBackGroundCard: UIView!
    @IBOutlet weak var imageViewFlag: UIImageView!
    @IBOutlet weak var buttonPurchasePackage: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBackGround: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBackGround.layer.cornerRadius = 20
        viewBackGround.clipsToBounds = true
        
        viewBackGroundCard.layer.cornerRadius = 15
        viewBackGroundCard.clipsToBounds = true
        
        buttonPurchasePackage.layer.cornerRadius = 8
        buttonPurchasePackage.layer.borderWidth = 1
        buttonPurchasePackage.layer.borderColor = UIColor.lightGray.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
