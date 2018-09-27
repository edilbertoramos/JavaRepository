//
//  ServiceHelperTests.swift
//  JavaRepositoryTests
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import XCTest
@testable import JavaRepository

class ServiceHelperTests: XCTestCase {
    
    var url: String!
    var endpoint: RepositoryService.Services!
    
    override func setUp() {
        super.setUp()
        endpoint = RepositoryService.Services.repository
    }
    
    override func tearDown() {
        super.tearDown()
        endpoint = nil
        url = nil
    }
    
    func testExample() {
        url = ServiceHelper.mountUrl(withEndPoint: endpoint)
        XCTAssert(url == "https://api.github.com/search/repositories")
    }
    
}
