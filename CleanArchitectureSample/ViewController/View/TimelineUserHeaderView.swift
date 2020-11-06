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
    
    public func updateView() {
        self.name.text = "@hoge"
        self.displayName.text = "hogeName"
        self.profileImageView.kf.setImage(with: URL(string: ""))
        self.backgroundImageView.kf.setImage(with: URL(string: ""))
        self.discriptionLabel.text = "Some Discription"
    }
}
