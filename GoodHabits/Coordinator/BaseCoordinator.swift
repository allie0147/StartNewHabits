//
//  BaseCoordinator.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/28.
//

import Foundation

class BaseCoordinator: Coordinator {

    var childCoordinator: [Coordinator] = []

    /// After popViewController `NavigationBackClosure` will be handled using this variable
    /// presentedViewController deallocated
    var isCompleted: (() -> Void)?

    /**
        1. Instantiate and show ViewController
        2. Build ViewModel
     */
    func start() {
        fatalError("Child coordinator should implement 'start' function.")
    }
}
