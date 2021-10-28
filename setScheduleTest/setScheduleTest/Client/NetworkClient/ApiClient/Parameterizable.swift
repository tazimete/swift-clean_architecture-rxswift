//
//  Parameterizable.swift
//  tawktestios
//
//  Created by JMC on 24/7/21.
//

import Foundation


public protocol Parameterizable {
    var asRequestParam: [String: Any] { get }
}

