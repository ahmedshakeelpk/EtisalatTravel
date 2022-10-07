//
//  Extensions.swift
//  AABEngage
//
//  Created by Apple on 10/30/2021.
//

import Foundation
//import Kingfisher
import UIKit



extension UIViewController {
    //MARK:- Two line in Navigation Title with Multiple Sizes
    func navigationTwoLineTitle(topline: String, bottomline: String, viewcontroller :UIViewController) {
        
        let topText = NSLocalizedString(topline, comment: "")
        let bottomText = NSLocalizedString(bottomline, comment: "")
        
        //MARK:- Bold Font
        let titleParameters = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)]
        
        //MARK:- Regular Font
        let subtitleParameters = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12.0)]
        let title:NSMutableAttributedString = NSMutableAttributedString(string: topText, attributes: titleParameters)
        let subtitle:NSAttributedString = NSAttributedString(string: bottomText, attributes: subtitleParameters)
        title.append(NSAttributedString(string: "\n"))
        title.append(subtitle)
        let size = title.size()
        let width = size.width
        
        guard let height = viewcontroller.navigationController?.navigationBar.frame.size.height else {return}
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        titleLabel.attributedText = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        viewcontroller.navigationItem.titleView = titleLabel
    }
    
    func titleAllignLeft() {
        let title = UILabel()
        title.text = self.title
        title.font = UIFont(name: "Praxis-Bold", size: 22)
        title.textColor = .clrWalkThroughDefault
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.5
        
        let titleButton = UIButton()
        titleButton.frame = title.bounds
        titleButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        let titleContainer = UIView()
        
        // add label
        title.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.addSubview(title)
        title.leftAnchor.constraint(equalTo: titleContainer.leftAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: titleContainer.rightAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor).isActive = true
        
        // add button
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.addSubview(titleButton)
        titleButton.leftAnchor.constraint(equalTo: titleContainer.leftAnchor).isActive = true
        titleButton.rightAnchor.constraint(equalTo: titleContainer.rightAnchor).isActive = true
        titleButton.topAnchor.constraint(equalTo: titleContainer.topAnchor).isActive = true
        titleButton.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor).isActive = true
        
        
        let spacer = UIView()
        let constraint = spacer.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat.greatestFiniteMagnitude)
        constraint.isActive = true
        constraint.priority = .defaultLow
        
       let stack = UIStackView(arrangedSubviews: [titleContainer, spacer])
        
        stack.axis = .horizontal
        navigationItem.titleView = stack
    }
    
    @objc func dismissVC() {
        self.dismissPushViewController()
    }
    
    func rightBarButtonItem(nameButton: String, selector: Selector) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: nameButton, style: .plain, target: self, action: selector)
    }
    func rightBarButtonItem(iconNameButton: String, selector: Selector) {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        button.setImage(UIImage(named: iconNameButton), for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        
        let buttonBarButton = UIBarButtonItem(customView: UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25)))
        buttonBarButton.customView?.addSubview(button)
        buttonBarButton.customView?.frame = button.frame
        
        self.navigationItem.rightBarButtonItem = buttonBarButton
    }
    
    func leftBarButtonItem(nameButton: String, selector: Selector) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: nameButton, style: .plain, target: self, action: selector)
    }
    func leftBarButtonItem(iconNameButton: String, selector: Selector) {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        button.setImage(UIImage(named: iconNameButton), for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        
        let buttonBarButton = UIBarButtonItem(customView: UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25)))
        buttonBarButton.customView?.addSubview(button)
        buttonBarButton.customView?.frame = button.frame
        
        self.navigationItem.leftBarButtonItem = buttonBarButton
    }
    
    func pushToVC<T>(toStoryboard: storyBoards, toVC: T.Type, _ completion: ((_ _vc: UIViewController)->Void)? = nil) {
        
        // func pushToVC<T>(toStoryboard: STORYBOARDS, toVC: T.Type, _ completion: @escaping(_ vc: UIViewController?) -> Void) {
        
        guard let nextViewController = (UIStoryboard(name: toStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: toVC.self)) as? T) else {//viewController.showAlert(alertMessage: "View Controller issue in Class: GlobalFunctions and in Function: kfunPushToVC")
            return
        }
        completion?(nextViewController as! UIViewController)
        self.navigationController?.pushViewController(nextViewController as! UIViewController, animated: true)
    }
    
    func pushToRootVC<T>(toStoryboard: storyBoards, toVC: T.Type) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = UIStoryboard(name: toStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: toVC.self)) as? T
        if #available(iOS 13.0, *){
            if let scene = UIApplication.shared.connectedScenes.first{
                guard let windowScene = (scene as? UIWindowScene) else { return }
                print(">>> windowScene: \(windowScene)")
                let window: UIWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
                window.windowScene = windowScene //Make sure to do this
                window.rootViewController = vc as? UIViewController
                window.makeKeyAndVisible()
                appDelegate.window = window
            }
        } else {
            appDelegate.window?.rootViewController = vc as? UIViewController
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
   
    
    func presentToVC<T>(toStoryboard: storyBoards, toVC: T.Type, _ completion: ((_ _vc: UIViewController)->Void)? = nil) {
        guard let nextViewController = (UIStoryboard(name: toStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: toVC.self)) as? T) else {//viewController.showAlert(alertMessage: "View Controller issue in Class: GlobalFunctions and in Function: kfunPushToVC")
            return
        }
        completion?(nextViewController as! UIViewController)
        (nextViewController as! UIViewController).modalPresentationStyle = .overFullScreen
        self.present(nextViewController as! UIViewController, animated: true, completion: nil)
    }
    
    static func nameSB() -> String {
        return String(describing: self.self)
    }
    
    func removeAllNotificationCenterObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func statusBarColor(statusBarColor: UIColor) {
        if #available(iOS 13.0, *) {
            let statusBar = UIView(frame: UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor = statusBarColor
            statusBar.tag = 100
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)
        }
        else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor.red
            
        }
    }
    func navigationBarHidden() {
        self.navigationController?.navigationBar.isHidden = true
    }
    func navigationBarHideBackButtonTitle() {
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    func navigationBarBackButtonAction(selector: Selector) {
        //        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.target = self
        //        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.action = selector
        //
        for vw in navigationController?.navigationBar.subviews ?? [] where "\(vw.classForCoder)" == "_UINavigationBarContentView" {
            print("\(vw.classForCoder)")
            for subVw in vw.subviews where "\(subVw.classForCoder)" == "_UIButtonBarButton" {
                let ctrl = subVw as! UIControl
                ctrl.removeTarget(ctrl.allTargets.first, action: nil, for: .allEvents)
                ctrl.addTarget(self, action: selector, for: .touchUpInside)
            }
        }
        
    }
    
    func navigationBarShow() {
        //Show Navigation Bar Color
        self.navigationController?.navigationBar.isHidden = false
        //Hide Back Button text color
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    func navigationBarShow(navBarColor: UIColor) {
        //Show Navigation Bar Color
        self.navigationController?.navigationBar.isHidden = false
        //Hide Back Button text color
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        //Hide all kind of title in navigation bar
        //self.navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationController?.navigationBar.barTintColor = navBarColor
        //Button Right or Left Color
        self.navigationController?.navigationBar.tintColor = .clrDarkBlue
        //Title Color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func navigationBarShow(navBarColor: UIColor, statusBarColor: UIColor) {
        //Show Navigation Bar Color
        self.navigationController?.navigationBar.isHidden = false
        //Hide Back Button text color
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationController?.navigationBar.barTintColor = navBarColor
        //Button Right or Left Color
        self.navigationController?.navigationBar.tintColor = .clrDarkBlue
        //Title Color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.statusBarColor(statusBarColor: statusBarColor)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func dismissPushViewController(completion: (() -> ())? = nil) {
        self.navigationController?.popViewController(animated: true)
        completion?()
    }
    func dismissPresentViewController(completion: (() -> ())? = nil) {
        self.dismiss(animated: true, completion: completion)
    }
    
    func showAlertSuccessWithBackButton(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.dismissPushViewController()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertSuccessWithPopToVC<T>(viewController: T ,title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.dismissToViewController(viewController: viewController)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismissToViewController<T>(viewController: T) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: viewController.self as! AnyClass) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    func showAlertSuccessWithBackButton(title: String, message: String, icon: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.dismissPushViewController()
        }))
        let image = UIImageView(frame: CGRect(x: (alert.view.frame.size.width / 2 - 15), y: 10, width: 30, height: 30))
        image.image = UIImage(named: icon)
        
        let imageView = UIImageView(image: UIImage(named: icon))
        
        alert.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: alert.view, attribute: .centerY, multiplier: 1, constant: 0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithIconBackButton(message : String, icon : String) {
        
        let alert = UIAlertController(title:" \n ", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let OK = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) { (action) in
            self.dismissPushViewController()
        }
        alert.addAction(OK)
        alert.view.tintColor = UIColor.blue
        let imageView = UIImageView(image: UIImage(named: icon))
        imageView.contentMode = .scaleAspectFit
        alert.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
        //alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: alert.view, attribute: .centerY, multiplier: 1, constant: 0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
        
        let top = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: alert.view, attribute: .top, multiplier: 1.0, constant: 20)
        alert.view.addConstraint(top)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithIconPopToVC<T>(viewController: T, message : String, icon : String) {
        
        let alert = UIAlertController(title:" \n ", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let OK = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) { (action) in
            self.dismissToViewController(viewController: viewController)
        }
        alert.addAction(OK)
        alert.view.tintColor = UIColor.blue
        let imageView = UIImageView(image: UIImage(named: icon))
        imageView.contentMode = .scaleAspectFit
        alert.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
        //alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: alert.view, attribute: .centerY, multiplier: 1, constant: 0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
        
        let top = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: alert.view, attribute: .top, multiplier: 1.0, constant: 20)
        alert.view.addConstraint(top)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithIcon(message : String, icon : String) {
        
        let alert = UIAlertController(title:" \n ", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let OK = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) { (action) in
            
        }
        alert.addAction(OK)
        alert.view.tintColor = UIColor.blue
        let imageView = UIImageView(image: UIImage(named: icon))
        imageView.contentMode = .scaleAspectFit
        alert.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
        //alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: alert.view, attribute: .centerY, multiplier: 1, constant: 0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0))
        
        let top = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: alert.view, attribute: .top, multiplier: 1.0, constant: 20)
        alert.view.addConstraint(top)
        
        self.present(alert, animated: true, completion: nil)
    }
