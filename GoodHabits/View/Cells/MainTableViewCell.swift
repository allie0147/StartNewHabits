//
//  MainTableViewCell.swift
//  GoodHabits
//
//  Created by Allie Kim on 2021/10/29.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let identifier = "MainTableViewCell"
    
    @IBOutlet var testLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(usingViewModel viewModel: MainTableViewPresentable) {
        testLabel.text = viewModel.title
        self.selectionStyle = .none
    }

}
