//
//  ApplePayDetailCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 01/10/2022.
//

import UIKit

class ApplePayDetailCell: UITableViewCell {
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    var modelCountries: ModelCountries!
    var packageType = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    func loadData() {
        labelTitle.text = "Subtotal\nSale Tax\nShipping"

        
        if packageType == 1 {
            labelDescription.text = modelCountries.price1! + "\nUS$ 5.11\nUS$ 0.00"
        }
        else if packageType == 2 {
            labelDescription.text = modelCountries.price2! + "\nUS$ 5.11\nUS$ 0.00"
        }
        else if packageType == 3 {
            labelDescription.text = modelCountries.price3! + "\nUS$ 5.11\nUS$ 0.00"
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
