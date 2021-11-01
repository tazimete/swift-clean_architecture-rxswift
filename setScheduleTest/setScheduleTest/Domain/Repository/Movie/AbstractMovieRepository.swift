//
//  AbstractMovieRepository.swift
//  setScheduleTest
//
//  Created by JMC on 1/11/21.
//

import Foundation
import RxSwift

protocol AbstractMovieRepository: AbstractRepository {
     func get(query: String, year: Int) -> Observable<MovieApiRequest.ResponseType>
}
