//
//  Drawable.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/28.
//

import UIKit
/**
[Credit](https://benoitpasquier.com/coordinator-pattern-navigation-back-button-swift)
 */

protocol Drawable {
    var viewController: UIViewController? { get }
}

extension UIViewController: Drawable {

    var viewController: UIViewController? {
        return self
    }
}
