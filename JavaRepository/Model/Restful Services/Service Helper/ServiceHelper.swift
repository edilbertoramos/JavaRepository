//
//  ServiceHelper.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 26/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation

import Alamofire
import ObjectMapper

public struct ServiceHelper {
    
    static public var baseUrl: String {
        return AppConfig.config(withKey: .ServiceUrl)
    }
    
    static public func mountUrl(_ url: String = baseUrl, withEndPoint service: ServiceEndpoint) -> String {
        return "\(baseUrl)/\(service.endpoint)"
    }
    
    static public func mountUrl(_ url: String = baseUrl, withEndPoint service: ServiceEndpoint, pathParameters parameters: String...) -> String {
        return String(format: mountUrl(url, withEndPoint: service), parameters)
    }
    
    static public func addParams(_ params: [String: Any], onUrl url: String = baseUrl) -> String {
        return "\(url)?\(params.map{(k, v) in "\(k)=\(v)"}.joined(separator: "&"))"
    }
    
    static public func restManager() -> Alamofire.SessionManager {
        return Alamofire.SessionManager.default
    }
}

// MARK:- Service request brigde
extension ServiceHelper {
    
    // MARK: - Boolean
    static public func post(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForString callback: @escaping (ServiceResponse<String>) -> Void) {
        request(url: url, method: .post, parameters: parameters, headers: headers, callbackForString: callback)
    }
    
    static public func put(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForString callback: @escaping (ServiceResponse<String>) -> Void) {
        request(url: url, method: .put, parameters: parameters, headers: headers, callbackForString: callback)
    }
    
    static public func get(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForString callback: @escaping (ServiceResponse<String>) -> Void) {
        request(url: url, method: .get, parameters: parameters, headers: headers, callbackForString: callback)
    }
    
    // MARK: - Mappable Object
    static public func post<T: Mappable>(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForObject callback: @escaping (ServiceResponse<T>) -> Void) {
        request(url: url, method: .post, parameters: parameters, headers: headers, callbackForObject: callback)
    }
    
    static public func put<T: Mappable>(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForObject callback: @escaping (ServiceResponse<T>) -> Void) {
        request(url: url, method: .put, parameters: parameters, headers: headers, callbackForObject: callback)
    }
    
    static public func get<T: Mappable>(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForObject callback: @escaping (ServiceResponse<T>) -> Void) {
        request(url: url, method: .get, parameters: parameters, headers: headers, callbackForObject: callback)
    }
    
    // MARK: - Mappable Array
    static public func post<T: Mappable>(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForObjectArray callback: @escaping (ServiceResponse<[T]>) -> Void) {
        request(url: url, method: .post, parameters: parameters, headers: headers, callbackForObjectArray: callback)
    }
    
    static public func put<T: Mappable>(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForObjectArray callback: @escaping (ServiceResponse<[T]>) -> Void) {
        request(url: url, method: .put, parameters: parameters, headers: headers, callbackForObjectArray: callback)
    }
    
    static public func get<T: Mappable>(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callbackForObjectArray callback: @escaping (ServiceResponse<[T]>) -> Void) {
        request(url: url, method: .get, parameters: parameters, headers: headers, callbackForObjectArray: callback)
    }
    
}

// MARK: - Service Response Helper
extension ServiceHelper {
    
    static public func responseForString(response: DataResponse<String>, callback: @escaping (ServiceResponse<String>) -> Void) {
        if response.result.isSuccess {
            callback(ServiceResponse(withData: response.result.value ?? "", statusCode: response.response?.statusCode))
        }
        else {
            var errorMessage: String? = nil
            if let data = response.data {
                if let message = String(data: data, encoding: .utf8) {
                    errorMessage = message
                }
            }
            callback(ServiceResponse(withError: ServiceError.requestFailure, statusCode: response.response?.statusCode, errorMessage: errorMessage))
        }
    }
    
    static public func responseForObject<T: Mappable>(response: DataResponse<Any>, callback: @escaping (ServiceResponse<T>) -> Void) {
        if response.result.isSuccess {
            if let obj = Mapper<T>().map(JSONObject: response.result.value) {
                // logger.info("response: \(response.result.value ?? "")")
                callback(ServiceResponse(withData: obj, statusCode: response.response?.statusCode))
            }
            else {
                callback(ServiceResponse(withError: ServiceError.responseObjectError, statusCode: response.response?.statusCode))
            }
        }
        else {
            var errorMessage: String? = nil
            if let data = response.data {
                if let message = String(data: data, encoding: .utf8) {
                    errorMessage = message
                }
            }
            callback(ServiceResponse(withError: ServiceError.requestFailure, statusCode: response.response?.statusCode, errorMessage: errorMessage))
        }
    }
    
    static public func responseForArray<T: Mappable>(response: DataResponse<Any>, callback: @escaping (ServiceResponse<[T]>) -> Void) {
        if response.result.isSuccess {
            if let obj = Mapper<T>().mapArray(JSONObject: response.result.value) {
                // logger.info("response: \(response.result.value ?? "")")
                callback(ServiceResponse(withData: obj, statusCode: response.response?.statusCode))
            }
            else {
                callback(ServiceResponse(withError: ServiceError.responseObjectError, statusCode: response.response?.statusCode))
            }
        }
        else {
            var errorMessage: String? = nil
            if let data = response.data {
                if let message = String(data: data, encoding: .utf8) {
                    errorMessage = message
                }
            }
            callback(ServiceResponse(withError: ServiceError.requestFailure, statusCode: response.response?.statusCode, errorMessage: errorMessage))
        }
    }
    
}

// MARK: - Request Helper Default
extension ServiceHelper {
    
    fileprivate static func request(url: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?, callbackForString callback: @escaping (ServiceResponse<String>) -> Void) {
        ServiceHelper.restManager().request(url, method: method, parameters: parameters, encoding: method == .get ? URLEncoding.default : JSONEncoding.default, headers: headers)
            .validate(statusCode: [RSHttpStatusCode.success.code, RSHttpStatusCode.accepted.code, RSHttpStatusCode.created.code])
            .responseString(completionHandler: { (response) in
                responseForString(response: response, callback: callback)
            })
    }
    
    fileprivate static func request<T: Mappable>(url: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?, callbackForObject callback: @escaping (ServiceResponse<T>) -> Void) {
        ServiceHelper.restManager().request(url, method: method, parameters: parameters, encoding: method == .get ? URLEncoding.default : JSONEncoding.default, headers: headers)
            .validate(statusCode: [RSHttpStatusCode.success.code, RSHttpStatusCode.accepted.code, RSHttpStatusCode.created.code])
            .responseJSON(completionHandler: { (response) in
                responseForObject(response: response, callback: callback)
            })
    }
    
    fileprivate static func request<T: Mappable>(url: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?, callbackForObjectArray callback: @escaping (ServiceResponse<[T]>) -> Void) {
        ServiceHelper.restManager().request(url, method: method, parameters: parameters, encoding: method == .get ? URLEncoding.default : JSONEncoding.default, headers: headers)
            .validate(statusCode: [RSHttpStatusCode.success.code, RSHttpStatusCode.accepted.code, RSHttpStatusCode.created.code])
            .responseJSON(completionHandler: { (response) in
                responseForArray(response: response, callback: callback)
            })
    }
    
}
