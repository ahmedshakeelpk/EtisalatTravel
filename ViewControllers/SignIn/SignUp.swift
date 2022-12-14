//
//  SignUp.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit


class SignUp: UIViewController {
   
    
    var arrayUsers = [ModelUser]()
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBAction func buttonSignUp(_ sender: Any) {
        if textFieldName.text == "" {
            showAlert(message: "Please enter name")
        }
        else if textFieldEmail.text == "" {
            showAlert(message: "Please enter email")
        }
        else if textFieldPassword.text == "" {
            showAlert(message: "Please enter password")
        }
        else {
            
            if let data = UserDefaults.standard.object(forKey: "modelUser") as? Data,
               let modelUser = try? JSONDecoder().decode([ModelUser].self, from: data) {
                arrayUsers = modelUser
            }
            let user = arrayUsers.filter({user in
                user.email?.lowercased() == textFieldEmail.text?.lowercased()
            })
            
            if user.count > 0 {
                showAlert(message: "User already exist")
                return
            }
            
            let modelUser = ModelUser(name: textFieldName.text!, email:  textFieldEmail.text!, password: textFieldPassword.text!)
            arrayUsers.append(modelUser)
            if let encoded = try? JSONEncoder().encode(arrayUsers) {
                defaults.set(encoded, forKey: "modelUser")
            }
            defaults.setValue(nil, forKey: "isPackageSubscribed")
            defaults.setValue(nil, forKey: "isPackageActivited")
            
//            showAlert(message: "User register sucessfully, please login")
            DispatchQueue.main.async {
                self.pushToRootVC(toStoryboard: .main, toVC: HomeTabBarController.self)
            }
        }
        
        
    }
    @IBOutlet weak var buttonBack: UIButton!
    @IBAction func buttonBack(_ sender: Any) {
    }
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBAction func buttonSignIn(_ sender: Any) {
    }
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSignIn.radius(radius: 8)
        buttonSignUp.radius(radius: 8)
        // Do any additional setup after loading the view.
    }
    
}
extension SignUp: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
