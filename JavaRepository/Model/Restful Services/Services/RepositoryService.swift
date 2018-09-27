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
        case pull = "/repos/%@/pulls"
    }
    
    func repositories(language: String, sort: String, callback: @escaping (ServiceResponse<RepositoryResponse>) -> Void) {
        
        let uri = ServiceHelper.mountUrl(withEndPoint: Services.repository)
        
        var parameters = [String: Any]()
        parameters["q"] = "language:\(language)"
        parameters["sort"] = sort

        ServiceHelper.get(url: uri, parameters: parameters, headers: nil, callbackForObject: callback)

    }
    
    func pulls(_ repository: Repository, callback: @escaping (ServiceResponse<[Pull]>) -> Void) {
        
        let uri = ServiceHelper.baseUrl + String(format: Services.pull.endpoint, "\(repository.owner.login)/\(repository.name)")

        ServiceHelper.get(url: uri, callbackForObjectArray: callback)
    }
}
