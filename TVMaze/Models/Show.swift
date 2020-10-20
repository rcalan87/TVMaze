//
//  Show.swift
//  TVMaze
//
//  Created by Alan Rodriguez on 10/10/20.
//

import Foundation
import SwiftyJSON

struct Show {
    var id: Int?
    var airtime: String?
    var episodeName: String?
    var showAverage: Double?
    var showGenres: [String]?
    var showImageURL: String?
    var showName: String?
    var showSummary: String?
    
    mutating func jsonMapper(json: JSON) {
        self.id = json["id"].intValue
        self.airtime = json["airtime"].stringValue
        self.episodeName = json["name"].stringValue
        self.showAverage = json["show"]["rating"]["average"].doubleValue
        self.showGenres = json["show"]["genres"].arrayObject as? [String]
        self.showImageURL = json["show"]["image"]["original"].stringValue
        self.showName = json["show"]["name"].stringValue
        self.showSummary = json["show"]["summary"].stringValue
    }
}
