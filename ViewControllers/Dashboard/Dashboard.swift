//
//  Dashboard.swift
//  EtisalatTravel
//
//  Created by shakeel on 27/09/2022.
//

import UIKit
import SwiftUI
import Foundation


class Dashboard: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblPopularCountries: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var textFieldSearch: UISearchBar!
    
    var isFromLoginScreen = false
    var arrayCountries: [String] = []
    var arrayFlag: [String] = []
    var selectedIndex: Int!

    struct ModelRegions {
        let name: String?
        let flag: UIImage?
    }
    
    var modelCountries = [ModelCountries]()
    var modelCountriesFilter = [ModelCountries]()
    
    var modelRegions = [ModelRegions]()
    var modelRegionsFilter = [ModelRegions]()

    var arrayTitles = ["Popular Countries", "Regions", "Global"]
    var arrayRegions = ["Africa", "Asia", "Caribbean Island", "Europe"]

    @IBOutlet weak var imageViewBack: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationBarHidden()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationBarShow()
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        textFieldSearch.delegate = self
        super.viewDidLoad()

        buttonBack.isHidden = isFromLoginScreen
        imageViewBack.isHidden = isFromLoginScreen

        
        // Do any additional setup after loading the view.
        DashboardCountryCell.register(tableView: tableView)
        DashboardRegionsCell.register(tableView: tableView)
        DashboardGlobalCell.register(tableView: tableView)

        DashboardCountryOpenCell.register(tableView: tableView)

        

        getCountriesList()
        getRegionsList()
    }
    var arrayCountriesForAdd = ["PK", "IND","DE", "TR", "IN", "CN", "US", "GB", "SA", "RU",  "ZM", "HK", "PM", "MC", "BY"]
    func getCountriesList() {
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            let data = Int.random(in: 1..<10)
            let validitys = Int.random(in: 1..<30)
            let price = Double.random(in: 1.00..<10.00)

            let price1 = String(format: "%.2f", price)
            let price2 = String(format: "%.2f", (price*3-2))
            let price3 = String(format: "%.2f", (price*5-5))
            let model = ModelCountries(countryName: name, countryFlag: code, data: "\(data)", validitys: "\(validitys)", price1: "US$ \(price1)", price2:"US$ \(price2)", price3: "US$ \(price3)")
            if arrayCountriesForAdd.contains(code) {
                if ["PK", "IND","DE", "TR", "IN", "CN", "US", "GB"].contains(code) {
                    modelCountries.insert(model, at: 0)
                }
                else {
                    modelCountries.append(model)
                }
            }
            
//            print(name)
//            print(code)
        }
  
        modelCountriesFilter = modelCountries
        print(arrayFlag)
        tableView.reloadData()
    }
    @IBOutlet weak var viewNavigation: UIView!
    @IBOutlet weak var buttonBack: UIButton!
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func getRegionsList() {
        for region in arrayRegions {
            modelRegions.append(ModelRegions(name: region, flag: UIImage(named: "screen1")))
        }
        modelRegionsFilter = modelRegions
        tableView.reloadData()
    }

    
    func countryFlag(_ countryCode: String) -> String {
        let flagBase = UnicodeScalar("🇦").value - UnicodeScalar("A").value
        let flag = countryCode
            .uppercased()
            .unicodeScalars
            .compactMap({ UnicodeScalar(flagBase + $0.value)?.description })
            .joined()
        return flag
    }
    
    @IBAction func segmentControl(_ sender: Any) {
        lblPopularCountries.text = arrayTitles[segmentControl.selectedSegmentIndex]
        tableView.reloadData()
    }
}


