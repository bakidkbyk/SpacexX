//
//  SpaceXRequest.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

public protocol SpaceXRequest: DecodableResponseRequest { }

// MARK: - Default Values
public extension SpaceXRequest {
    
    var parameters: RequestParameters {
        return [:]
    }
    
    var headers: RequestHeaders {
        return [:]
    }
    
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        case .connect, .delete, .head, .options, .patch, .post, .put, .trace:
            return .json
        }
    }
    
    var url: String {
        return "https://api.spacexdata.com/v4/" + path
    }
}
