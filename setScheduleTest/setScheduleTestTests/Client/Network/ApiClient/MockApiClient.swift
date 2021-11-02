//
//  MockApiClient.swift
//  setScheduleTestTests
//
//  Created by JMC on 2/11/21.
//

import Foundation
@testable import setScheduleTest
import RxSwift

class MockAPIClient: AbstractApiClient{
    public static let shared = MockAPIClient()
    public var queueManager: QueueManager

    
    public init(withQueueManager queueManager: QueueManager = QueueManager()) {
        self.queueManager = queueManager
    }
    
    public func enqueue<T: Codable>(apiRequest: APIRequest, type: T.Type, completionHandler: @escaping (NetworkCompletionHandler<T>)) {
        let operation = NetworkOperation(apiRequest: apiRequest, type: type, completionHandler: completionHandler)
        operation.qualityOfService = .utility
        queueManager.enqueue(operation)
    }
    
    public func send<T: Codable>(apiRequest: APIRequest, type: T.Type) -> Observable<T> {
        let request = apiRequest.request(with: apiRequest.baseURL)
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession(configuration: config)

        return Observable.create { observer -> Disposable in
            session.dataTask(with: request) { [weak self] data, response, error in
                
                debugPrint("ApiClient -- send() -- response = \((try? JSONSerialization.jsonObject(with: data ?? Data([]), options: .allowFragments)) ?? NSDictionary())")
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onError(NetworkError.serverError(code: (response as? HTTPURLResponse)?.statusCode ?? 401, message: "Request failed"))
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    observer.onError(NetworkError.wrongMimeTypeError(code: response.statusCode, message: "Wrong mimetype"))
                    return
                }

                guard let responseData = data else{
                    observer.onError(NetworkError.noDataError(code: response.statusCode, message: "No data found in response"))
                    return
                }
                 
                 let resultData = try? JSONDecoder().decode(T.self, from: responseData)
                
                 if let result = resultData{
                    observer.onNext(result)
                 }else{
                    observer.onError(NetworkError.decodingError(code: response.statusCode, message: "Decoding error, Wrong response type"))
                 }
                
                observer.onCompleted()
            }.resume()
            
            return Disposables.create()
        }
    }
}
