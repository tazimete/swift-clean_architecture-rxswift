//
//  MovieRepository.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import Foundation
import RxSwift

/* This is Movie repository class implementation from AbstractMovieRepository. Which will be used to get mvoie related from api client/server response*/
class MovieRepository: AbstractMovieRepository {
    var apiClient: AbstractApiClient
    
    init(apiClient: AbstractApiClient = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    public func get(movieId: Int) -> Observable<MovieApiRequest.ResponseType> {
        return apiClient.send(apiRequest: MovieApiRequest.getMovie(params: MovieDetailsParams(movieId: movieId)), type: MovieApiRequest.ResponseType.self)
    }
}
