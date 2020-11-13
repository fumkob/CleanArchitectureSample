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
        createdAt <- map["createdAt"]
        user <- map["user"]
    }
}

public struct UserEntity: Mappable {
    var screenName = ""
    var userDescription = ""
    var profileUrl = ""
    var profileBackgroundUrl = ""
    var name = ""
    
    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        screenName <- map["screenName"]
        userDescription <- map["description"]
        profileUrl <- map["profile_image_url_https"]
        profileBackgroundUrl <- map["profile_background_image_url_https"]
        name <- map["name"]
    }
}
