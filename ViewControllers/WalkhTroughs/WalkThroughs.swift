//
//  WalkhTroughs.swift
//  AABEngage
//
//  Created by Shakeel Ahmed on 16/10/2021.
//

import UIKit

class WalkThroughs: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var viewLeftArrow: UIView!
    @IBOutlet weak var viewRightArrow: UIView!

    
    
    @IBOutlet weak var buttonNext: ButtonSetting!
    var pageImages: [String] = ["screen1","screen2", "screen3"]
//    var pageImages: [String] = ["screen1","screen2", "screen3", "screen4", "screen5"]
    var arrDescriptions: [String] = ["Roaming is expensive, save up to 10x with eSIMs from",
                                     "Get data packs at affordable rates in your countries and regions",
                                     "Just use the esiM function on your phone to connect instantly",
                                     "Easy set up and activation is only few minutes", "Still not convinced? Our support team is available 24/7"]
    
    
    var arrTitle: [String] = ["Services by Experienced Professionals","Worry Free Car Experience"]
    var arrButtonName: [String] = ["Skip","GET STARTED"]
    var arrButtonNameColor: [UIColor] = [.clrGray,.clrWalkThroughSelected]


    
    var frame = CGRect.zero
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    @IBAction func btnLeft(_ sender: Any) {
        scrollView.scrollToPage(index: 0, animated: true, after: 0.0)
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(0)
//        lblTitle.text = self.arrTitle[Int(0)]
//        lblDescription.text = self.arrDescriptions[Int(0)]
//        btnSkipStart.setTitle(arrButtonName[Int(0)], for: .normal)
//        btnSkipStart.setTitleColor(arrButtonNameColor[Int(0)], for: .normal)
    }
    
    @IBAction func btnRight(_ sender: Any) {
        scrollView.scrollToPage(index: 1, animated: true, after: 0.0)
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(1)
//        lblTitle.text = self.arrTitle[Int(1)]
//        lblDescription.text = self.arrDescriptions[Int(1)]
//        btnSkipStart.setTitle(arrButtonName[Int(1)], for: .normal)
//        btnSkipStart.setTitleColor(arrButtonNameColor[Int(1)], for: .normal)
    }
    
    override func viewDidLoad() {
        pageControl.numberOfPages = pageImages.count
//        viewLeftArrow.isHidden = true
//        viewRightArrow.isHidden = true
        scrollView.isHidden = true
        labelDescription.text = arrDescriptions[0]
        labelDescription.textAlignment = .center
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationBarHidden()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.setupScreens()
//        viewLeftArrow.circle()
//        viewRightArrow.circle()
//        viewLeftArrow.isHidden = false
//        viewRightArrow.isHidden = false
        scrollView.isHidden = false
    }
    
    @IBOutlet weak var buttonSkip: ButtonSetting!
    @IBAction func buttonSkip(_ sender: Any) {
        //self.pushToVC(toStoryboard: .main, toVC: SignUp.self)
        self.pushToVC(toStoryboard: .main, toVC: HomeTabBarController.self)
    }
    
    
    @IBAction func buttonNext(_ sender: Any) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        let index = Int(pageNumber)+1
        if index > 2 {
            self.pushToVC(toStoryboard: .main, toVC: SignUp.self)
            return
        }
        scrollView.scrollToPage(index:UInt8(index) , animated: true, after: 0.0)
        pageControl.currentPage = index
        labelDescription.text = self.arrDescriptions[index]
    }
    
    func setupScreens() {
        for index in 0..<pageImages.count {
            // 1.
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let widthHeight = self.view.frame.width - 70
            let yOfImage = self.scrollView.frame.midY - (widthHeight/2)
            
            let imgView = UIImageView(frame: CGRect(x: frame.origin.x + 35, y:25, width: widthHeight, height: widthHeight))
            
            // 2.
//            let imgView = UIImageView(frame: frame)
            imgView.contentMode = .scaleAspectFit
            imgView.image = UIImage(named: pageImages[index])
//            imgView.layoutIfNeeded()
            self.scrollView.addSubview(imgView)
        }

        // 3.
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(pageImages.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        DispatchQueue.main.async {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        labelDescription.text = arrDescriptions[Int(pageNumber)]
//        lblTitle.text = self.arrTitle[Int(pageNumber)]
//        lblDescription.text = self.arrDescriptions[Int(pageNumber)]
//        btnSkipStart.setTitle(arrButtonName[Int(pageNumber)], for: .normal)
//        btnSkipStart.setTitleColor(arrButtonNameColor[Int(pageNumber)], for: .normal)
    }
    
}
extension UIScrollView {
    func scrollToPage(index: UInt8, animated: Bool, after delay: TimeInterval) {
        let offset: CGPoint = CGPoint(x: CGFloat(index) * frame.size.width, y: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
            self.setContentOffset(offset, animated: animated)
        })
    }
}
