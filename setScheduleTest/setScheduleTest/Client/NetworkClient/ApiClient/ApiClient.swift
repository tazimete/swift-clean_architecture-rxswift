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
    
    func send<T: Codable>(apiRequest: APIRequest, type: T.Type) -> Observable<Result<Observable<T>, NetworkError>> {
        let request = apiRequest.request(with: apiRequest.baseURL)
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession(configuration: config)

        return Observable.create { observer -> Disposable in
            session.dataTask(with: request) { [weak self] data, response, error in
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onNext(.failure(.serverError))
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    observer.onNext(.failure(.wrongMimeTypeError))
                    return
                }

                guard let responseData = data else{
                    observer.onNext(.failure(.noDataError))
                    return
                }
                 
                 let resultData = try? JSONDecoder().decode(T.self, from: responseData)
                
                 if let result = resultData{
                    observer.onNext(.success(Observable.just(result)))
                 }else{
                    observer.onNext(.failure(.decodingError))
                 }
                
                observer.onCompleted()
            }.resume()
            
            return Disposables.create()
        }
    }
}
