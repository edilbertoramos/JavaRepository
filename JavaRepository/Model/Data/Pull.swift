//
//  Pull.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Pull {
    
    // Relations
    var user = Owner()
    
    // Others
    var url = String()
    var id = Int()
    var node_id = String()
    var number = Int()
    var state = String()
    var locked = false
    var title = String()
    var created_at = String()
    var updated_at = String()
    
}

extension Pull: Mappable {
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        url           <- map["url"]
        id            <- map["id"]
        node_id       <- map["node_id"]
        number        <- map["number"]
        state         <- map["state"]
        locked        <- map["locked"]
        title         <- map["title"]
        created_at    <- map["created_at"]
        updated_at    <- map["updated_at"]
        
    }
    
    
}
