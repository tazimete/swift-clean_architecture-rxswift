//
//  ApiClient.swift
//  tawktestios
//
//  Created by JMC on 24/7/21.
//

import RxSwift
import RxCocoa

public enum NetworkError: Error {
    case serverError
    case decodingError
    case wrongMimeTypeError
    case noDataError
}


public class APIClient: AbstractApiClient{
    public static let shared = APIClient()
    public var queueManager: QueueManager

    
    public init(withQueueManager queueManager: QueueManager = QueueManager()) {
        self.queueManager = queueManager
    }
    
    public func enqueue<T: Codable>(apiRequest: APIRequest, type: T.Type, completionHandler: @escaping (NetworkCompletionHandler<T>)) {
        let operation = NetworkOperation(apiRequest: apiRequest, type: type, completionHandler: completionHandler)
        operation.qualityOfService = .utility
        queueManager.enqueue(operation)
    }
    
    func send<T: Codable>(apiRequest: APIRequest, type: T.Type) -> Observable<Result<T.Type, NetworkError>> {
        var observableResult: Observable<Result<T.Type, NetworkError>>!
        let request = apiRequest.request(with: apiRequest.baseURL)
        
//        return URLSession.shared.rx.data(request: request)
//            .map { data in
//                let response = try JSONDecoder().decode(T.self, from: data) as! T.Type
//                observableResult = Observable.just(.success(response))
//                return observableResult
//            }.observe(on: MainScheduler.asyncInstance)
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession(configuration: config)

        session.dataTask(with: request) { [weak self] data, response, error in
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                observableResult = Observable.just(.failure(.serverError))
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                observableResult = Observable.just(.failure(.wrongMimeTypeError))
                return
            }

            guard let responseData = data else{
                observableResult = Observable.just(.failure(.noDataError))
                return
            }
             
             let resultData = try? JSONDecoder().decode(T.self, from: responseData)
            
             if let result = resultData{
                observableResult = Observable.just(.success(result as! T.Type))
             }else{
                observableResult = Observable.just(.failure(.decodingError))
             }
       }
        
        return observableResult
    }
}
