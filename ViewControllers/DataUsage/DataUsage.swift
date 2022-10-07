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
