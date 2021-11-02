//
//  URLSessionProtocol.swift
//  setScheduleTest
//
//  Created by JMC on 3/11/21.
//

import UIKit

typealias URLSessionDataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol AbstractURLSession: AnyObject {
    var defaultConfig: URLSessionConfiguration {get set}
    init(configuration: URLSessionConfiguration)
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionDataTaskResult) -> URLSessionDataTask
}

class URLSessionConfigHolder {
    static var config: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        return config
    }()
}

extension AbstractURLSession {
    var defaultConfig: URLSessionConfiguration {
        get {
            return URLSessionConfigHolder.config
        }set(newValue) {
            URLSessionConfigHolder.config  = newValue
        }
        
    }
}

extension URLSession: AbstractURLSession {
    convenience init(config: URLSessionConfiguration = URLSessionConfigHolder.config) {
        self.init(configuration: config)
        defaultConfig = config
    }
}

