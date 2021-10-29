//
//  MainModel.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/29.
//

import Foundation

struct MainModel {

    let title: String
}

extension MainModel: Equatable {

    static func == (lhs: MainModel, rhs: MainModel) -> Bool {
        return lhs.title == rhs.title
    }
}

extension MainModel: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
