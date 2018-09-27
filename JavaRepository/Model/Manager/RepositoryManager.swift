//
//  RepositoryManager.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation

var ServiceManager: RepositoryManager {
    return RepositoryManager.sharedInstance
}

struct RepositoryManager {
    
    static let sharedInstance = RepositoryManager()
    private let repositoryService: RepositoryServiceProtocol = RepositoryService()

    var page = Int()
    
    mutating func incrementPage() {
        page += 1
    }
    
    mutating func resetPage() {
        page = 1
    }
    
    func repositories(language: String = "Java", sort: String = "stars", page: Int = 1, success:@escaping ([Repository]) -> (), failure:@escaping (CustomError) -> ()) {
        
        repositoryService.repositories(language: language, sort: sort, page: page) { (serviceResponse) in
            
            if serviceResponse.isSuccess {
                success(serviceResponse.data!.items)
            } else {
                failure(serviceResponse.logError())
            }
            
        }
        
    }
    
    func pulls(_ repository: Repository ,success:@escaping ([Pull]) -> (), failure:@escaping (CustomError) -> ()) {
        
        repositoryService.pulls(repository) { (serviceResponse) in

            if serviceResponse.isSuccess {
                success(serviceResponse.data!)
            } else {
                failure(serviceResponse.logError())
            }
            
        }
        
    }
    
}
