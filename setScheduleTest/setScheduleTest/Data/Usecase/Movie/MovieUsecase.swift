//
//  MovieUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import Foundation
import RxSwift

/* This is Movie usecase class implementation from AbstractMovieUsecase. Which will be used to get movie related data from movie repository*/
class MovieUsecase: AbstractMovieUsecase {
    var repository: AbstractRepository
    
    public init(repository: AbstractMovieRepository) {
        self.repository = repository
    }
    
    public func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType> {
        return (repository as! AbstractMovieRepository).get(movieId: movieId)
    }
}
