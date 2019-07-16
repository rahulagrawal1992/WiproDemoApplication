//
//  GalleryViewModel.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import Foundation

class GalleryViewModel {
    
    // Property Define
    private var dataUpdatedAction: (()->())

    var data : CountryResponse? {
        didSet {
            dataUpdatedAction()
        }
    }
    
    init(dataUpdatedAction: @escaping (()->())) {
        self.dataUpdatedAction = dataUpdatedAction
    }
    
    func getData() -> [Record] {
        return (data?.rows) ?? [Record]()
    }
    
    func getTitle() -> String? {
        return data?.title
    }
    
    //MARK:- Api Methods
    func getDataFromApi(completion: (()->())? = nil) {
        
        let gellaryServiceObj = GalleryService(httpRequestType: HTTP_REQUEST_TYPE.get, requestPriority: REQUEST_PRIORITY.moderate)
        
        gellaryServiceObj.completionBlockWithSuccess = ({ [weak self] (url, statusCode, response, errorMessage) in
            
            self?.data = response as? CountryResponse
            
            if let _errorMessage = errorMessage, statusCode == 0 {
                showAlert(_errorMessage)
            }
            completion?()
        })
        
        gellaryServiceObj.completionBlockWithFailure = ({(url, error) in
            showAlert(error.debugDescription)
            completion?()
        })
        
        gellaryServiceObj.getDataFromServer()
    }
}
