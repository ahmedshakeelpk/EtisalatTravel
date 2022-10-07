//
//  SignIn.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit
var defaults = UserDefaults.standard

var modelUser: ModelUser!


class SignIn: UIViewController {

    var arrayUsers: [ModelUser]!

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSignIn.radius(radius: 8)
        
        if let data = UserDefaults.standard.object(forKey: "modelUser") as? Data,
           let modelUser = try? JSONDecoder().decode([ModelUser].self, from: data) {
            arrayUsers = modelUser
        }
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
        if textFieldEmail.text == "" {
            showAlert(message: "Please enter email")
            return
        }
        else if textFieldPassword.text == "" {
            showAlert(message: "Please enter password")
            return
        }
        
        let user = arrayUsers.filter({user in
            user.email == textFieldEmail.text && user.password == textFieldEmail.text
        })
        
        if user.count > 0 {
            modelUser = user.first
        }
        else {
            showAlert(message: "Email password invalid")
            return
        }
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
