//
//  MovieViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import Foundation
import RxSwift
import RxCocoa

class MovieViewModel: AbstractMovieViewModel {
    public struct MovieInputModel {
        let movieId: Int
    }
    
    public struct MovieInput {
        let movieDetailsTrigger: Observable<Void>
    }
    
    public struct MovieOutput {
        let movieDetails: BehaviorRelay<MovieApiRequest.ResponseType?>
        let errorTracker: BehaviorRelay<NetworkError?>
    }
    
    public var inputModel: MovieInputModel?
    public var usecase: AbstractUsecase
    
    public init() {
        usecase = MovieUsecase()
    }
    
    public func getMovieOutput(input: MovieInput) -> MovieOutput {
        let movieResponse = BehaviorRelay<MovieApiRequest.ResponseType?>(value: nil)
        let errorResponse = BehaviorRelay<NetworkError?>(value: nil)
        
        input.movieDetailsTrigger.flatMapLatest({ [weak self] () -> Observable<MovieApiRequest.ResponseType> in
            guard let weakSelf = self else {
                return Observable.just(MovieApiRequest.ResponseType())
            }
            
            //fetch movie details
            return weakSelf.getMovieDetails(movieId: weakSelf.inputModel?.movieId ?? 100)
        }).subscribe(onNext: {
            response in
            
            movieResponse.accept(response)
        }, onError: { [weak self] error in
            errorResponse.accept(error as? NetworkError)
        }, onCompleted: nil, onDisposed: nil)
        
        return MovieOutput.init(movieDetails: movieResponse, errorTracker: errorResponse)
    }
    
    public func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType> {
        return (usecase as! AbstractMovieUsecase).getMovieDetails(movieId: movieId)
    }
}
