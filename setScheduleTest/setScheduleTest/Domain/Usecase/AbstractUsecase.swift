//
//  AbstractUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation


public protocol AbstractUsecase: AnyObject {
    var repository: AbstractRepository {get}
}
