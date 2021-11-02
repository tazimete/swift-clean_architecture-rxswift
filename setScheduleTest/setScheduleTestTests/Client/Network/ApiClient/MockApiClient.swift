//
//  MockApiClient.swift
//  setScheduleTestTests
//
//  Created by JMC on 2/11/21.
//

import Foundation
@testable import setScheduleTest
import RxSwift


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
