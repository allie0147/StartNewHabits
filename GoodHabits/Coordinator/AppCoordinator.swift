//
//  AppCoordinator.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/28.
//

import UIKit

/// parent coordinator, starts window launching app
class AppCoordinator: BaseCoordinator {

    private let window: UIWindow

    private let navigationController: UINavigationController = {
        let nav = UINavigationController()
        let navBar = nav.navigationBar
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .accent
        
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = nav.navigationBar.standardAppearance
        navBar.prefersLargeTitles = true

        return nav
    }()

    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        // make router constant
        let router = Router(navigationController: self.navigationController)
        // dependency inject to a first ViewController
        let mainCoordinator = MainCoordinator(router: router)
        self.add(coordinator: mainCoordinator)
        // remove coordinator after popViewcontroller
        // this won't be happen but just in case to be safe...
        mainCoordinator.isCompleted = { [weak self, weak mainCoordinator] in
            guard let coordinator = mainCoordinator else {
                return
            }
            self?.remove(coordinator: coordinator)
        }

        // instantiate view
        mainCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
