//
//  Error.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation

public protocol CustomError: Error, CustomStringConvertible {
    
}

extension Error {
    
    var description: String { return "\(self)" }
    
}
