//
//  Routing.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/28.
//

import Foundation

typealias NavigationBackClosure = (() -> Void)

protocol Routing {
    /// Push a viewController which implements Drawable
    func push(_ drawable: Drawable, isAnimated: Bool, onNavigationBack: NavigationBackClosure?)

    /// Pop a viewController
    func pop(_ isAnimated: Bool)

    /// Pop to the rootViewController
    func popToRoot(_ isAnimated: Bool)

    /// Present a viewController which implements Drawable
    func present(_ drawable: Drawable, isAnimated: Bool, onDismiss: NavigationBackClosure?)
}