//    func showAlertCustom(titleGuestLogin: String? = "", title: String = "Alert", message: String, buttonTitle: String = "PROCEED", completion: (() -> Void)?) {
//        self.presentToVC(toStoryboard: .popup, toVC: PopupBottom.self) { vc in
//            if let vc = vc as? PopupBottom {
//                vc.titleGuestLogin = titleGuestLogin!
//                vc.titleString = title
//                vc.messageString = message
//                vc.buttonTitle = buttonTitle
//                vc.actionProceedHandler = completion
//            }
//        }
//    }
    
    //Show a basic alert
    func showAlert(message : String) {
        let alert = UIAlertController(title: kAppName, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "PROCEED", style: UIAlertAction.Style.default, handler: nil))
        //Add more actions as you see fit
        self.present(alert, animated: true, completion: nil)
    }
    func showAlertWithActions(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    //    // MARK: - UIViewController+AKSideMenu
    //    public var sideMenuViewController: AKSideMenu? {
    //        guard var iterator = self.parent else { return nil }
    //        guard let strClass = String(describing: type(of: iterator)).components(separatedBy: ".").last else { return nil }
    //
    //        while strClass != nibName {
    //            if iterator is AKSideMenu {
    //                return iterator as? AKSideMenu
    //            } else if let parent = iterator.parent, parent != iterator {
    //                iterator = parent
    //            } else {
    //                break
    //            }
    //        }
    //        return nil
    //    }
    
    //     MARK: - Public
    //     MARK: - IBAction Helper methods
    
    //    @IBAction public func presentLeftMenuViewController(_ sender: AnyObject) {
    //        self.sideMenuViewController?.presentLeftMenuViewController()
    //    }
    //
    //    @IBAction public func presentRightMenuViewController(_ sender: AnyObject) {
    //        self.sideMenuViewController?.presentRightMenuViewController()
    //    }
}

