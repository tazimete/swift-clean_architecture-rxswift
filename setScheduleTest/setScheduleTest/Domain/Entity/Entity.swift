//
//  Entity.swift
//  setScheduleTest
//
//  Created by JMC on 31/10/21.
//

import Foundation

public struct Entity<T: Codable>: Codable {
    public let page: Int?
    public let results: [T]?
    public let totalPages: Int?
    public let totalResults: Int?
    
    public enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
