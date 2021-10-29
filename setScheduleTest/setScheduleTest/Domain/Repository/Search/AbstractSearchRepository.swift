//
//  AbstractSearchRepository.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

public protocol AbstractSearchRepository: AbstractRepository {
     func get() -> Observable<GithubApiRequest.ResponseType>
}
