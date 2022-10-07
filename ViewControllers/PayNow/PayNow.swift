//
//  PayNow.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit

class PayNow: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var modelCountries: ModelCountries!
    var packageType = 0

    
    var arrayTitles = ["", "PayPal", "Google Pay", "Apple Pay", "**** **** **** 4242"]
    var arrayIcons = ["", "paypal", "google", "apple", "mastercard"]
    
    var selectedPaymentMethod = 999
    @IBOutlet weak var buttonBack: UIButton!
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationBarHidden()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationBarShow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PayNowPaymentTypeCell.register(tableView: tableView)
        PayNowDetailCell.register(tableView: tableView)

    }

}

extension PayNow: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        else {
            return 130
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PayNowDetailCell") as! PayNowDetailCell
            var price = ""
            var data = ""
            var validity = ""
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
            else {
                
            }
            cell.labelData.text = data
            cell.labelValidity.text = validity
            cell.labelPrice.text = price
            cell.labelCountry.text = modelCountries.countryName
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PayNowPaymentTypeCell") as! PayNowPaymentTypeCell
            cell.imagveViewIcon.image = UIImage(named: arrayIcons[indexPath.row])
            
            cell.labelTitle.text = arrayTitles[indexPath.row]
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            return
        }
        if selectedPaymentMethod != 999 {
            let cell = tableView.cellForRow(at: IndexPath(row: selectedPaymentMethod, section: 0)) as! PayNowPaymentTypeCell
            cell.isSelectedCell = false
        }

         let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! PayNowDetailCell
        if cell.buttonAgree.tag == 0 {
            showAlert(message: "Please agree with terms and conditions")
            return
        }
        
        
        selectedPaymentMethod = indexPath.row
        let cell2 = tableView.cellForRow(at: indexPath) as! PayNowPaymentTypeCell
        cell2.isSelectedCell = true
        
        self.presentToVC(toStoryboard: .main, toVC: ApplePay.self) {
            vc in
            (vc as! ApplePay).modelCountries = self.modelCountries
            (vc as! ApplePay).packageType = self.packageType
            (vc as! ApplePay).doneButtonPress = {
                self.presentToVC(toStoryboard: .main, toVC: ThankYou.self) {
                    vc in
                    (vc as! ThankYou).modelCountries = self.modelCountries
                    (vc as! ThankYou).packageType = self.packageType

                    (vc as! ThankYou).doneButtonPress = {
//                        self.dismissPushViewController()
                        self.pushToRootVC(toStoryboard: .main, toVC: DataUsage.self)
                    }
                }
            }
        }
    }
}
