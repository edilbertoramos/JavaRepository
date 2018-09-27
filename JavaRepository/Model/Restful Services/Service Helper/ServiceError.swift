//
//  ServiceError.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation

public enum ServiceError: CustomError {
    case requestFailure
    case responseObjectError
    
    public var description: String {
        switch self {
        case .requestFailure:
            return "service_request_error"
            
        case .responseObjectError:
            return "service_json_error"
        }
    }
}
