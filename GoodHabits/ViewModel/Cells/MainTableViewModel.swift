//
//  MainViewModel.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/29.
//

import Foundation
import RxDataSources

/// sections and data for UITableView
typealias MainItemsSection = SectionModel<Int, MainTableViewModel>

protocol MainTableViewPresentable {
    var title: String { get }
}

/// tableview cell view model
struct MainTableViewModel: MainTableViewPresentable {

    var title: String
}

extension MainTableViewModel {

    init(model: MainModel) {
        self.title = model.title
    }
}

extension MainTableViewModel: Equatable {

    static func == (lhs: MainTableViewModel, rhs: MainTableViewModel) -> Bool {
        return lhs.title == rhs.title
    }
}

extension MainTableViewModel: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