extension Dashboard: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segmentControl.selectedSegmentIndex == 0 {
            if selectedIndex != nil  && selectedIndex == indexPath.row {
                return 560
            }
            return 79
        }
        else if segmentControl.selectedSegmentIndex == 1 {
            return 79
        }
        else {
            return 360
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentControl.selectedSegmentIndex == 0 {
            return modelCountriesFilter.count
        }
        else if segmentControl.selectedSegmentIndex == 1 {
            return modelRegionsFilter.count
        }
        else if segmentControl.selectedSegmentIndex == 2 {

        }
        return modelCountriesFilter.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentControl.selectedSegmentIndex == 0 {
            if selectedIndex != nil  && selectedIndex == indexPath.row {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCountryOpenCell") as! DashboardCountryOpenCell
                
                cell.modelCountries = modelCountriesFilter[indexPath.row]
                cell.viewController = self
                cell.labelTitle.text = modelCountriesFilter[indexPath.row].countryName
                cell.imageViewFlag.image = nil
                cell.imageViewFlag.image = countryFlag(modelCountriesFilter[indexPath.row].countryFlag!).image()
                
//                cell.labelData1.text = modelCountriesFilter[indexPath.row].data! + "GB"
                cell.labelData1.text = "1 GB"
                cell.labelData2.text = "3 GB"
                cell.labelData3.text = "5 GB"

//                cell.labelValidity1.text = modelCountriesFilter[indexPath.row].validitys! + "DAYS"
                cell.labelValidity1.text = "1 DAY"
                cell.labelValidity2.text = "7 DAYS"
                cell.labelValidity3.text = "30 DAYS"
                
                cell.labelPrice1.text = modelCountriesFilter[indexPath.row].price1!
                cell.labelPrice2.text = modelCountriesFilter[indexPath.row].price2!
                cell.labelPrice3.text = modelCountriesFilter[indexPath.row].price3!

                
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCountryCell") as! DashboardCountryCell
            cell.labelTitle.text = modelCountriesFilter[indexPath.row].countryName
            cell.imageViewFlag.image = nil
            cell.imageViewFlag.image = countryFlag(modelCountriesFilter[indexPath.row].countryFlag!).image()
            return cell
        }
        else if segmentControl.selectedSegmentIndex == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardRegionsCell") as! DashboardRegionsCell
            cell.imageViewFlag.image = nil
            cell.labelTitle.text = modelRegionsFilter[indexPath.row].name
            cell.imageViewFlag.image = modelRegionsFilter[indexPath.row].flag
            return cell
        }
        else if segmentControl.selectedSegmentIndex == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardGlobalCell") as! DashboardGlobalCell
//            cell.labelTitle.text = modelCountriesFilter[indexPath.row].countryName
//            cell.imageViewFlag.image = countryFlag(modelCountriesFilter[indexPath.row].countryFlag!).image()
            return cell
        }
        else {
            return DashboardCountryCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        if selectedIndex != nil && selectedIndex == indexPath.row {
            selectedIndex = nil
        }
        else {
            selectedIndex = indexPath.row
        }
        tableView.reloadData()
        
//        self.pushToVC(toStoryboard: .main, toVC: DashboardCardDetails.self){ vc in
//            if let vc = vc as? DashboardCardDetails {
//                vc.modelCountries = self.modelCountries[indexPath.row]
//
//            }
//        }
    }
}

extension Dashboard: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if segmentControl.selectedSegmentIndex == 0 {
            let searchKeyWordText = textFieldSearch.text!
            let searchKeyWordTextRecord = searchKeyWordText.isEmpty ? modelCountries : modelCountries.filter({
                return $0.countryName!.lowercased().contains(searchText.lowercased())
            })
            modelCountriesFilter = searchKeyWordTextRecord
        }
        else if segmentControl.selectedSegmentIndex == 1 {
            let searchKeyWordText = textFieldSearch.text!
            let searchKeyWordTextRecord = searchKeyWordText.isEmpty ? modelRegions : modelRegions.filter({
                return $0.name!.lowercased().contains(searchText.lowercased())
            })
            modelRegionsFilter = searchKeyWordTextRecord
        }
        else if segmentControl.selectedSegmentIndex == 2 {

        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        modelCountriesFilter = modelCountries
        tableView.reloadData()
        self.view.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
}
extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}


