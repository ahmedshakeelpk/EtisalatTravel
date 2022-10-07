//
//  ApplePay.swift
//  EtisalatTravel
//
//  Created by shakeel on 01/10/2022.
//

import UIKit

class ApplePay: UIViewController {

    var modelCountries: ModelCountries!
    var packageType = 0
    var doneButtonPress: (() -> ())?
    
    var arrayTitle = ["CARD", "SHIPPING", "CONTACT"]
    var arrayDescription = ["CAPITAL OF BANK DEBIT\n(**** 3824)", "JOHN APPLESEED\n683 JEFFERSON STREET TIBURON, CA 92940", "J.APPLESEED@ICLOUD.COM\n(408 555-0198)"]

    @IBOutlet weak var buttonCancel: UIButton!
    @IBAction func buttonCancel(_ sender: Any) {
        self.view.backgroundColor = .clear
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) {_ in
            self.dismiss(animated: true)
        }
    }
    
    @IBOutlet weak var tableView: TableViewContentSized!
    override func viewDidLoad() {
        super.viewDidLoad()
        ApplePayCell.register(tableView: tableView)
        ApplePayDetailCell.register(tableView: tableView)
        ApplePayContinueCell.register(tableView: tableView)

        

        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {_ in
            self.view.backgroundColor = .clrBlackBackGroundOccupacy
        }
    }
    

}

extension ApplePay: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ApplePayDetailCell") as! ApplePayDetailCell
            cell.packageType = packageType
            cell.modelCountries = modelCountries
            cell.loadData()
            return cell
        }
        else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ApplePayContinueCell") as! ApplePayContinueCell
            cell.buttonContinue.addTarget(self, action: #selector(didSelectContinueButton), for: .touchUpInside)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApplePayCell") as! ApplePayCell
        cell.labelTitle.text = arrayTitle[indexPath.row]
        cell.labelDescription.text = arrayDescription[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    @objc func didSelectContinueButton(sender: UIButton) {
        self.view.backgroundColor = .clear
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) {_ in
                self.dismiss(animated: true)
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) {_ in
                    self.doneButtonPress?()
                }
            }
            
        }
    }
}
