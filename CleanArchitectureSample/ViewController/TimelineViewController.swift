//
//  TimelineViewController.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

public protocol TimelineViewInput: class {
    func setCondition(isSelectable: Bool)
    func setTimelinesModel()
    func setUserModel()
    func changedStatus()
}

class TimelineViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let headerUserViewNib = Nib<TimelineUserHeaderView>()
    private var headerUserView: TimelineUserHeaderView!
    public var showLogin: (() -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    @IBAction func tapPersonButton(_ sender: Any) {
        showLogin()
    }
}

// MARK: - setupUI
extension TimelineViewController {
    private func setupUI() {
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableView.automaticDimension
        
        headerUserView = headerUserViewNib.view()
    }
}

// MARK: - TimelineViewInput
extension TimelineViewController: TimelineViewInput {
    func setCondition(isSelectable: Bool) {
        return
    }
    
    func setUserModel() {
        headerUserView.updateView()
        tableView.tableHeaderView = headerUserView
    }
    
    func setTimelinesModel() {
        self.tableView.reloadData()
    }
    
    func changedStatus() {
        self.tableView.reloadData()
    }
}

// MARK: - TableView DataSource
extension TimelineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Nodata", for: indexPath)
    }
}

// MARK: - TableView Delegate
extension TimelineViewController: UITableViewDelegate {
}
