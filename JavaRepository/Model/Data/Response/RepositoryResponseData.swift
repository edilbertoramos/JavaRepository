//
//  RepositoryResponseData.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct RepositoryResponse {
    
    var total_count = Int()
    var incomplete_results = false
    var items = [Repository]()

}

extension RepositoryResponse: Mappable {
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        total_count          <- map["total_count"]
        incomplete_results   <- map["incomplete_results"]
        items                <- map["items"]
    }
}

//"total_count": 5250826,
//"incomplete_results": false,
//"items": []
