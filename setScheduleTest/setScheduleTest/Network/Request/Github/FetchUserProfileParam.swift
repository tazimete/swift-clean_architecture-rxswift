//
//  FetchUserProfileParam.swift
//  tawktestios
//
//  Created by JMC on 4/8/21.
//

import Foundation


public class FetchUserProfileParam: Parameterizable{
    let username: String

    public init(username: String) {
        self.username = username
    }

    private enum CodingKeys: String, CodingKey {
        case username = "username"
    }

    public var asRequestParam: [String: Any] {
        let param: [String: Any?] = [CodingKeys.username.rawValue: username]
        return param.compactMapValues { $0 }
    }
}
