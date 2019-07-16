//
//  AppUtility.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import Foundation
import UIKit

//Show ALert
func showAlert(_ message: String) {
    
    let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
    alertViewController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    
    UIApplication.shared.keyWindow?.rootViewController?.present(alertViewController, animated: true, completion: nil)
}

