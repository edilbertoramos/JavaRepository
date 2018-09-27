//
//  ServiceEndpoint.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 26/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation

public protocol ServiceEndpoint {
    var endpoint: String { get }
}

extension ServiceEndpoint where Self: RawRepresentable, Self.RawValue == String {
    
    public var endpoint: String {
        return self.rawValue
    }
    
}
