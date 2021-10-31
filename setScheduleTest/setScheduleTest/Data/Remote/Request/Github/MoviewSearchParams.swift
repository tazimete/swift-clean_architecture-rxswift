//
//  GithubUserParams.swift
//  tawktestios
//
//  Created by JMC on 24/7/21.
//

import Foundation


struct MoviewSearchParams: Parameterizable{
    let apiKey: String = "feb6f0eeaa0a72662967d77079850353"
    let query: String
    let year: Int

    public init(query: String, year: Int) {
        self.query = query
        self.year = year
    }

    private enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case query = "query"
        case year = "year"
    }

    public var asRequestParam: [String: Any] {
        let param: [String: Any] = [CodingKeys.apiKey.rawValue: apiKey, CodingKeys.query.rawValue: query, CodingKeys.year.rawValue: year]
        return param.compactMapValues { $0 }
    }
}
