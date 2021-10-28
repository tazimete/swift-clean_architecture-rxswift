//
//  ApiClient.swift
//  tawktestios
//
//  Created by JMC on 24/7/21.
//

import UIKit

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
}
