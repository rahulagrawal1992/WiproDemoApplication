//
//  AlamofireServiceRequesManager.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import Foundation
import Alamofire
import CoreTelephony


class AlamofireServiceRequesManager: SessionManager {
    
    enum NetworkError: Error {
        case invalidURL(String)
        case parsingError(String)
    }
    
    func get(_ URLString: String!, method: HTTPMethod, parameters: Parameters?, headers: [String: String]? = nil, encoding: ParameterEncoding? = nil, success: ((String?, Any?) -> Void)!, failure: ((String?, Error?) -> Void)!) -> DataRequest? {
        
        let apiUrl = BASE_URL + URLString

        let request = self.request(apiUrl, method: method, parameters: parameters, encoding: encoding ?? URLEncoding.default, headers: headers)

        return request
                    .validate(statusCode: 200..<4000)
                    .responseData { response in
                        switch response.result {
                        case .success:
                            if let value = response.result.value {
                                do {
                                    let responseJSON = try JSONSerialization.jsonObject(with: value, options: [.allowFragments])
                                    success(apiUrl, responseJSON)
                                } catch {
                                    let responsePercentageEncodedString = String(data: value, encoding: String.Encoding.ascii)
                                    if let responseString =  responsePercentageEncodedString?.removingPercentEncoding {
                                            if let responseData = responseString.data(using: String.Encoding.utf8), let responseJSON = try? JSONSerialization.jsonObject(with: responseData, options: [.allowFragments]) {
                                                success(apiUrl, responseJSON)
                                        }
                                        else{
                                            failure(apiUrl, NetworkError.parsingError("Error while parsing response"))
                                        }
                                    }else {
                                        failure(apiUrl, NetworkError.parsingError("Error while parsing response"))
                                    }
                                }
                            }else {
                                failure(apiUrl, NetworkError.parsingError("Error while parsing response"))
                            }
                        case .failure(let error):
                            AlamofireInternetConnectivityManager.checkForServerError(error)
                            failure(apiUrl, error)
                        }
                }
    }
}
