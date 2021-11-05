//
//  AbstractMovieUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import Foundation
import RxSwift

/* This is Movie usecase abstraction extented from AbstractUsecase. Which will be used to get movie related data from movie repository*/
protocol AbstractMovieUsecase: AbstractUsecase {
    func getMovieDetails(movieId: Int) -> Observable<MovieApiRequest.ResponseType>
}
