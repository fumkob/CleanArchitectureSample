//
//  TimelineViewCell.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/06.
//

import UIKit

class TimelineViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var displayName: UILabel!
    
    @IBOutlet weak var tweet: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    public func updateCell() {
        self.name.text = "@Name"
        self.displayName.text = "Name"
        self.tweet.text = "Some Tweets."
        self.profileImageView.kf.setImage(with: URL(string: ""))
    }
    
//    public func isSelected(_ isSelected: Bool) {
//        if isSelected {
//            self.backgroundColor = .red
////            self.backgroundColor = UIColor(red: 198/255.0, green: 227/255.0, blue: 219/255.0, alpha: 1)
//        } else {
//            self.backgroundColor = .white
//        }
//    }
}
