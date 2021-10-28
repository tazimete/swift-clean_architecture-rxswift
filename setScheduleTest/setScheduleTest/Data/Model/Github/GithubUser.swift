//
//  GithubUser.swift
//  tawktestios
//
//  Created by JMC on 24/7/21.
//

import Foundation


public class GithubUser: AbstractDataModel, Codable {
    public var id: Int?
    public var username: String?
    public var avatarUrl: String?
    public var url: String?
    public var note: String?
    public var company: String?
    public var blog: String?
    public var followers: Int?
    public var followings: Int?
    public var isSeen: Bool?
    
    public init() {
        
    }
    
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "login"
        case avatarUrl = "avatar_url"
        case url = "url"
        case note = "note"
        case company = "company"
        case blog = "blog"
        case followers = "followers"
        case followings = "followings"
        case isSeen = "isSeen"
    }
    
    public var asDictionary: [String : Any]? {
        var dictionary = [String: Any]()
        dictionary["id"] = id
        dictionary["username"] = username
        dictionary["avatarUrl"] = avatarUrl
        dictionary["url"] = url
        dictionary["note"] = note
        dictionary["company"] = company
        dictionary["blog"] = blog
        dictionary["followers"] = followers
        dictionary["followings"] = followings
        dictionary["isSeen"] = isSeen
        
        return dictionary
    }
}


