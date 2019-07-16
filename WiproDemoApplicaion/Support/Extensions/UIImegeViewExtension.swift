//
//  UIImegeViewExtension.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 12/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//
import UIKit
import Foundation
import Alamofire
import AlamofireImage

extension UIImageView {
    
    public func imageFromUrl(_ urlString: String?) {
    
        guard let _urlString = urlString else {
            self.image = nil
            return
        }
        
        Alamofire.request(_urlString).responseImage {[weak self] response in
            
            if let image = response.result.value {
                self?.image = image
            }
        }
    }
}
