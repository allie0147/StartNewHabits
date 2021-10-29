//
//  ViewController.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class MainViewController: UIViewController, Storyboardable {

    private var tableView: UITableView = {
        let tableview = UITableView(frame: UIScreen.main.bounds)
        tableview.rowHeight = 120
        tableview.estimatedRowHeight = 120
        tableview.separatorStyle = .none
        tableview.separatorColor = .clear
        return tableview
    }()

    private lazy var dataSource = RxTableViewSectionedReloadDataSource<MainItemsSection>(
        configureCell: { _, tableView, index, item in
            let mainCell = tableView.dequeueReusableCell(
                withIdentifier: MainTableViewCell.identifier,
                for: index
            )as! MainTableViewCell
            mainCell.configure(usingViewModel: item)
            return mainCell
        },
        titleForHeaderInSection: { datasource, index in
            return String(datasource.sectionModels[index].model)
        }
    )

    private let disposeBag = DisposeBag()
    private var viewModel: MainViewPresentable!
    var viewModelBuilder: MainViewPresentable.ViewModelBuilder!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = viewModelBuilder((
        ))

        initUI()
        initBinding()
    }
}
extension MainViewController {

    func initUI() {
        self.title = "Main"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.register(UINib(nibName: MainTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: MainTableViewCell.identifier)
    }

    func initBinding() {
        self.viewModel.output.item
            .debug()
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
