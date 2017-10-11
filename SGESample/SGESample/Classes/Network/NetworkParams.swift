
//
//  NetworkParams.swift
//  SGESample
//
//  Created by Niraj Kumar on 10/9/17.
//  Copyright © 2017 Niraj Kumar. All rights reserved.
//

import Foundation

class NetworkParams: NSObject {
    static let sharedInstance = NetworkParams()
    
    let serviceUrl = "http://aladdin-stg.azurewebsites.net/mobile_requestor/printjson.php?"
    
    func getServiceParams(serviceKey:String!, params:[String:AnyObject]) -> [String:AnyObject] {
        var urlparams = [
            "workRequest" : [
                "method": "GET",
                "urlMethod" : "\(serviceUrl)",
                "headers" : [
                    "Content-Type": "application/json"
                ]
            ],
            "workHistory" : [
                "method": "GET",
                "urlMethod" : "\(serviceUrl)",
                "headers" : [
                    "Content-Type": "application/json"
                ]
            ]
        ]
        
        if urlparams[serviceKey] != nil {
            urlparams[serviceKey]!["params"] = params
            var paramStr = ""
            for (key,value) in urlparams[serviceKey]!["params"]! as! [String:AnyObject]{
                if value as? String == nil {
                    // Value not available.
                }else {
                    let scapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                    let scapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                    paramStr += "\(scapedKey)=\(scapedValue)"
                    if params.count > 1 {
                        paramStr += "\(paramStr)&"
                    }
                }
            }
            
            if let url:String = urlparams[serviceKey]?["urlMethod"] as? String, "GET".compare(urlparams[serviceKey]?["method"] as! String) == .orderedSame {
                urlparams[serviceKey]?["urlMethod"] = "\(url)\(paramStr)"
            }
        }
        return urlparams[serviceKey]! as [String : AnyObject]
    }
    
    func callWs(serviceKey:String!, params:[String:AnyObject], successCallback:@escaping (_ result:AnyObject) -> Void, errorCallback: @escaping (_ result:AnyObject) -> Void) -> Void {
        
        let urlParams = getServiceParams(serviceKey: serviceKey, params: params)
        
        if let url = URL(string: urlParams["urlMethod"] as! String) {
            var request = URLRequest(url: url)
            if let method:String = urlParams["method"] as? String{
                request.httpMethod = method
            }
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                        successCallback(json as AnyObject)
                    }else {
                        errorCallback(error as AnyObject)
                    }
                }else {
                    errorCallback(error as AnyObject)
                }
            })
            task.resume()
        }
    }
    
}
