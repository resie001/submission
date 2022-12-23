//
//  BaseResponse.swift
//  submission
//
//  Created by Ade Resie on 11/09/22.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable {
    
    var next: String?
    var isNextExist: Bool {
        if next == nil {
            return false
        }
        return true
    }
    var previous: String?
    var count = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        next   <- map["next"]
        previous <- map["previous"]
        count <- map["count"]
    }
    
}
