//
//  License.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct License {
    
    var key = String()
    var name = String()
    var spdx_id = String()
    var url = String()
    var node_id = String()
    
}

extension License: Mappable {
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        key       <- map["key"]
        name      <- map["name"]
        spdx_id   <- map["spdx_id"]
        url       <- map["url"]
        node_id   <- map["node_id"]
        
    }
    
}

//"key": "mit",
//"name": "MIT License",
//"spdx_id": "MIT",
//"url": "https://api.github.com/licenses/mit",
//"node_id": "MDc6TGljZW5zZTEz"

