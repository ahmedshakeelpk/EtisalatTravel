//
//  SignUp.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit

class SignUp: UIViewController {

    @IBOutlet weak var buttonSignUp: UIButton!
    @IBAction func buttonSignUp(_ sender: Any) {
    }
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBAction func buttonSignIn(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSignIn.radius(radius: 8)
        buttonSignUp.radius(radius: 8)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SignUp: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
