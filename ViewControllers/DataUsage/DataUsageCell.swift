//
//  DataUsageCell.swift
//  EtisalatTravel
//
//  Created by shakeel on 06/10/2022.
//

import UIKit
import Reachability

class DataUsageCell: UITableViewCell {
    var modelCountries: ModelCountries!

    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var labelTotalData: LabelSetting!
    @IBOutlet weak var buttonInstallation: UIButton!
    @IBAction func buttonInstallation(_ sender: Any) {
        viewController.showProgressBar()
        viewController.progressViewBackground.isHidden = false
    }
    @IBOutlet weak var labelInstallation: LabelSetting!
    
    @IBOutlet weak var labelTotalData2: LabelSetting!
    @IBOutlet weak var imageViewCard: UIImageView!
    @IBOutlet weak var buttonShowMore: UIButton!
    @IBOutlet weak var viewFour: UIView!
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var labelValidity: UILabel!
    @IBOutlet weak var labelCountry: LabelSetting!
    
    @IBAction func buttonNotActivited(_ sender: Any) {
        if ConnectionManager.shared.hasConnectivity() {
            
            defaults.setValue(true, forKey: "isPackageActivited")
            buttonNotActivited.setTitle("ACTIVITED", for: .normal)
            DispatchQueue.main.async {
                self.viewController.showAlert(message: "Package activiated successfully")
            }
        }
        else {
            viewController.showAlert(message: "To Activate this package, Please connect to wifi")
        }
    }
    @IBOutlet weak var buttonNotActivited: UIButton!
    @IBAction func buttonShowMore(_ sender: Any) {
        viewController.pushToVC(toStoryboard: .main, toVC: Dashboard.self) {
            vc in
            if let vc = vc as? Dashboard {
                vc.isFromDataUsageScreen = true
            }
        }
    }
    
    
    
    @IBOutlet weak var viewBackGroundCard: UIView!
    
    var viewController: DataUsage!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.viewBackGroundCard.radius(radius: 15)
            self.imageViewCard.layer.cornerRadius = 12
            self.imageViewCard.clipsToBounds = true
            self.buttonNotActivited.layer.cornerRadius = 8
            self.buttonNotActivited.clipsToBounds = true
            self.viewOne.setShadow()
//            self.viewTwo.setShadow()
//            self.viewThree.setShadow()
            self.viewFour.setShadow()

            self.buttonShowMore.layer.cornerRadius = 8
            self.buttonShowMore.layer.borderWidth = 1
            self.buttonShowMore.layer.borderColor = UIColor.white.cgColor
            self.buttonShowMore.clipsToBounds = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData() {
        var packageType = defaults.value(forKey: "packageType") as! Int
        
        var price = ""
        var validity = ""
        var data = ""
        if packageType == 1 {
            price = modelCountries.price1!
            data = "1 GB"
            validity = "3 DAYS"
        }
        else if packageType == 2 {
            price = modelCountries.price2!
            data = "3 GB"
            validity = "7 DAYS"
        }
        else if packageType == 3 {
            price = modelCountries.price3!
            data = "5 GB"
            validity = "30 DAYS"
        }
        labelCountry.text = modelCountries.countryName
//        labelPrice.text = price
        labelValidity.text = validity + ""
        labelTotalData2.text = data + ""
        labelTotalData.text = data + ""

        let activated = defaults.value(forKey: "isPackageActivited") as? Bool ?? false
        if activated {
            buttonNotActivited.setTitle("ACTIVITED", for: .normal)
        }
        else {
            buttonNotActivited.setTitle("ACTIVITE", for: .normal)
        }
        
    }
    
    @IBOutlet weak var buttonActivation: UIButton!
    
    @IBAction func buttonActivation(_ sender: Any) {
        //declare this property where it won't go out of scope relative to your listener
        
    }
}


class ConnectionManager {

    static let shared = ConnectionManager()
    private init () {}

    func hasConnectivity() -> Bool {
        do {
            let reachability: Reachability = try Reachability()
            let networkStatus = reachability.connection
            
            switch networkStatus {
            case .unavailable:
                return false
            case .wifi:
                return true
            case .cellular:
                return false
            case .none:
                return false
            }
        }
        catch {
            return false
        }
    }
}


import UIKit

class CircularProgressView: UIView {


fileprivate var progressLayer = CAShapeLayer()
fileprivate var trackLayer = CAShapeLayer()
fileprivate var didConfigureLabel = false
fileprivate var rounded: Bool
fileprivate var filled: Bool


fileprivate let lineWidth: CGFloat?



    var timeToFill = 15.0



var progressColor = UIColor.white {
    didSet{
        progressLayer.strokeColor = progressColor.cgColor
    }
}

var trackColor = UIColor.white {
    didSet{
        trackLayer.strokeColor = trackColor.cgColor
    }
}


var progress: Float {
    didSet{
        var pathMoved = progress - oldValue
        if pathMoved < 0{
            pathMoved = 0 - pathMoved
        }
        
        setProgress(duration: timeToFill * Double(pathMoved), to: progress)
    }
}




fileprivate func createProgressView(){
    
    self.backgroundColor = .clear
    self.layer.cornerRadius = frame.size.width / 2
    let circularPath = UIBezierPath(arcCenter: center, radius: frame.width / 2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
    trackLayer.fillColor = UIColor.blue.cgColor
    
    
    trackLayer.path = circularPath.cgPath
    trackLayer.fillColor = .none
    trackLayer.strokeColor = trackColor.cgColor
    if filled {
        trackLayer.lineCap = .butt
        trackLayer.lineWidth = frame.width
    }else{
        trackLayer.lineWidth = lineWidth!
    }
    trackLayer.strokeEnd = 1
    layer.addSublayer(trackLayer)
    
    progressLayer.path = circularPath.cgPath
    progressLayer.fillColor = .none
    progressLayer.strokeColor = progressColor.cgColor
    if filled {
        progressLayer.lineCap = .butt
        progressLayer.lineWidth = frame.width
    }else{
        progressLayer.lineWidth = lineWidth!
    }
    progressLayer.strokeEnd = 0
    if rounded{
        progressLayer.lineCap = .round
    }
    
    layer.addSublayer(progressLayer)
}





func trackColorToProgressColor() -> Void{
    trackColor = progressColor
    trackColor = UIColor(red: progressColor.cgColor.components![0], green: progressColor.cgColor.components![1], blue: progressColor.cgColor.components![2], alpha: 0.2)
}



func setProgress(duration: TimeInterval = 3, to newProgress: Float) -> Void{
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.duration = duration
    
    animation.fromValue = progressLayer.strokeEnd
    animation.toValue = newProgress
    
    progressLayer.strokeEnd = CGFloat(newProgress)
    
    progressLayer.add(animation, forKey: "animationProgress")
    
}



override init(frame: CGRect){
    progress = 0
    rounded = true
    filled = false
    lineWidth = 15
    super.init(frame: frame)
    filled = false
    createProgressView()
}

required init?(coder: NSCoder) {
    progress = 0
    rounded = true
    filled = false
    lineWidth = 15
    super.init(coder: coder)
    createProgressView()
    
}


init(frame: CGRect, lineWidth: CGFloat?, rounded: Bool) {
    
    
    progress = 0
    
    if lineWidth == nil{
        self.filled = true
        self.rounded = false
    }else{
        if rounded{
            self.rounded = true
        }else{
            self.rounded = false
        }
        self.filled = false
    }
    self.lineWidth = lineWidth
    
    super.init(frame: frame)
    createProgressView()
    
}

}
