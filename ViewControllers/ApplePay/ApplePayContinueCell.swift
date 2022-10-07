//
//  ApplePayContinueCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 04/10/2022.
//

import UIKit

class ApplePayContinueCell: UITableViewCell {

    @IBOutlet weak var buttonContinue: ButtonSetting!
    @IBAction func buttonContinue(_ sender: Any) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonContinue.layer.cornerRadius = 8
        buttonContinue.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
