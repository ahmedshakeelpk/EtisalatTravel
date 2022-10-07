//
//  Forgot.swift
//  EtisalatTravel
//
//  Created by shakeel on 30/09/2022.
//

import UIKit

class Forgot: UIViewController {

    @IBOutlet weak var buttonBack: UIButton!
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var buttonForgot: UIButton!
    @IBAction func buttonForgot(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonForgot.radius(radius: 8)

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
extension Forgot: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
