//
//  URLSessionProtocol.swift
//  setScheduleTest
//
//  Created by JMC on 3/11/21.
//

import Foundation

typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTaskWithURL(_ url: URL, completion: @escaping DataTaskResult) -> URLSessionDataTask
}
