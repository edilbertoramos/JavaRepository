//
//  ServiceResponse.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation

public struct ServiceResponse<T> {
    
    fileprivate let success: Bool
    public let data: T?
    public let error: CustomError?
    public let statusCode: Int?
    public let errorMessage: String?
    
    public var isSuccess: Bool { return success }
    
    fileprivate init(success: Bool = false, data: T?, error: CustomError?, statusCode: Int?, errorMessage: String?) {
        self.success = success
        self.data = data
        self.error = error
        self.statusCode = statusCode
        self.errorMessage = errorMessage
    }
    
    
    public init(withError error: CustomError, statusCode: Int? = nil, errorMessage: String? = nil) {
        self.init(success: false, data: nil, error: error, statusCode: statusCode, errorMessage: errorMessage)
    }
    
    public init(withData data: T, statusCode: Int? = nil) {
        self.init(success: true, data: data, error: nil, statusCode: statusCode, errorMessage: nil)
    }
    
    func logError() -> CustomError {
        print("Error: \(error!), message: \(errorMessage ?? "")")
        return error!
    }
}
