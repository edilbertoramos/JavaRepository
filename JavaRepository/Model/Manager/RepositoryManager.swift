//
//  RepositoryManager.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation

struct RepositoryManager {
    
    private let repositoryService: RepositoryServiceProtocol = RepositoryService()
    
    func repositories(language: String = "Java", sort: String = "stars",success:@escaping ([Repository]) -> (), failure:@escaping (CustomError) -> ()) {
        
        repositoryService.repositories(language: language, sort: sort) { (serviceResponse) in
            
            if serviceResponse.isSuccess {
                success(serviceResponse.data!.items)
            } else {
                failure(serviceResponse.logError())
            }
            
        }
        
    }
    
}
