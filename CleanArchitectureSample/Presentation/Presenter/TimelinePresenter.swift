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
    func selectCell(timeline: TimelineViewModel)
    func tapPersonButton()
}

public class HomeTimelinePresenterImpl: TimelinePresenter {
    
    weak var viewInput: TimelineViewInput?
    private let wireframe: TimelineWireframe
    private let useCase: TimelineUseCase
    
    private let observer: SelectPersonObserver
    private let disposeBag = DisposeBag()
    
    required init(useCase: TimelineUseCase, viewInput: TimelineViewInput, wireframe: TimelineWireframe, observer: SelectPersonObserver) {
        self.useCase = useCase
        self.viewInput = viewInput
        self.wireframe = wireframe
        self.observer = observer
        
        bindObserver()
    }
    
    public func loadCondition() {
        viewInput?.setCondition(isSelectable: true)
    }
    public func loadTimeline() {
        useCase.loadTimelines()
            .subscribe(onNext: { [weak self] timelines in
                self?.loadedTimelinesModel(timelines: timelines)
            }, onError: { [weak self] error in
                self?.errorHandling(error: error)
            })
            .disposed(by: disposeBag)
        
        viewInput?.changedStatus(.loading)
    }
    func selectCell(timeline: TimelineViewModel) {
        wireframe.showUserTimeline(screenName: timeline.screenName)
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
    private func loadedTimelinesModel(timelines: TimelinesModel) {
        DispatchQueue.main.async { [weak self] in
            self?.viewInput?.setTimelinesModel(timelines)
            let isNodata = timelines.timelines.count == 0
            self?.viewInput?.changedStatus(isNodata ? .none : .normal)
        }
    }
    
    private func errorHandling(error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let error = error as? APIError else {
                self?.viewInput?.changedStatus(.error)
                return
            }
            switch error {
            case .notAuthorized:
                self?.viewInput?.changedStatus(.notAuthorized)
                self?.wireframe.showLogin()
            default:
                self?.viewInput?.changedStatus(.error)
            }
        }
        
    }
}

// MARK: - UserTimeline
public class UserTimelinePresenterImpl: TimelinePresenter {
    
    weak var viewInput: TimelineViewInput?
    private let wireframe: TimelineWireframe
    private let useCase: TimelineUseCase
    private let screenName: String
    
    private let disposeBag = DisposeBag()
    
    required init(useCase: TimelineUseCase, viewInput: TimelineViewInput, wireframe: TimelineWireframe, screenName: String) {
        self.useCase = useCase
        self.viewInput = viewInput
        self.wireframe = wireframe
        self.screenName = screenName
        }
    
    public func loadCondition() {
        viewInput?.setCondition(isSelectable: false)
    }
    public func loadTimeline() {
        useCase.loadTimelines(screenName: screenName)
            .subscribe(onNext: { [weak self] timelines in
                self?.loadedTimelinesModel(timelines: timelines)
            }, onError: { [weak self] error in
                self?.errorHandling(error: error)
            })
            .disposed(by: disposeBag)
        viewInput?.changedStatus(.loading)
    }
    func selectCell(timeline: TimelineViewModel) {
        //無効
    }
    public func tapPersonButton() {
        //無効
    }
}

// MARK: - Private
extension UserTimelinePresenterImpl {
    private func loadedTimelinesModel(timelines: TimelinesModel) {
        DispatchQueue.main.async { [weak self] in
            if let firstTimeline = timelines.timelines.first {
                self?.viewInput?.setUserModel(firstTimeline)
            }
            self?.viewInput?.setTimelinesModel(timelines)
            let isNoData = timelines.timelines.count == 0
            self?.viewInput?.changedStatus(isNoData ? .none : .normal)
        }
    }
    private func errorHandling(error: Error) {
        DispatchQueue.main .async { [weak self] in
            guard let error = error as? APIError else {
                self?.viewInput?.changedStatus(.error)
                return
            }
            switch error {
            case .notAuthorized:
                self?.viewInput?.changedStatus(.notAuthorized)
                self?.wireframe.showLogin()
            default:
                self?.viewInput?.changedStatus(.error)
            }
        }
    }
}
