//
//  GameModel.swift
//  submission
//
//  Created by Ade Resie on 16/12/22.
//

import Foundation

struct GameModel {
    var id: Float
    var name: String
    var release: String
    var backgroundImage: String
    var rating: Float
}

struct GameDetailModel {
    var id: Float
    var name: String
    var release: String
    var backgroundImage: String
    var rating: Float
    var desc: String
    var metacritic: Int
}
