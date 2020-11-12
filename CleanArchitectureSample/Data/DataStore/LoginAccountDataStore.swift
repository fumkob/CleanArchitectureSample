//
//  LoginAccountDataStore.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/12.
//

import Foundation
import RxSwift

public protocol LoginAccountDataStore {
    func getSelectedTwitterAccountId() -> Observable<String?>
    func updateSelectedTwitterAccountId(_ account: ACAccountPlus) -> Observable<Void>
    func deleteSelectedTwitterAccountId() -> Observable<Void>
}
