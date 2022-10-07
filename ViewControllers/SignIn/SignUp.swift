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
        else if textFieldEmail.text == "" {
            showAlert(message: "Please enter email")
        }
        else {
            
            if let data = UserDefaults.standard.object(forKey: "modelUser") as? Data,
               let modelUser = try? JSONDecoder().decode([ModelUser].self, from: data) {
                arrayUsers = modelUser
            }
            
            
            let modelUser = ModelUser(name: textFieldName.text!, email:  textFieldEmail.text!, password: textFieldPassword.text!)
            arrayUsers.append(modelUser)
            if let encoded = try? JSONEncoder().encode(modelUser) {
                defaults.set(encoded, forKey: "modelUser")
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
