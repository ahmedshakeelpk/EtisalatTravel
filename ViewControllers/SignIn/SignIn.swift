//
//  SignIn.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit
var defaults = UserDefaults.standard

class SignIn: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSignIn.radius(radius: 8)

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var buttonBack: UIButton!
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var buttonSignup: UIButton!
    @IBAction func buttonSignup(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBAction func buttonSignIn(_ sender: Any) {
        
        
        
        if let isPackageSubscribed = defaults.value(forKey: "isPackageSubscribed") {
            self.pushToVC(toStoryboard: .main, toVC: DataUsage.self) {
                vc in
                if let vc = vc as? DataUsage {
                    
                }
            }
        }
        else {
            self.pushToVC(toStoryboard: .main, toVC: Dashboard.self) {
                vc in
                if let vc = vc as? Dashboard {
                    vc.isFromLoginScreen = true
                }
            }
        }
    }
    
    @IBOutlet weak var buttonForgot: UIButton!
    @IBAction func buttonForgot(_ sender: Any) {
    }
   

}


extension SignIn: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
