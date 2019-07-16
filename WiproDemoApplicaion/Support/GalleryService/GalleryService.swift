//
//  GalleryService.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import Foundation

class GalleryService: AlamofireServerConnect {
   
    func getDataFromServer() {
        
        let _ = AlamofireServerConnect.requestOperationManager.get("/s/2iodh4vg0eortkl/facts.json", method: .get, parameters: nil, success: {(url : String? , responseObject: Any?) in
            
            
            if let serverResponse = responseObject as? Dictionary<String, Any> {
                let responseDic =  CountryResponse(fromDictionary: serverResponse)
                self.completionBlockWithSuccess?(url, 1, responseDic, nil);
            }
            else {
                self.completionBlockWithSuccess?(url, 0, nil, "Oops!! Something went wrong");
            }
            },
            failure: {(url : String?, error:Error?) in
                self.completionBlockWithFailure?(nil, error)
            }
        )
    }
}