extension UISegmentedControl {
    func textColor(selectedColor: UIColor, normalColor: UIColor) {
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:selectedColor], for: .selected)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:normalColor], for: .normal)
        //        self.layer.borderWidth = 1
        //        self.layer.borderColor = UIColor.clrSegmentSelectedText.cgColor
    }
}
extension Dictionary {
    func convertParametersToJsonObject() -> Any {
        let attachmentParameterJson = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        let jsonObject = try? JSONSerialization.jsonObject(with: attachmentParameterJson!, options: [])
        
        return jsonObject!
    }
}


final class TableViewContentSized: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
final class CollectionViewContentSized: UICollectionView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
extension UITableViewCell {
    static func nibName() -> String {
        return String(describing: self.self)
    }
    
    static func register(tableView: UITableView)  {
        let nibName = String(describing: self.self)
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
}

extension UICollectionViewCell {
    static func nibName() -> String {
        return String(describing: self.self)
    }
    
    static func register(collectionView: UICollectionView)  {
        let nibName = String(describing: self.self)
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}



//
//extension UITextField {
//    func textFieldSetting() {
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.clrStatusBar.cgColor
//        self.layer.cornerRadius = self.frame.height / 2
//        self.clipsToBounds = true
//    }
//}
//
//extension UITextView {
//    func textViewSetting() {
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.clrStatusBar.cgColor
//        self.layer.cornerRadius = 6
//        self.clipsToBounds = true
//    }
//}
//
//extension UIButton {
//    func buttonSetting() {
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.clrStatusBar.cgColor
//        self.layer.cornerRadius = self.frame.height / 2
//        self.clipsToBounds = true
//        self.backgroundColor = .clrDarkBlue
//        self.setTitleColor(.white, for: .normal)
//    }
//}
//
extension UIView {
    //MARK:- Corner Radius of only two side of UIViews
    func roundCorners(corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func circle() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    func radius(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
        self.clipsToBounds = true
    }
    
    //    func showLoader(viewController: UIViewController) {
    //        let child = HZProgressHud()
    //        viewController.addChild(child)
    //        child.view.frame = viewController.view.frame
    //        child.view.frame.origin.y = 0
    //        viewController.view.addSubview(child.view)
    //        child.didMove(toParent: viewController)
    //    }
    //
    //    /* Remove Loader */
    //    func removeLoader(viewController: UIViewController) {
    //        let child = viewController.children.last
    //        child?.willMove(toParent: nil)
    //        child?.view.removeFromSuperview()
    //        child?.removeFromParent()
    //    }
}

extension Data {
    func toBase64String() -> (String, String) {
        //Use image name from bundle to create NSData
        //Now use image to create into NSData format
        // let imageData:Data = self.pngData()! as Data
        //        let mimeType = UIImage.fileMimeType(for: imageData)
        
        let strBase64 = self.base64EncodedString(options: .lineLength64Characters)
        return (strBase64, "mimeType")
    }
    
    func toBase64StringWithMimeType() -> (String, String) {
        //Use image name from bundle to create NSData
        //Now use image to create into NSData format
        let mimeType = UIImage.fileMimeType(for: self)
        let strBase64 = self.base64EncodedString(options: .lineLength64Characters)
        return (strBase64, mimeType)
    }
}
extension UIImage {
    
