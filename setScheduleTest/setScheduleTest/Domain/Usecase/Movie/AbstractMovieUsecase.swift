//
//  AbstractMovieUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import Foundation
import RxSwift

protocol AbstractMovieUsecase: AbstractUsecase {
    func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType>
}
