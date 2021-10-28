//
//  GithubUserParams.swift
//  tawktestios
//
//  Created by JMC on 24/7/21.
//

import Foundation


public class FetchGithubUserParam: Parameterizable{
    let since: Int
    let perPage: Int

    public init(since: Int, perPage: Int = 0) {
        self.since = since
        self.perPage = perPage
    }

    private enum CodingKeys: String, CodingKey {
        case since = "since"
        case perPage = "per_page"
    }

    public var asRequestParam: [String: Any] {
        var param: [String: Any?] = [CodingKeys.since.rawValue: since]
        
        if perPage > 0 {
            param[CodingKeys.perPage.rawValue] = perPage
        }
        
        return param.compactMapValues { $0 }
    }
}