    func toBase64String() -> (String, String) {
        //Use image name from bundle to create NSData
        //Now use image to create into NSData format
        let imageData:Data = self.pngData()! as Data
        let mimeType = UIImage.fileMimeType(for: imageData)
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        return (strBase64, mimeType)
    }
    static func fileMimeType(for data: Data) -> String {
        
        var b: UInt8 = 0
        data.copyBytes(to: &b, count: 1)
        
        switch b {
        case 0xFF:
            return "image/jpeg"
        case 0x89:
            return "image/png"
        case 0x47:
            return "image/gif"
        case 0x4D, 0x49:
            return "image/tiff"
        case 0x25:
            return "application/pdf"
        case 0xD0:
            return "application/vnd"
        case 0x46:
            return "text/plain"
        default:
            return "application/octet-stream"
        }
    }
    
    
    func resizeByByte(maxByte: Int) -> Data {
        
        var compressQuality: CGFloat = 1

        var imageData = Data()
        var imageByte = self.jpegData(compressionQuality: 1)?.count

        while imageByte! > maxByte {
            imageData = self.jpegData(compressionQuality: compressQuality)!
            imageByte = self.jpegData(compressionQuality: compressQuality)?.count
            compressQuality -= 0.1
        }

        if maxByte > imageByte! {
            return imageData
        } else {
            return self.jpegData(compressionQuality: 1)!
        }
    }
    
    
    //
    //    public class func gif(data: Data) -> UIImage? {
    //        // Create source from data
    //        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
    //            print("SwiftGif: Source for the image does not exist")
    //            return nil
    //        }
    //
    //        return UIImage.animatedImageWithSource(source)
    //    }
    //
    //    public class func gif(url: String) -> UIImage? {
    //        // Validate URL
    //        guard let bundleURL = URL(string: url) else {
    //            print("SwiftGif: This image named \"\(url)\" does not exist")
    //            return nil
    //        }
    //
    //        // Validate data
    //        guard let imageData = try? Data(contentsOf: bundleURL) else {
    //            print("SwiftGif: Cannot turn image named \"\(url)\" into NSData")
    //            return nil
    //        }
    //
    //        return gif(data: imageData)
    //    }
    //
    //    public class func gif(name: String) -> UIImage? {
    //        // Check for existance of gif
    //        guard let bundleURL = Bundle.main
    //          .url(forResource: name, withExtension: "gif") else {
    //            print("SwiftGif: This image named \"\(name)\" does not exist")
    //            return nil
    //        }
    //
    //        // Validate data
    //        guard let imageData = try? Data(contentsOf: bundleURL) else {
    //            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
    //            return nil
    //        }
    //
    //        return gif(data: imageData)
    //    }
    //
    //    @available(iOS 9.0, *)
    //    public class func gif(asset: String) -> UIImage? {
    //        // Create source from assets catalog
    //        guard let dataAsset = NSDataAsset(name: asset) else {
    //            print("SwiftGif: Cannot turn image named \"\(asset)\" into NSDataAsset")
    //            return nil
    //        }
    //
    //        return gif(data: dataAsset.data)
    //    }
    //
    //    internal class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
    //        var delay = 0.1
    //
    //        // Get dictionaries
    //        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
    //        let gifPropertiesPointer = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 0)
    //        defer {
    //            gifPropertiesPointer.deallocate()
    //        }
    //        let unsafePointer = Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()
    //        if CFDictionaryGetValueIfPresent(cfProperties, unsafePointer, gifPropertiesPointer) == false {
    //            return delay
    //        }
    //
    //        let gifProperties: CFDictionary = unsafeBitCast(gifPropertiesPointer.pointee, to: CFDictionary.self)
    //
    //        // Get delay time
    //        var delayObject: AnyObject = unsafeBitCast(
    //            CFDictionaryGetValue(gifProperties,
    //                Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
    //            to: AnyObject.self)
    //        if delayObject.doubleValue == 0 {
    //            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
    //                Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
    //        }
    //
    //        if let delayObject = delayObject as? Double, delayObject > 0 {
    //            delay = delayObject
    //        } else {
    //            delay = 0.1 // Make sure they're not too fast
    //        }
    //
    //        return delay
    //    }
    //
    //    internal class func gcdForPair(_ lhs: Int?, _ rhs: Int?) -> Int {
    //        var lhs = lhs
    //        var rhs = rhs
    //        // Check if one of them is nil
    //        if rhs == nil || lhs == nil {
    //            if rhs != nil {
    //                return rhs!
    //            } else if lhs != nil {
    //                return lhs!
    //            } else {
    //                return 0
    //            }
    //        }
    //
    //        // Swap for modulo
    //        if lhs! < rhs! {
    //            let ctp = lhs
    //            lhs = rhs
    //            rhs = ctp
    //        }
    //
    //        // Get greatest common divisor
    //        var rest: Int
    //        while true {
    //            rest = lhs! % rhs!
    //
    //            if rest == 0 {
    //                return rhs! // Found it
    //            } else {
    //                lhs = rhs
    //                rhs = rest
    //            }
    //        }
    //    }
    //
    //    internal class func gcdForArray(_ array: [Int]) -> Int {
    //        if array.isEmpty {
    //            return 1
    //        }
    //
    //        var gcd = array[0]
    //
    //        for val in array {
    //            gcd = UIImage.gcdForPair(val, gcd)
    //        }
    //
    //        return gcd
    //    }
    //
    //    internal class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
    //        let count = CGImageSourceGetCount(source)
    //        var images = [CGImage]()
    //        var delays = [Int]()
    //
    //        // Fill arrays
    //        for index in 0..<count {
    //            // Add image
    //            if let image = CGImageSourceCreateImageAtIndex(source, index, nil) {
    //                images.append(image)
    //            }
    //
    //            // At it's delay in cs
    //            let delaySeconds = UIImage.delayForImageAtIndex(Int(index),
    //                source: source)
    //            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
    //        }
    //
    //        // Calculate full duration
    //        let duration: Int = {
    //            var sum = 0
    //
    //            for val: Int in delays {
    //                sum += val
    //            }
    //
    //            return sum
    //            }()
    //
    //        // Get frames
    //        let gcd = gcdForArray(delays)
    //        var frames = [UIImage]()
    //
    //        var frame: UIImage
    //        var frameCount: Int
    //        for index in 0..<count {
    //            frame = UIImage(cgImage: images[Int(index)])
    //            frameCount = Int(delays[Int(index)] / gcd)
    //
    //            for _ in 0..<frameCount {
    //                frames.append(frame)
    //            }
    //        }
    //
    //        // Heyhey
    //        let animation = UIImage.animatedImage(with: frames,
    //            duration: Double(duration) / 1000.0)
    //
    //        return animation
    //    }
    //
}

extension UITextFieldDelegate {
    func doneButtonTapped() {
        
    }
}
extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            //Different colors in placeholder UITextField
            guard var placeHolderText = self.placeholder?.count ?? 0 > 0 ? self.placeholder : "" else { return}
            if placeHolderText.contains("*") {
                placeHolderText = placeHolderText.replacingOccurrences(of: "*", with: "", options: .literal, range: nil)
                // let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.lightGray]
                // let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.red]
                let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.lightGray]
                let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor.red]
                let attributedString1 = NSMutableAttributedString(string: "   " + placeHolderText, attributes:attrs1)
                let attributedString2 = NSMutableAttributedString(string:"*", attributes:attrs2)
                attributedString1.append(attributedString2)
                self.attributedPlaceholder = attributedString1
            }
            else {
                let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.lightGray]
                let attributedString = NSMutableAttributedString(string: "   " + placeHolderText, attributes:attrs1)
                self.attributedPlaceholder = attributedString
            }
        }
    }
    
    
    
    //    func isStrongPassword(text: String) -> (Bool, String, UIColor) {
    //        let strongPassword = Constant.regularExpression
    //        let specialCharacterString = Constant.specialCharacterString
    //        let specialCharacterNumber = Constant.specialCharacterNumber
    //        //let specialCharacterAlphabetsUpperCase = Constant.specialCharacterAlphabetsUpperCase
    //        let specialCharacterAlphabetsLowerCase = Constant.specialCharacterAlphabetsLowerCase
    //
    //        if text.count == 0 {
    //            return (true, "", .clrPasswordEmpty)
    //        }
    //        if text.count < 5 {
    //            return (true, "Weak", .clrPasswordWeak)
    //        }
    //        var count = 0
    //        if NSPredicate.init(format: "SELF MATCHES %@", specialCharacterString).evaluate(with: text) {
    //            count += 1
    //        }
    //        if NSPredicate.init(format: "SELF MATCHES %@", specialCharacterNumber).evaluate(with: text) {
    //            count += 1
    //        }
    //        //        if NSPredicate.init(format: "SELF MATCHES %@", specialCharacterAlphabetsUpperCase).evaluate(with: text) {
    //        //            count += 1
    //        //        }
    //        if NSPredicate.init(format: "SELF MATCHES %@", specialCharacterAlphabetsLowerCase).evaluate(with: text) {
    //            count += 1
    //        }
    //        if NSPredicate.init(format: "SELF MATCHES %@", strongPassword).evaluate(with: text) {
    //            count += 1
    //        }
    //
    //        if text.count < 8 {
    //            return (true, "Weak", .clrPasswordWeak)
    //        }
    //        if count <= 2 {
    //            return (true, "Weak", .clrPasswordWeak)
    //        }
    //        if count == 3 {
    //            return (true, "Medium", .clrPasswordMedium)
    //        }
    //        //        if count == 4 {
    //        //            return (true, "Medium", .clrPasswordMedium)
    //        //        }
    //        if count == 4 {
    //            return (true, "Strong", .clrPasswordStrong)
    //        }
    //        return (true, "Weak", .clrPasswordWeak)
    //    }
    //    func validatePasswordFailed(text: String) -> (Bool, String) {
    //        let strongPassword = Constant.regularExpression
    //        let specialCharacterString = Constant.specialCharacterString
    //        let specialCharacterNumber = Constant.specialCharacterNumber
    //        let specialCharacterAlphabetsUpperCase = Constant.specialCharacterAlphabetsUpperCase
    //        let specialCharacterAlphabetsLowerCase = Constant.specialCharacterAlphabetsLowerCase
    //        if text.count < 2 {
    //            return (true, Constant.passwordHint)
    //        }
    //        if text.count < 8 {
    //            return (true, "Password must contain at least 8 character.")
    //        }
    //        if !NSPredicate.init(format: "SELF MATCHES %@", specialCharacterAlphabetsLowerCase).evaluate(with: text) {
    //            return (true, "Password must contain at least one alphabet Lower Case.")
    //        }
    //        if !NSPredicate.init(format: "SELF MATCHES %@", specialCharacterString).evaluate(with: text) {
    //            return (true, "Your entered password is valid now but good to have at least one special character from these.\n!@#$%^&*()")
    //        }
    //        if !NSPredicate.init(format: "SELF MATCHES %@", specialCharacterNumber).evaluate(with: text) {
    //            return (true, "Password must contain at least one digit")
    //        }
    //        if !NSPredicate.init(format: "SELF MATCHES %@", specialCharacterAlphabetsUpperCase).evaluate(with: text) {
    //            return (true, "Password must contain at least one alphabet Upper Case for strong password.")
    //        }
    //        if NSPredicate.init(format: "SELF MATCHES %@", strongPassword).evaluate(with: text) {
    //            return (true, "Password is 👍")
    //        }
    //
    //        if text.count < 8 {
    //            return (true, "The length of password must be 8 to 32 characters.")
    //        }
    //        else {
    //            return (false, Constant.passwordHint)
    //        }
    //    }
    //
    //    func validatePassword(text: String) -> (Bool, String) {
    //        let strongPassword = Constant.regularExpression
    //        let specialCharacterString = Constant.specialCharacterString
    //        let specialCharacterNumber = Constant.specialCharacterNumber
    //        let specialCharacterAlphabetsUpperCase = Constant.specialCharacterAlphabetsUpperCase
    //        let specialCharacterAlphabetsLowerCase = Constant.specialCharacterAlphabetsLowerCase
    //        if text.count < 2 {
    //            return (false, Constant.passwordHint)
    //        }
    //        if text.count < 8 {
    //            return (true, "Password must contain at least 8 character.")
    //        }
    //        if !NSPredicate.init(format: "SELF MATCHES %@", specialCharacterAlphabetsLowerCase).evaluate(with: text) {
    //            return (false, "Password must contain at least one alphabet Lower Case.")
    //        }
    //        if !NSPredicate.init(format: "SELF MATCHES %@", specialCharacterString).evaluate(with: text) {
    //            return (false, "Your entered password is valid now but good to have at least one special character from these.\n!@#$%^&*()")
    //        }
    //        if !NSPredicate.init(format: "SELF MATCHES %@", specialCharacterNumber).evaluate(with: text) {
    //            return (false, "Password must contain at least one digit")
    //        }
    //        if !NSPredicate.init(format: "SELF MATCHES %@", specialCharacterAlphabetsUpperCase).evaluate(with: text) {
    //            return (true, "Password must contain at least one alphabet Upper Case for strong password.")
    //        }
    //        if NSPredicate.init(format: "SELF MATCHES %@", strongPassword).evaluate(with: text) {
    //            return (true, "Password is 👍")
    //        }
    //
    //        if text.count < 8 {
    //            return (false, "The length of password must be 8 to 32 characters.")
    //        }
    //        else {
    //            return (false, Constant.passwordHint)
    //        }
    //    }
    
    @IBInspectable var doneToolbar: UIToolbar {
        //        set{
        //            let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        //
        //            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        //
        //            let items = [flexSpace, doneButton]
        //            toolbar.items = items
        //            toolbar.sizeToFit()
        //        }
        get {
            let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
            
            let items = [flexSpace, doneButton]
            toolbar.items = items
            
            toolbar.sizeToFit()
            return toolbar
        }
    }
    
    @objc func doneButtonTapped() {
        resignFirstResponder()
    }
    
    func setPickerCustom() -> UIPickerView {
        let picker = UIPickerView()
        //Need assign delegates in UIViewController
        //picker.dataSource = self
        //picker.delegate = self
        self.frame = .zero
        self.inputView = picker
        inputAccessoryView = doneToolbar
        return picker
    }
    
    func setPickerDate() -> UIDatePicker {
        let picker = UIDatePicker()
//        if #available(iOS 15, *) {
//            picker.minimumDate = Date.now
//        } else {
//            picker.minimumDate = Date()
//        }
        //Need assign delegates in UIViewController
        //picker.dataSource = self
        //picker.delegate = self
        frame = .zero
        inputView = picker
        inputAccessoryView = doneToolbar
        //Formate Date
        picker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return picker
    }
    
    func setPickerTime() -> UIDatePicker {
        let picker = UIDatePicker()
        //Need assign delegates in UIViewController
        //picker.dataSource = self
        //picker.delegate = self
        frame = .zero
        inputView = picker
        inputAccessoryView = doneToolbar
        //Formate Date
        picker.datePickerMode = .time
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return picker
    }
    
    
    
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        if action == #selector(copy(_:)) || action == #selector(paste(_:)) || action == #selector(cut(_:)){
            return false
        }
        else if action == #selector(select(_:)) || action == #selector(selectAll(_:)){
            return true
        }
        
        //return super.canPerformAction(action, withSender: sender)
        
        return false
    }
    
    func setPadding() {
        let padding = CGFloat(8.0)
        let defaultRect = CGRect(x: 0, y: 0, width: padding, height: self.frame.height)
        
        //MARK:- Padding Left
        let paddingViewLeft = UIView(frame: self.leftView?.frame ?? defaultRect)
        
        if let leftView = self.leftView {
            for temp in leftView.subviews {
                paddingViewLeft.addSubview(temp)
                paddingViewLeft.frame.size.width += padding
                break
            }
        }
        else {
            //MARK:- if leftView is nill this will use for add padding
            paddingViewLeft.frame = defaultRect
        }
        self.leftView = paddingViewLeft
        paddingViewLeft.backgroundColor = .clear
        self.leftViewMode = .always
        
        //MARK:- Padding Right
        let paddingViewRight = UIView(frame: self.rightView?.frame ?? defaultRect)
        
        if let rightView = self.rightView {
            for temp in rightView.subviews {
                paddingViewRight.addSubview(temp)
                paddingViewRight.frame.size.width += padding
                temp.frame.origin.x = padding
                break
            }
        }
        else {
            //MARK:- if rightView is nill this will use for add padding
            paddingViewRight.frame = defaultRect
        }
        
        self.rightView = paddingViewRight
        paddingViewRight.backgroundColor = .clear
        self.rightViewMode = .always
    }
    
    func setPaddingLeft() {
        let padding = CGFloat(5.0)
        let defaultRect = CGRect(x: 0, y: 0, width: padding, height: self.frame.height)
        
        //MARK:- Padding Left
        let paddingViewLeft = UIView(frame: self.leftView?.frame ?? defaultRect)
        
        if let leftView = self.leftView {
            for temp in leftView.subviews {
                paddingViewLeft.addSubview(temp)
                paddingViewLeft.frame.size.width += padding
                break
            }
        }
        else {
            //MARK:- if leftView is nill this will use for add padding
            paddingViewLeft.frame = defaultRect
        }
        self.leftView = paddingViewLeft
        paddingViewLeft.backgroundColor = .clear
        self.leftViewMode = .always
    }
    
    func setPaddingRight() {
        let padding = CGFloat(5.0)
        let defaultRect = CGRect(x: 0, y: 0, width: padding, height: self.frame.height)
        
        //MARK:- Padding Right
        let paddingViewRight = UIView(frame: self.rightView?.frame ?? defaultRect)
        
        if let rightView = self.rightView {
            for temp in rightView.subviews {
                paddingViewRight.addSubview(temp)
                paddingViewRight.frame.size.width += padding
                temp.frame.origin.x = padding
                break
            }
        }
        else {
            //MARK:- if rightView is nill this will use for add padding
            paddingViewRight.frame = defaultRect
        }
        
        self.rightView = paddingViewRight
        paddingViewRight.backgroundColor = .clear
        self.rightViewMode = .always
    }
    
    func setLeftIcon(icon: String, backGroudColor: UIColor) {
        let iconImageSizePercentage = CGFloat(0.30)
        
        let frameView = UIView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) ), height: ((self.frame.height))))
        let iconImage = UIImage(named: icon)
        frameView.backgroundColor = backGroudColor
        
        let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) * iconImageSizePercentage ), height: ((self.frame.height) * iconImageSizePercentage))) // set your Own size
        iconImageView.image = iconImage
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.backgroundColor = .clear
        
        frameView.addSubview(iconImageView)
        iconImageView.center = frameView.center
        
        leftView = frameView
        leftViewMode = .always
        tintColor = .lightGray
    }
    
    func setRightIcon(icon: String) {
        let iconImageSizePercentage = CGFloat(0.30)
        
        let frameView = UIView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) ), height: ((self.frame.height))))
        let iconImage = UIImage(named: icon)
        frameView.backgroundColor = .clear
        
        let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) * iconImageSizePercentage), height: ((self.frame.height) * iconImageSizePercentage))) // set your Own size
        iconImageView.image = iconImage
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.backgroundColor = .clear
        
        frameView.addSubview(iconImageView)
        iconImageView.center = frameView.center
        
        rightView = frameView
        rightViewMode = .always
        tintColor = .lightGray
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(funBecomeFirstResponder))
        rightView?.addGestureRecognizer(tap)
    }
    
    func setRightIcon(icon: String, padding: Float?) {
        let padding = CGFloat(padding ?? 0.0)
        let iconImageSizePercentage = CGFloat(0.30)
        
        let frameView = UIView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) ), height: ((self.frame.height))))
        let iconImage = UIImage(named: icon)
        frameView.backgroundColor = .clear
        
        let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) * iconImageSizePercentage), height: ((self.frame.height) * iconImageSizePercentage))) // set your Own size
        iconImageView.image = iconImage
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.backgroundColor = .clear
        
        frameView.addSubview(iconImageView)
        iconImageView.center = frameView.center
        
        //MARK:- Padding Right
        let paddingView = UIView(frame: frameView.frame)
        paddingView.frame.size.width = paddingView.frame.width + padding
        paddingView.addSubview(frameView)
        frameView.frame.origin.x = padding
        paddingView.backgroundColor = self.backgroundColor
        
        rightView = paddingView
        rightViewMode = .always
        tintColor = .lightGray
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(funBecomeFirstResponder))
        rightView?.addGestureRecognizer(tap)
    }
    func setRightIcon(icon: String, backGroudColor: UIColor) {
        let iconImageSizePercentage = CGFloat(0.30)
        
        let frameView = UIView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height)), height: ((self.frame.height))))
        let iconImage = UIImage(named: icon)
        frameView.backgroundColor = backGroudColor
        
        let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) * iconImageSizePercentage ), height: ((self.frame.height) * iconImageSizePercentage))) // set your Own size
        iconImageView.image = iconImage
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.backgroundColor = .clear
        
        frameView.addSubview(iconImageView)
        iconImageView.center = frameView.center
        
        self.leftView = frameView
        self.leftViewMode = .always
        self.tintColor = .lightGray
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(funBecomeFirstResponder))
        rightView?.addGestureRecognizer(tap)
    }
    
    func setRightIconButton(icon: String) -> UIButton {
        let iconImageSizePercentage = CGFloat(0.35)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: ((self.frame.height)), height: ((self.frame.height))))
        button.backgroundColor = .clear
        let iconImage = UIImage(named: icon)
        
        let iconImageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: ((self.frame.height) * iconImageSizePercentage ), height: ((self.frame.height) * iconImageSizePercentage))) // set your Own size
        iconImageView.image = iconImage
        iconImageView.contentMode = .scaleAspectFit
        
        let frameView: UIView = UIView(frame: button.frame)
        frameView.backgroundColor = .clear
        frameView.addSubview(iconImageView)
        frameView.addSubview(button)
        
        iconImageView.center = frameView.center
        
        self.rightView = frameView
        self.rightViewMode = .always
        self.tintColor = .red
        
        return button
    }
    
    @objc func funBecomeFirstResponder(sender: Any) {
        self.becomeFirstResponder()
    }
    
}




