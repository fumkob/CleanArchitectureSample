//
//  RegisteredAccountTranslator.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/12.
//

import Foundation

struct RegisteredAccountTranslator: Translator {
    typealias Input = (accounts: [ACAccountPlus], selectedIdentifier: String?)
    typealias Output = RegisteredAccountsModel
    
    func translate(_ entity: (accounts: [ACAccountPlus], selectedIdentifier: String?)) throws -> RegisteredAccountsModel {
        var registeredAccountsModel = RegisteredAccountsModel()
        entity.accounts.enumerated().forEach { (index: Int, account: ACAccountPlus) in
            var registeredAccountModel = RegisteredAccountModel(account: account, index: index)
            registeredAccountModel.isSelected = registeredAccountModel.identifier == entity.selectedIdentifier
            registeredAccountsModel.accounts.append(registeredAccountModel)
        }
        
        return registeredAccountsModel
    }
}
