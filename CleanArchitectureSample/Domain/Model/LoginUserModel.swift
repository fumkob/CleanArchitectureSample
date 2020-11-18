//
//  LoginUserModel.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/11.
//

import Foundation

struct RegisteredAccountsModel {
    var accounts: [RegisteredAccountModel] = []
}

struct RegisteredAccountModel {
    let name: String
    let identifier: String
    let id: Int
    
    var isSelected: Bool = false
    
    init(account: ACAccountPlus, index: Int) {
        name = account.username
        identifier = account.identifier as String? ?? ""
        id = index
    }
}
