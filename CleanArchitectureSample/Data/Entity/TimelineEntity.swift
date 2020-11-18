//
//  TimelineEntity.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/12.
//

import Foundation
import ObjectMapper

public struct TimelineEntity: Mappable {
    var text = ""
    var createdAt = ""
    var user: UserEntity?
    
    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        text <- map["text"]
        createdAt <- map["created_at"]
        user <- map["user"]
    }
}

public struct UserEntity: Mappable {
    var screenName = ""
    var userDescription = ""
    var profileUrl = ""
    var profileBackgroundUrl = ""
    var name = ""
    var profileBackgroundColor = ""
    
    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        screenName <- map["screen_name"]
        userDescription <- map["description"]
        profileUrl <- map["profile_image_url_https"]
        profileBackgroundUrl <- map["profile_banner_url"]
        name <- map["name"]
        profileBackgroundColor <- map["profile_background_color"]
    }
}
