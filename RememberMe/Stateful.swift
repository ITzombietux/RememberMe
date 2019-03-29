//
//  Stateful.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

protocol Stateful: class {
    var stateController: StateController? { get set }
}

extension Stateful {
    func passState(to destination: Stateful) {
        destination.stateController = stateController
    }
}
