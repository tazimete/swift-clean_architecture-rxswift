//
//  ImageDownloaderClient.swift
//  tawktestios
//
//  Created by JMC on 14/8/21.
//

import Foundation
import UIKit


public class DownloaderClient: AbstractDownloaderClient {
    public static let shared = DownloaderClient()
    public var queueManager: QueueManager

    
    public init(withQueueManager queueManager: QueueManager = QueueManager()) {
        self.queueManager = queueManager
    }
    
    public func enqueue(session: URLSession, downloadTaskURL: URL, completionHandler: @escaping DownloadResultHandler) {
        let operation = NetworkOperation(session: session, downloadTaskURL: downloadTaskURL, completionHandler: completionHandler)
        operation.qualityOfService = .utility
        queueManager.enqueue(operation)
    }
}
