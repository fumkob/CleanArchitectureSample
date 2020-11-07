//
//  LoginAccountViewController.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

protocol LoginAccountViewInput: class {
    func setAccountsModel()
    func changedStatus()
}

class LoginAccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerLabel: UILabel!
    
    public var closeWindow: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tapCancel(_ sender: Any) {
        closeWindow?()
    }
    
    @IBAction func tapReload(_ sender: Any) {
    }
    
}

// MARK: - Login Account View Input
extension LoginAccountViewController: LoginAccountViewInput {
    func setAccountsModel() {
        self.tableView.reloadData()
    }
    func changedStatus() {
        footerLabel.text = "Select use account"
    }
}

// MARK: - TableView DataSource, Delegate
extension LoginAccountViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoginAccountCell", for: indexPath) as? LoginAccountViewCell else {
            fatalError("Error in LoginAccountCell")
        }
        
        cell.updateCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

