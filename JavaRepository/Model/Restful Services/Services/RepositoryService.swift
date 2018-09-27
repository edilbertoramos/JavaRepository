//
//  RepositoryService.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct RepositoryService: RepositoryServiceProtocol {
    
    enum Services: String, ServiceEndpoint {
        case repository = "search/repositories"
    }
    
    func repositorys(q: String = "language:Java", sort: String = "stars", callback: @escaping (ServiceResponse<[Repository]>) -> Void) {
        
        let uri = ServiceHelper.mountUrl(withEndPoint: Services.repository)
        
        var parameters = [String: Any]()
        parameters["q"] = q
        parameters["sort"] = sort

        ServiceHelper.get(url: uri, parameters: parameters, headers: nil, callbackForObjectArray: callback)

    }
}
