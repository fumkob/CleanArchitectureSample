//
//  TimelineViewController.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

protocol TimelineViewInput: class {
    func setCondition(isSelectable: Bool)
    func setTimelinesModel(_: TimelinesModel)
    func setUserModel(_: UserViewModel)
    func changedStatus(_: TimelineStatus)
}

class TimelineViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: TimelinePresenter?
    private var timelines: [TimelineViewModel] = []
    private var timelineStatus: TimelineStatus = .loading
    
    private let headerUserViewNib = Nib<TimelineUserHeaderView>()
    private var headerUserView: TimelineUserHeaderView!
    
    public func inject(presenter: TimelinePresenter) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter?.loadCondition()
        presenter?.loadTimeline()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    @IBAction func tapPersonButton(_ sender: Any) {
        presenter?.tapPersonButton()
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
        tableView.allowsSelection = isSelectable
        
        if !isSelectable {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func setUserModel(_ userModel: UserViewModel) {
        headerUserView.updateView(userModel)
        headerUserView.backgroundColor = UIColor(hex: userModel.profileBackgroundColor)
        tableView.tableHeaderView = headerUserView
    }
    
    func setTimelinesModel(_ timelinesModel: TimelinesModel) {
        timelines = timelinesModel.timelines
        self.tableView.reloadData()
    }
    
    func changedStatus(_ status: TimelineStatus) {
        self.timelineStatus = status
        self.tableView.reloadData()
    }
}

// MARK: - TableView DataSource
extension TimelineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch timelineStatus {
        case .normal: return timelines.count
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch timelineStatus {
        case .normal:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineViewCell", for: indexPath) as? TimelineViewCell else {
                fatalError("Error with cell type")
            }
            let timeline = timelines[indexPath.row]
            cell.updateCell(timelineModel: timeline)
            return cell
        case .notAuthorized:
            return tableView.dequeueReusableCell(withIdentifier: "NotAuthorized", for: indexPath)
        case .loading:
            return tableView.dequeueReusableCell(withIdentifier: "Loading", for: indexPath)
        case .error:
            return tableView.dequeueReusableCell(withIdentifier: "Error", for: indexPath)
        case .none:
            return tableView.dequeueReusableCell(withIdentifier: "Nodata", for: indexPath)
        }
    }
}

// MARK: - TableView Delegate
extension TimelineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch timelineStatus {
        case .normal:
            let timeline = timelines[indexPath.row]
            presenter?.selectCell(timeline: timeline)
        default:
            return
        }
    }
}
