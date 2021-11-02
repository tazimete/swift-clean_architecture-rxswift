//
//  URLSessionProtocol.swift
//  setScheduleTest
//
//  Created by JMC on 3/11/21.
//

import UIKit

typealias URLSessionDataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol AbstractURLSession: AnyObject {
    var customConfig: URLSessionConfiguration {get set}
    init(configuration: URLSessionConfiguration)
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionDataTaskResult) -> URLSessionDataTask
}

struct URLSessionConfigHolder {
    static var config: URLSessionConfiguration = URLSessionConfiguration.default
}

extension AbstractURLSession {
    var customConfig: URLSessionConfiguration {
        get {
            if customConfig == nil {
                let config = URLSessionConfiguration.default
                config.requestCachePolicy = .reloadIgnoringLocalCacheData
                config.urlCache = nil
                
                return config
            }
            return URLSessionConfigHolder.config
        }set(newValue) {
            URLSessionConfigHolder.config  = newValue
        }
        
    }
}

extension URLSession: AbstractURLSession {
    convenience init(config: URLSessionConfiguration) {
        self.init(configuration: config)
        customConfig = config
    }
    
}

