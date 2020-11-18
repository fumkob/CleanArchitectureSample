//
//  LoginAccountViewController.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

protocol LoginAccountViewInput: class {
    func setAccountsModel(_: RegisteredAccountsModel)
    func changedStatus(_: LoginAccountStatus)
}

class LoginAccountViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerLabel: UILabel!
    
    private var presenter: LoginAccountPresenter?
    private var twitterAccountsModel: RegisteredAccountsModel?
    private var accountStatus: LoginAccountStatus = .none
    
    public func inject(presenter: LoginAccountPresenter) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadAccounts()
    }
    
    // MARK: Button Action
    @IBAction func tapCancel(_ sender: Any) {
        presenter?.tapCancel()
    }
    
    @IBAction func tapReload(_ sender: Any) {
        presenter?.tapReaload()
    }
    
    @IBAction func tapAdd(_ sender: Any) {
        var alertTextField: UITextField?
        
        let alert = UIAlertController(title: "Add Twitter Account", message: "Enter Twitter account name", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
                alertTextField = textField
            })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            if let name: String = alertTextField?.text {
                self?.presenter?.tapAdd(name: name)
                }
            }
        )
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Login Account View Input
extension LoginAccountViewController: LoginAccountViewInput {
    func setAccountsModel(_ accountsModel: RegisteredAccountsModel) {
        twitterAccountsModel = accountsModel
        self.tableView.reloadData()
    }
    
    func changedStatus(_ status: LoginAccountStatus) {
        switch status {
        case .normal: footerLabel.text = "Select use account"
        case .error: footerLabel.text = "An error occured"
        case .notAuthorized: footerLabel.text = "Not authorized"
        case .none: footerLabel.text = "No twitter user"
        }
        
    }
}

// MARK: - TableView DataSource, Delegate
extension LoginAccountViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (twitterAccountsModel?.accounts.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoginAccountCell", for: indexPath) as? LoginAccountViewCell else {
            fatalError("Error in LoginAccountCell")
        }
        
        guard let twitterAccountModel = twitterAccountsModel?.accounts[indexPath.row] else { fatalError("twitterAccountModel Error") }
        cell.updateCell(twitterAccountModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectAccount(indexPath.row)
    }
}
