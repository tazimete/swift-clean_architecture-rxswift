//
//  AbstractUsecase.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation


protocol AbstractUsecase: AnyObject {
    var repository: AbstractRepository {get}
}
