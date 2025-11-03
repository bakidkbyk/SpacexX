//
//  APIDecodableResponseRequest.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

public protocol APIDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension APIDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - Url
public extension APIDecodableResponseRequest {
    var url: String {
        return "https://api.spacexdata.com/v5/" + path
    }
}

// MARK: - RequestParameters
public extension APIDecodableResponseRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension APIDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
