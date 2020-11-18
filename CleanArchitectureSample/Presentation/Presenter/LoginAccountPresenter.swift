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
    func tapAdd(name: String)
}

public class LoginAccountPresenterImpl: LoginAccountPresenter {
    
    weak var viewInput: LoginAccountViewInput?
    private var wireframe: LoginAccountWireframe?
    var accountsModel: RegisteredAccountsModel?
    var useCase: LoginAccountUseCase
    
    private let observer: SelectPersonObserver
    private let disposeBag = DisposeBag()
    
    required init(useCase: LoginAccountUseCase, viewInput: LoginAccountViewInput, wireframe: LoginAccountWireframe, observer: SelectPersonObserver) {
        self.useCase = useCase
        self.viewInput = viewInput
        self.wireframe = wireframe
        self.observer = observer
    }
    
    func loadAccounts() {
        useCase.loadAccounts()
            .subscribe(onNext: {  [weak self] accounts in
                self?.loadedAccountsModel(accounts: accounts)
            }, onError: { [weak self] error in
                self?.errorHandlling(error: error)
            })
            .disposed(by: disposeBag)
    }
    
    func selectAccount(_ index: Int) {
        guard let accountsModel = accountsModel else {
            return
        }
        let selectAccount = accountsModel.accounts[index]
        
        useCase.selectAccount(selectAccount)
            .subscribe(onNext: {[weak self] in
                self?.selectedAccounts()
            }, onError: {[weak self] error in
                self?.errorHandlling(error: error)
            })
            .disposed(by: disposeBag)
    }
    
    func tapCancel() {
        wireframe?.closeWindow()
    }
    
    func tapReaload() {
        loadAccounts()
    }
    
    func tapAdd(name: String) {
        useCase.addAccount(name: name)
            .subscribe(onNext: { [weak self] in
                self?.loadAccounts()
            }, onError: { [weak self] error in
                self?.errorHandlling(error: error)
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Private
extension LoginAccountPresenterImpl {
    private func loadedAccountsModel(accounts: RegisteredAccountsModel) {
        DispatchQueue.main.async { [weak self] in
            self?.accountsModel = accounts
            self?.viewInput?.setAccountsModel(accounts)
            let isNodata = accounts.accounts.count == 0
            self?.viewInput?.changedStatus(isNodata ? .none : .normal)
        }
    }
    
    private func selectedAccounts() {
        DispatchQueue.main.async { [weak self] in
            self?.wireframe?.closeWindow()
        }
    }
    
    private func errorHandlling(error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let error = error as? APIError else {
                self?.viewInput?.changedStatus(.error)
                return
            }
            switch error {
            case .notAuthorized:
                self?.viewInput?.changedStatus(.notAuthorized)
            default:
                self?.viewInput?.changedStatus(.error)
            }
        }
    }
}
