//
//  RepositoryServiceProtocol.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

protocol RepositoryServiceProtocol {
    
    func repositories(language: String, sort: String, callback: @escaping (ServiceResponse<RepositoryResponse>) -> Void)
    
    func pulls(_ repository: Repository, callback: @escaping (ServiceResponse<[Pull]>) -> Void)

}
