//
//  AbstractMovieViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 2/11/21.
//

import Foundation
import RxSwift

protocol AbstractMovieViewModel: AbstractViewModel {
    var inputModel: MovieViewModel.MovieInputModel? {get set}
    func getMovieOutput(input: MovieViewModel.MovieInput) -> MovieViewModel.MovieOutput
    func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType>
}

