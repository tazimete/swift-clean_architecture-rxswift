//
//  AbstractViewModel.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation


public protocol AbstractViewModel: AnyObject {
    var usecase: AbstractUsecase {get}
}
