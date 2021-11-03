//
//  MockURLSession.swift
//  setScheduleTestTests
//
//  Created by JMC on 3/11/21.
//

import Foundation
@testable import setScheduleTest

class MockURLSession: AbstractURLSession {
    var responseType: Codable.Type?
    
    required init(configuration: URLSessionConfiguration = URLSessionConfigHolder.config) {
        defaultConfig = configuration
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionDataTaskResult) -> URLSessionDataTask {
//        let data = StubResponseProvider.get(type: getType(type: responseType!.self))
        let data = StubResponseProvider.get(type: SearchResponse<Movie>.self)
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "1.0", headerFields: request.allHTTPHeaderFields)
        let error: Error? = nil
        
        completionHandler(data, response, error)
        
        return URLSession.shared.dataTask(with: request.url!)
    }
    
    private func getType<T: Codable>(type: T.Type) -> T.Type {
        var result: T.Type!
        
        if type is SearchResponse<Movie>.Type {
            result = SearchResponse<Movie>() as! T.Type
        }
        
        return result
    }
}
