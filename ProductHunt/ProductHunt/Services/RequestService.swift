//
//  RequestService.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 19.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import Alamofire
import SwiftyJSON

typealias RequestBasicCompletionHandler = (_ response: NSDictionary?, _ error: NSError?) -> Void

class RequestService {
    
    let applicationBaseURL = "https://api.producthunt.com/v1/"
    let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Content-type": "application/json",
        "Authorization": "Bearer 591f99547f569b05ba7d8777e2e0824eea16c440292cce1f8dfb3952cc9937ff",
        "Host": "api.producthunt.com"
    ]
    
    func sendRequest(endPoint: String, completionHandler: @escaping RequestBasicCompletionHandler) {
        let url = applicationBaseURL + endPoint
        Alamofire.request(url, method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value as? NSDictionary, nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(nil, error as NSError?)
                }
            }
    }
}
