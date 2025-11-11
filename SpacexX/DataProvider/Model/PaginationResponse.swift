//
//  PaginationResponse.swift
//  SpacexX
//
//  Created by Baki on 10.11.2025.
//

import Foundation

public struct PaginationResponse: Decodable {
    
    public let page: Int
    public let nextPage: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case nextPage
    }
}
