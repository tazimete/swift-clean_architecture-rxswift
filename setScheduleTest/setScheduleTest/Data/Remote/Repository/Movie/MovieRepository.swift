//
//  MovieRepository.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import Foundation
import RxSwift

class MovieRepository: AbstractMovieRepository {
    var apiClient: AbstractApiClient
    
    init() {
        apiClient = APIClient.shared
    }
    
    public func get(movieId: Int) -> Observable<MovieApiRequest.ResponseType> {
        return apiClient.send(apiRequest: MovieApiRequest.getMovie(params: MovieDetailsParams(movieId: movieId)), type: MovieApiRequest.ResponseType.self)
    }
}
