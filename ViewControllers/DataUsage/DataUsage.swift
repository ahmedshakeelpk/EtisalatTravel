//
//  DataUsage.swift
//  EtisalatTravel
//
//  Created by shakeel on 03/10/2022.
//

import UIKit


class DataUsage: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var modelCountries: ModelCountries!

    var progressViewBackground = UIView()
    var progressView = CircularProgressView()
    override func viewWillAppear(_ animated: Bool) {
        self.navigationBarHidden()
        if let data = UserDefaults.standard.object(forKey: "modelCountries") as? Data,
           let modelCountries = try? JSONDecoder().decode(ModelCountries.self, from: data) {
            self.modelCountries = modelCountries
        }
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.viewBackGroundCard.setShadow()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        DataUsageCell.register(tableView: tableView)
        // Retrieve from UserDefaults
        progressViewBackground.frame = view.frame
        
       
    }
    
    func showProgressBar() {
        progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), lineWidth: 15, rounded: false)
        
        progressView.trackColor = UIColor.red
        progressView.progress = 100
        
        progressViewBackground.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        progressViewBackground.addSubview(progressView)
        progressView.center = self.progressViewBackground.center
        self.view.addSubview(progressViewBackground)
        
        Timer.scheduledTimer(withTimeInterval: 15, repeats: false) { timer in
            self.progressViewBackground.isHidden = true
            let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! DataUsageCell
            cell.labelInstallation.text = "e-SIM Installed"
            self.showAlert(message: "e-SIM is installed customer needs to configure in the phone menu, to to use e-SIM for data roaming, while keeps the physical SIM for voice and SMS.")
        }
    }

    

}

extension DataUsage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataUsageCell") as! DataUsageCell
        cell.viewController = self
        cell.modelCountries = self.modelCountries
        cell.setData()
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 840
    }
}
