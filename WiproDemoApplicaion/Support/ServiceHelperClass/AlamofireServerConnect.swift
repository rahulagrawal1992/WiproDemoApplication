//
//  AlamofireServerConnect.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

/**
 HTTP Request Type Enum
 
 - get:  To mark request of HTTP GET type
 - post: To mark request of HTTP POST type
 */
enum HTTP_REQUEST_TYPE{
    case get
    case post
    case put
}

/**
 Enum to define Web Request Priorty
 
 - low:      To mark request as Low Priority
 - moderate: To mark request as Moderate Priority
 - high:     To mark request as High Priority
 */
enum REQUEST_PRIORITY{
    case low
    case moderate
    case high
}

typealias CompletionBlockType  = ((_ url : String?, _ statusCode: Int, _ response: Any?, _ errorMessage: String?)->())
typealias FailureBlockType  = ((_ url : String?, _ error: Error?)->())

/**
 Base class for all web services to control server communication.
 */
import Alamofire

class AlamofireServerConnect{
    /**
     Http Request Type for the web service call
     */
    var httpRequestType: HTTP_REQUEST_TYPE?
    
    /**
     Priorty for request
     */
    var requestPriority: REQUEST_PRIORITY
    
    var completionBlockWithSuccess: CompletionBlockType?
    var completionBlockWithFailure: FailureBlockType?
    
    static var requestOperationManagerSingleton : AlamofireServiceRequesManager!
    
    static var requestOperationManager: AlamofireServiceRequesManager!{
        get
        {
            if requestOperationManagerSingleton == nil
            {
        
                let configuration = URLSessionConfiguration.default
                setCommonRequestHeaders(configuration: configuration)
                
                requestOperationManagerSingleton = AlamofireServiceRequesManager(configuration: configuration)
            }
            
            return requestOperationManagerSingleton
        }
        set{}
    }
    
    /**
     Place common request headers in each and every request made to server
     */
    static func setCommonRequestHeaders(configuration: URLSessionConfiguration) {
        configuration.httpAdditionalHeaders = [
                                               "Accept": "application/json"]
    }
    
    init(httpRequestType: HTTP_REQUEST_TYPE, requestPriority: REQUEST_PRIORITY){
        self.httpRequestType = httpRequestType
        self.requestPriority = requestPriority
    }
}
