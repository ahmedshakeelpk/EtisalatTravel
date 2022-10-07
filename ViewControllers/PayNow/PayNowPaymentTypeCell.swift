//
//  PayNowPaymentTypeCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit

class PayNowPaymentTypeCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imagveViewIcon: UIImageView!
    @IBOutlet weak var viewBackGround: UIView!
    
    var isSelectedCell: Bool! {
        didSet {
            imageViewRadioButton.image = isSelectedCell ? UIImage(named: "select") : UIImage(named: "unselectBlack")
        }
    }
    
    @IBOutlet weak var imageViewRadioButton: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewBackGround.layer.cornerRadius = 8
        viewBackGround.clipsToBounds = true
        
        viewBackGround.setShadow()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
