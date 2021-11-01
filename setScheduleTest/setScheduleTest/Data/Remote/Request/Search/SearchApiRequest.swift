//
//  Network.swift
//  tawktestios
//
//  Created by JMC on 23/7/21.
//

import Foundation

enum SearchApiRequest {
    case searchMovie(params: Parameterizable)
}

extension SearchApiRequest: APIRequest {
    public var baseURL: URL {
        let url =  "\(AppConfig.shared.getServerConfig().getBaseUrl())/\(AppConfig.shared.getServerConfig().getApiVersion())/"
        return URL(string: url)!
    }
    
    public typealias ItemType = Movie
    public typealias ResponseType = SearchResponse<ItemType>
    
    public var method: RequestType {
        switch self {
            case .searchMovie: return .GET
        }
    }
    
    public var path: String {
        switch self {
            case .searchMovie: return "search/movie"
        }
    }
    
    public var parameters: [String: Any]{
        var parameter: [String: Any] = [:]
        
        switch self {
            case .searchMovie (let params):
                parameter = params.asRequestParam
        }
        
        return parameter
    }
    
    public var headers: [String: Any] {
        return [String: Any]()
    }
}


