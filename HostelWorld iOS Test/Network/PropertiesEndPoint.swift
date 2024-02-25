//
//  PropertiesEndPoint.swift
//  HostelWorld iOS Test
//
//  Created by ricardo silva on 19/02/2024.
//

import Foundation

// Enum defining API endpoints for properties
enum PropertiesEndPoint: APIEndpoint {
    
    case getProperties
    case getPropertyDetail(String)
    
    // Base URL for the API
    var baseURL: URL {
        return URL(string: Constants.APIConstants.baseUrl)!
    }
    
    // Path for each endpoint
    var path: String {
        switch self {
        case .getProperties:
            return Constants.APIConstants.pathCityProperties
        case .getPropertyDetail(let value):
            // Print value for debugging
            print(value)
            return Constants.APIConstants.pathProperty + "\(value)"
        }
    }
    
    // HTTP method for each endpoint
    var method: HTTPMethod {
        switch self {
        case .getProperties, .getPropertyDetail:
            return .get
        }
    }
}

