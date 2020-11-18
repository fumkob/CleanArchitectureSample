//
//  TimelineUserHeaderView.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit
import Kingfisher

class TimelineUserHeaderView: UIView {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var displayName: UILabel!
    
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    public func updateView(_ timelineModel: UserViewModel) {
        self.name.text = timelineModel.screenName
        self.displayName.text = timelineModel.name
        self.profileImageView.kf.setImage(with: URL(string: timelineModel.profileUrl))
        self.backgroundImageView.kf.setImage(with: URL(string: timelineModel.profileBackgroundUrl))
        self.discriptionLabel.text = timelineModel.userDescription
    }
}
