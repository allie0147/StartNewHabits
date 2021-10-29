//
//  UIColor+Assets.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/28.
//

import UIKit

// swiftlint:disable identifier_name
extension UIColor {

    private enum ColorName: String {

        case AccentColor, SecondaryColor, TertiaryColor, QuaternaryColor, AnyColor, TextColor
    }

    class var accent: UIColor {
        return UIColor(named: ColorName.AccentColor.rawValue)!
    }

    class var secondary: UIColor {
        return UIColor(named: ColorName.SecondaryColor.rawValue)!
    }

    class var tertiary: UIColor {
        return UIColor(named: ColorName.TertiaryColor.rawValue)!
    }

    class var quatenary: UIColor {
        return UIColor(named: ColorName.QuaternaryColor.rawValue)!
    }

    class var any: UIColor {
        return UIColor(named: ColorName.AnyColor.rawValue)!
    }

    class var text: UIColor {
        return UIColor(named: ColorName.TextColor.rawValue)!
    }

    /// 퍼센트만큼 밝게
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage))
    }
    /// 퍼센트만큼 어둡게
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage))
    }

    private func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage / 100, 1.0),
                           green: min(green + percentage / 100, 1.0),
                           blue: min(blue + percentage / 100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}
