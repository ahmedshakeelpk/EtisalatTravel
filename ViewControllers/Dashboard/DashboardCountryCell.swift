//
//  DashboardCountryCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 27/09/2022.
//

import UIKit

class DashboardCountryCell: UITableViewCell {
    @IBOutlet weak var imageViewFlag: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var viewFlagBackGround: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBackGround.setShadow()
        imageViewFlag.circle()
        viewFlagBackGround.circle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
