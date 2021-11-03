//
//  MovieUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import Foundation
import RxSwift

class MovieUsecase: AbstractMovieUsecase {
    var repository: AbstractRepository
    
    public init(repository: AbstractMovieRepository) {
        self.repository = repository
    }
    
    public func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType> {
        return (repository as! AbstractMovieRepository).get(movieId: movieId)
    }
}
