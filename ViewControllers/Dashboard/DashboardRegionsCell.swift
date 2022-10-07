//
//  DashboardRegionsCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 28/09/2022.
//

import UIKit

class DashboardRegionsCell: UITableViewCell {

    @IBOutlet weak var imageViewFlag: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBackGround: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBackGround.setShadow()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
