//
//  ApiClient.swift
//  tawktestios
//
//  Created by JMC on 24/7/21.
//

import RxSwift
import RxCocoa

public enum NetworkError: Error {
    case serverError(code: Int, message: String)
    case decodingError(code: Int, message: String)
    case wrongMimeTypeError(code: Int, message: String)
    case noDataError(code: Int, message: String)
    
    public var errorMessage: String {
        switch self {
        case .serverError(_, let message):
            return message
        case .decodingError(_, let message):
            return message
        case .wrongMimeTypeError(_, let message):
            return message
        case .noDataError(_, let message):
            return message
        }
    }
    
    public var errorCode: Int {
        switch self {
        case .serverError(let code, _):
            return code
        case .decodingError(let code, _):
            return code
        case .wrongMimeTypeError(let code, _):
            return code
        case .noDataError(let code, _):
            return code
        }
    }
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
    
    func send<T: Codable>(apiRequest: APIRequest, type: T.Type) -> Observable<T> {
        let request = apiRequest.request(with: apiRequest.baseURL)
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession(configuration: config)

        return Observable.create { observer -> Disposable in
            session.dataTask(with: request) { [weak self] data, response, error in
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
