//
//  AbstractRepository.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation

protocol AbstractRepository: AnyObject {
    var apiClient: AbstractApiClient {get}
}
