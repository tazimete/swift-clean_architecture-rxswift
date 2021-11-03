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

public func getStubbResponse<T: Codable>(type: T.Type, completionHandler: @escaping (NetworkCompletionHandler<T>)){
    let data = StubResponseProvider.get(type: type)
    
    guard let data = data else {
        completionHandler(.failure(.noDataError(code: 401, message: "No data found in response")))
        return
    }
    
    guard let resultData = try? JSONDecoder().decode(T.self, from: data) else {
        completionHandler(.failure(.decodingError(code: 401, message: "No data found in response")))
        return
    }
    
    completionHandler(.success(resultData))
}
