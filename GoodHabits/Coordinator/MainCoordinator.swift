//
//  MainCoordinator.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/28.
//

import UIKit
import RxSwift

class MainCoordinator: BaseCoordinator {
    private let router: Routing

    private let bag = DisposeBag()

    init(router: Routing) {
        self.router = router
    }

    override func start() {
        let view = MainViewController.instantiate()

        view.viewModelBuilder = {
            let viewModel = MainViewModel(input: $0)
            return viewModel
        }
        
        router.push(view, isAnimated: true, onNavigationBack: isCompleted)
    }
}

// MARK: - Extension
private extension MainCoordinator {

}
