//
//  TimelineTranslator.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/12.
//

import Foundation

struct TimelineTranslator: Translator {
    typealias Input = [TimelineEntity]
    typealias Output = TimelinesModel
    
    func translate(_ entity: [TimelineEntity]) throws -> TimelinesModel {
        var timelinesModel = TimelinesModel()
        entity.forEach { rowTimeline in
            let timelineModel = TimelineModel(rowTimelineModel: rowTimeline)
            timelinesModel.timelines.append(timelineModel)
        }
        return timelinesModel
    }
    
}
