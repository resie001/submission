//
//  Game.swift
//  submission
//
//  Created by Ade Resie on 11/09/22.
//

import Foundation
import ObjectMapper

class GamesResponse: BaseResponse {
    var games: [GameResponse]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        games <- map["results"]
    }
}

class GameResponse: Mappable {
    
    var id: Float?
    var name: String?
    var release: String?
    var backgroundImage: String?
    var metacritic: Int?
    var desc: String?
    var rating: Float?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        release <- map["released"]
        backgroundImage <- map["background_image"]
        metacritic <- map["metacritic"]
        desc <- map["description_raw"]
        rating <- map["rating"]
    }
}
