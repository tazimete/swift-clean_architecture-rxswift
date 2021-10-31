//
//  Network.swift
//  tawktestios
//
//  Created by JMC on 23/7/21.
//

import Foundation

enum SearchApiRequest {
    case searchMovie(params: Parameterizable)
    case fetchUserProfile(params: Parameterizable)
}

extension SearchApiRequest: APIRequest {
    public var baseURL: URL {
        let url =  "https://api.themoviedb.org/3/"
        return URL(string: url)!
    }
    
    public typealias ItemType = Movie
    public typealias ResponseType = Response<ItemType>
    
    public var method: RequestType {
        switch self {
            case .searchMovie: return .GET
            case .fetchUserProfile: return .GET
        }
    }
    
    public var path: String {
        switch self {
            case .searchMovie: return "search/movie"
            case .fetchUserProfile: return "users/\(parameters["username"] as! String)"
        }
    }
    
    public var parameters: [String: Any]{
        var parameter: [String: Any] = [:]
        
        switch self {
            case .searchMovie (let params):
                parameter = params.asRequestParam
                
            case .fetchUserProfile (let params):
                parameter = params.asRequestParam
        }
        
        return parameter
    }
    
    public var headers: [String: Any] {
        return [String: Any]()
    }
}


