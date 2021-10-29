//
//  AbstractSearchUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation
import RxSwift

public protocol AbstractSearchUsecase: AbstractUsecase {
    func search() -> Observable<GithubApiRequest.ResponseType>
}