extension UIDevice {
    var iPhoneX: Bool { UIScreen.main.nativeBounds.height == 2436 }
    var iPhone: Bool { UIDevice.current.userInterfaceIdiom == .phone }
    var iPad: Bool { UIDevice().userInterfaceIdiom == .pad }
    enum ScreenType: String {
        case iPhones_4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhones_6Plus_6sPlus_7Plus_8Plus_Simulators = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus Simulators"
        case iPhones_X_XS_12MiniSimulator = "iPhone X or iPhone XS or iPhone 12 Mini Simulator"
        case iPhone_XR_11 = "iPhone XR or iPhone 11"
        case iPhone_XSMax_ProMax = "iPhone XS Max or iPhone Pro Max"
        case iPhone_11Pro = "iPhone 11 Pro"
        case iPhone_12Mini = "iPhone 12 Mini"
        case iPhone_12_12Pro = "iPhone 12 or iPhone 12 Pro"
        case iPhone_12ProMax = "iPhone 12 Pro Max"
        case unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 1136: return .iPhones_5_5s_5c_SE
        case 1334: return .iPhones_6_6s_7_8
        case 1792: return .iPhone_XR_11
        case 1920: return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2208: return .iPhones_6Plus_6sPlus_7Plus_8Plus_Simulators
        case 2340: return .iPhone_12Mini
        case 2426: return .iPhone_11Pro
        case 2436: return .iPhones_X_XS_12MiniSimulator
        case 2532: return .iPhone_12_12Pro
        case 2688: return .iPhone_XSMax_ProMax
        case 2778: return .iPhone_12ProMax
        default: return .unknown
        }
    }
}



