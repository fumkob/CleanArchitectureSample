//
//  TimelinePresenter.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/07.
//

import Foundation
import RxSwift

public enum TimelineStatus {
    case none
    case notAuthorized
    case loading
    case normal
    case error
}

protocol TimelinePresenter {
    func loadCondition()
    func loadTimeline()
    func selectCell()
    func tapPersonButton()
}

public class HomeTimelinePresenterImpl: TimelinePresenter {
    
    weak var viewInput: TimelineViewInput?
    private let wireframe: TimelineWireframe
    
    private let observer: SelectPersonObserver
    private let disposeBag = DisposeBag()
    
    required init(viewInput: TimelineViewInput, wireframe: TimelineWireframe, observer: SelectPersonObserver) {
        self.viewInput = viewInput
        self.wireframe = wireframe
        self.observer = observer
        
        bindObserver()
    }
    
    public func loadCondition() {
        viewInput?.setCondition(isSelectable: true)
    }
    public func loadTimeline() {
        //Timelineをフェッチする
        viewInput?.changedStatus(.loading)
    }
    public func selectCell() {
        wireframe.showUserTimeline(screenName: "")
    }
    public func tapPersonButton() {
        wireframe.showLogin()
    }
}

// MARK: Private
extension HomeTimelinePresenterImpl {
    private func bindObserver() {
        observer.selectPersonObserver
            .subscribe(onNext: { [weak self] in
                DispatchQueue.main.async {
                    self?.loadTimeline()
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - UserTimeline
public class UserTimelinePresenterImpl: TimelinePresenter {
    
    weak var viewInput: TimelineViewInput?
    private let wireframe: TimelineWireframe
    private let screenName: String
    
    private let disposeBag = DisposeBag()
    
    required init(viewInput: TimelineViewInput, wireframe: TimelineWireframe, screenName: String) {
        self.viewInput = viewInput
        self.wireframe = wireframe
        self.screenName = screenName
        }
    
    public func loadCondition() {
        viewInput?.setCondition(isSelectable: false)
    }
    public func loadTimeline() {
        //Timelineをfetchする
        viewInput?.changedStatus(.loading)
    }
    public func selectCell() {
        //無効
    }
    public func tapPersonButton() {
        //無効
    }
}
