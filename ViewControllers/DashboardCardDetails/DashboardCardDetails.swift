//
//  DashboardCardDetails.swift
//  EtisalatTravel
//
//  Created by shakeel on 28/09/2022.
//

import UIKit

class DashboardCardDetails: UIViewController {
    @IBOutlet weak var viewBackGroundTitles: UIView!
    @IBOutlet weak var viewBackGroundCard: UIView!
    @IBOutlet weak var lblCountryTitle: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblDays: UILabel!
    @IBOutlet weak var btnTotal: UIButton!
    var modelCountries : ModelCountries?
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewBackGroundTitles.backgroundColor = modelCountries?.color
        lblCountryTitle.text = modelCountries?.countryName ?? ""
        lblData.text = "\(modelCountries?.data ?? "") GB"
        lblDays.text = "\(modelCountries?.validitys ?? "") DAYS"
        btnTotal.setTitle("US$\(modelCountries?.price1 ?? "") - BUY NOW", for: .normal)
        // Do any additional setup after loading the view.
        title = "Card Details"
        viewBackGroundTitles.layer.cornerRadius = 20
        viewBackGroundTitles.clipsToBounds = true
        viewBackGroundCard.layer.cornerRadius = 20
        viewBackGroundTitles.clipsToBounds = true
        
    }
    

}
