//
//  LoginAccountViewCell.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/06.
//

import UIKit

class LoginAccountViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    public func updateCell(_ accountModel: RegisteredAccountModel) {
        self.name.text = "@" + accountModel.name
        self.isSelected(accountModel.isSelected)
    }
    
    private func isSelected(_ isSelected: Bool) {
        if isSelected {
            self.backgroundColor = UIColor(red: 198/255.0, green: 227/255.0, blue: 219/255.0, alpha: 1)
        } else {
            self.backgroundColor = .white
        }
    }

}
