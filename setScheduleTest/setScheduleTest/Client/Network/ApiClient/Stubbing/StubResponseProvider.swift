//
//  StubResponseProvider.swift
//  tawktestios
//
//  Created by JMC on 3/8/21.
//

import Foundation


public class StubResponseProvider{
    public static func getType<T: Codable>(type: T.Type) -> T{
        var type: T!
        
        if T.self is SearchResponse<Movie>.Type {
            type = SearchResponse<Movie>() as! T
        }
        
        return type
    }
    
    public static func get<T: Codable>(type: T.Type) -> T{
        var result = get(type: type)
        
        if T.self is SearchResponse<Movie>.Type {
            
        }
        
        return result
    }
}
