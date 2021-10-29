//
//  MainViewModel.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/29.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainViewPresentable {
    /// Data From ViewController to ViewModel
    typealias Input = (
    )

    /// Data From ViewModel to ViewController
    typealias Output = (
        item: Driver<[MainItemsSection]>, ()
    )

    /// as presentable : passing Input makes ViewModel
    typealias ViewModelBuilder = (MainViewPresentable.Input) -> MainViewPresentable

    var input: MainViewPresentable.Input { get }
    var output: MainViewPresentable.Output { get }
}

class MainViewModel: MainViewPresentable {

    var input: MainViewPresentable.Input
    var output: MainViewPresentable.Output

    private let bag = DisposeBag()

    init(input: MainViewPresentable.Input) {
        self.input = input
        self.output = MainViewModel.output(input: self.input)
    }
}

// - MARK: Extension
private extension MainViewModel {

    static func output(input: MainViewPresentable.Input) -> MainViewPresentable.Output {
        let testLists = Array.init(repeating: MainTableViewModel(title: "This is title"), count: 20)

        let testModels: Driver<[MainTableViewModel]> = Observable.just(testLists).asDriver(onErrorDriveWith: .empty())

        let sections: Driver<[MainItemsSection]> = testModels.map {
            [MainItemsSection(model: 0, items: $0),
                MainItemsSection(model: 1, items: $0),
                MainItemsSection(model: 2, items: $0)]
        }

        return (item: sections, ())
    }
}
