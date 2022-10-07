//
//  Variables.swift
//  AABEngage
//
//  Created by Shakeel Ahmed on 25/10/2021.
//

import Foundation
import UIKit

let kDefaults = UserDefaults.standard
let kAppName = "AABEngage"
var kAccessToken = ""
let kCustomerSupportNumber = "8001800"
let kCustomerSupportNumberToyota = "8001800"
let kCustomerSupportNumberLexus = "8002929"


var kFcmToken = kDefaults.value(forKey: "fcmToken") as? String ?? ""

let IPAD = UIScreen.main.traitCollection.userInterfaceIdiom == .pad
let iPhoneMini : [
    UIDevice.ScreenType
] = [
    .iPhones_5_5s_5c_SE,
    .iPhones_6_6s_7_8,
    .iPhone_12Mini,
]

var kIsLogin = false
var kisGuestUser = true
var kManual = 1
var kGoogle = 2
var kFaceBook = 3
var kApple = 4
var kRegistrationType = 0

