//
//  NetworkOperation.swift
//  tawktestios
//
//  Created by JMC on 25/7/21.
//

import Foundation
import UIKit

public class NetworkOperation: Operation {
    
    private var task: URLSessionTask?
    
    enum OperationState: Int {
        case ready
        case executing
        case finished
    }
    
    // default state is ready (when the operation is created)
    private var state : OperationState = .ready {
        willSet {
            self.willChangeValue(forKey: "isExecuting")
            self.willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            self.didChangeValue(forKey: "isExecuting")
            self.didChangeValue(forKey: "isFinished")
        }
    }
    
    override public var isReady: Bool { return state == .ready }
    override public var isExecuting: Bool { return state == .executing }
    override public var isFinished: Bool { return state == .finished }
    
    public override init() {
        super.init()
    }
    
    public init<T: Codable>(apiRequest: APIRequest, type: T.Type, completionHandler: @escaping (NetworkCompletionHandler<T>)){
        super.init()
    
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession(configuration: config)
        let request = apiRequest.request(with: apiRequest.baseURL)

        task = session.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                     completionHandler(.failure(.serverError))
                     self?.state = .finished
                     return
                }

                guard let mime = response.mimeType, mime == "application/json" else {
                     completionHandler(.failure(.wrongMimeTypeError))
                     self?.state = .finished
                     return
                }

                guard let responseData = data else{
                     completionHandler(.failure(.noDataError))
                     self?.state = .finished
                     return
                }
                 
                 let resultData = try? JSONDecoder().decode(T.self, from: responseData)
                
                 if let result = resultData{
                     completionHandler(.success(result))
                 }else{
                     completionHandler(.failure(.decodingError))
                 }
                
                 self?.state = .finished
            }
       }
    }
    
    public init(session: URLSession, downloadTaskURL: URL, completionHandler: @escaping DownloadResultHandler) {
           super.init()
        
        let imageUrlString = downloadTaskURL.absoluteString
                
        print("Downloading --  \(imageUrlString)")
        
        task = session.dataTask(with: downloadTaskURL) { [weak self] (data, response, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    completionHandler(.failure(.serverError))
                }
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataError))
                return
            }
            
            // Always execute completion handler explicitly on main thread
            DispatchQueue.main.async {
                completionHandler(.success(.init(url: imageUrlString, data: data, isCached: false)))
                self?.state = .finished
            }
        }
    }
    
    override public func start() {
        if(self.isCancelled) {
            state = .finished
            return
        }
        
        // set the state to executing
        state = .executing
        
        print("Processing \(self.task?.originalRequest?.url?.absoluteString ?? "")")
            
        // start the downloading
        self.task?.resume()
    }
    
    override public func cancel() {
        super.cancel()
        self.task?.cancel()
    }
    
    public func getStubbResponse<T: Codable>(type: T.Type, completionHandler: @escaping (NetworkCompletionHandler<T>)){
        guard let response = ((StubResponseProvider.get(type: type)[0])["response"]) else {
            completionHandler(.failure(.noDataError))
            return
        }
        guard let data = try? JSONSerialization.data(withJSONObject: response, options: .prettyPrinted) else {
            completionHandler(.failure(.noDataError))
            return
        }
        
        guard let resultData = try? JSONDecoder().decode(T.self, from: data) else {
            completionHandler(.failure(.decodingError))
            return
        }
        
        completionHandler(.success(resultData))
    }
}

