//
//  ApiRouter.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 19.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class ApiRouter {
    
    private var requestService = RequestService()
    
    func getPosts(slug:String, completionHandler: @escaping (_ posts: Posts?, _ error: NSError?) -> Void) {
        requestService.sendRequest(endPoint: "categories/" + slug + "/posts") { (response, error) in
            if error == nil {
                let json = JSON(response as NSDictionary!)
                guard let posts = Mapper<Posts>().map(JSON: json.rawValue as! [String : Any]) else {
                    completionHandler(nil, NSError(domain: "ProductHunt", code: 99, userInfo: nil))
                    return
                }
                completionHandler(posts, nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
    
    func getCategories(completionHandler: @escaping (_ categories: Categories?, _ error: NSError?) -> Void) {
        requestService.sendRequest(endPoint: "categories/") { (response, error) in
            if error == nil {
                let json = JSON(response as NSDictionary!)
                guard let categories = Mapper<Categories>().map(JSON: json.rawValue as! [String : Any]) else {
                    completionHandler(nil, NSError(domain: "ProductHunt", code: 99, userInfo: nil))
                    return
                }
                completionHandler(categories, nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
}
