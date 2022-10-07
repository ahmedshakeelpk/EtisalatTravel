//
//  PayNowCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit

class PayNowDetailCell: UITableViewCell {

    @IBOutlet weak var viewAgree: UIView!
    @IBOutlet weak var labelPrice: LabelSetting!
    @IBOutlet weak var labelCountry: LabelSetting!
    @IBOutlet weak var viewBackgGround: UIView!
    @IBOutlet weak var buttonAgree: UIButton!
    @IBAction func buttonAgree(_ sender: Any) {
        buttonAgree.tag = buttonAgree.tag == 0 ? 1 : 0
        imageViewRadioButton.image = buttonAgree.tag == 1 ? UIImage(named: "select") : UIImage(named: "unselect")
    }
    
    @IBOutlet weak var labelValidity: LabelSetting!
    @IBOutlet weak var labelData: LabelSetting!
    @IBOutlet weak var imageViewRadioButton: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBackgGround.layer.cornerRadius = 12
        viewBackgGround.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
