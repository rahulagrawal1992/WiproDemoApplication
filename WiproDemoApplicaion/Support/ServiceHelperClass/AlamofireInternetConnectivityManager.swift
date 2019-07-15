//
//  AlamofireInternetConnectivityManager.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class AlamofireInternetConnectivityManager : NSObject{
    //Class signleton object
    static var isAlertShown = false
    
    static var _sharedManager : AlamofireInternetConnectivityManager?
    static var sharedManager: AlamofireInternetConnectivityManager!{
        get{
            if _sharedManager == nil{
                _sharedManager = AlamofireInternetConnectivityManager()
            }
            
            return _sharedManager
        }
    }
    
    //Class function
    class func isInternetAvailable() -> Bool{
        let reachabilityManager = Alamofire.NetworkReachabilityManager(host: BASE_URL)
        
        if let reachabilityManager = reachabilityManager, reachabilityManager.networkReachabilityStatus == .reachable(.ethernetOrWiFi) || reachabilityManager.networkReachabilityStatus == .reachable(.wwan) {
            return true
        }else {
            return false
        }
    }
    
    class func checkInternetAvailability() -> Bool {
        
        if !isInternetAvailable() {
          //  showAlert(MSG_NETWORK_FAILURE)
            return false
        }
        else {
            return true
        }
    }
    
    override init() {
        super.init()
    }
    
    static func checkForServerError( _ error : Error) {
        var localizedErrorString : String?
        switch error._code{
        case -1003, -1001, -1011, -1020:
            localizedErrorString = "Looks like we have encountered a problem. Please try again."
        case -1009, -1005:
            localizedErrorString = "Seems you are offline. Please check your network connection."
        case -1018:
            localizedErrorString = "Looks like you are Roaming. Please check your network connection."
        default:
            if error._code == 3840 {
                localizedErrorString = "Oops, something went wrong. Please try after sometime."
            }
        }
        
        if localizedErrorString == nil || localizedErrorString?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return
        }
        
        if let _localizedErrorString = localizedErrorString, localizedErrorString != ""{
            if !AlamofireInternetConnectivityManager.isAlertShown {
            //    showAlert(_localizedErrorString)
            }
        }
        
    }
}