extension UIDatePicker {
    func setMinimumDate(_ date: Date) {
        self.minimumDate = date
    }
    
    func setMaximumDate(_ date: Date) {
        self.maximumDate = date
    }
    
    func setDateSelectionRange(from fromDate: Date, to toDate: Date) {
        setMinimumDate(fromDate)
        setMaximumDate(toDate)
    }
    
    func futureDatesOnly() {
        minimumDate = Date()
    }
    
    func fromToday() {
        minimumDate = Date()
    }
}



extension UITextView {
    
    func error() {
        (self.superview as? ViewSettingCornorRadius)?.setErrorBorder()
        (self.superview as? ViewShadow)?.setErrorBorder()
    }
    
    func clearError() {
        (self.superview as? ViewSettingCornorRadius)?.setNormalBorder()
        (self.superview as? ViewShadow)?.setNoBorder()
    }
}

private let iPhoneMiniMultiplier = 1.0
private let iPhoneMultiplier = 1.3
private let iPadMultiplier = 1.6

private let iPhoneMiniIdentifiers : [
    UIDevice.ScreenType
] = [
    .iPhones_5_5s_5c_SE,
    .iPhones_6_6s_7_8,
    .iPhone_12Mini,
]


extension CGFloat {
    var adjustedFontSize: CGFloat {
        var fontSize = self
        if IPAD {
            fontSize *= iPadMultiplier
        } else if iPhoneMiniIdentifiers.contains(UIDevice.current.screenType) {
            fontSize *= iPhoneMiniMultiplier
        } else {
            fontSize *= iPhoneMultiplier
        }
        
        return fontSize
    }
}

enum name: String {
    //MARK: - Prefetch APIs

    //MARK: - Auth
    case login = "auth/login"
    case check = "auth/check/"
    case otp = "auth/otp"
    case passwordUpdate = "auth/password"
    case c4cRegister = "auth/c4c/register"
    case idpRegister = "auth/idp/register"
    case updateFcmToken = "/auth/fcm"
    
    
}

enum storyBoards : String {
    case main = "Main"
    
}

