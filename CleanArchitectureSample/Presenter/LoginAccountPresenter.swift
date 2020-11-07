//
//  LoginAccountPresenter.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift

public enum LoginAccountStatus {
    case none
    case normal
    case notAuthorized
    case error
}

protocol LoginAccountPresenter: class {
    func loadAccounts()
    func selectAccount(_ index: Int)
    func tapCancel()
    func tapReaload()
}

public class LoginAccountPresenterImpl: LoginAccountPresenter {
    
    weak var viewInput: LoginAccountViewInput?
    private var wireframe: LoginAccountWireframe?
    
    private let observer: SelectPersonObserver
    private let disposeBag = DisposeBag()
    
    required init(viewInput: LoginAccountViewInput, wireframe: LoginAccountWireframe, observer: SelectPersonObserver) {
        self.viewInput = viewInput
        self.wireframe = wireframe
        self.observer = observer
    }
    
    func loadAccounts() {
        
    }
    
    func selectAccount(_ index: Int) {
        
    }
    
    func tapCancel() {
        wireframe?.closeWindow()
    }
    
    func tapReaload() {
        loadAccounts()
    }
    
}
