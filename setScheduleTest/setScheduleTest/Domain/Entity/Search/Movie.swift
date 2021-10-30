//
//  Movie.swift
//  setScheduleTest
//
//  Created by JMC on 31/10/21.
//

import Foundation

public struct Movie: Codable {
    public let id: Int?
    public let originalTitle: String?
    public let overview: String?
    public let popularity: Float?
    public let posterPath: String?
    public let releaseDate: String?
    public let title: String?
    public let voteAverage: Float?
    public let voteCount: Int?
    
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


