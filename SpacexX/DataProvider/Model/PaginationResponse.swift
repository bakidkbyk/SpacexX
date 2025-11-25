//
//  PaginationResponse.swift
//  SpacexX
//
//  Created by Baki on 10.11.2025.
//

import Foundation

public struct PaginationResponse: Decodable {
    
    public let page: Int
    public let nextPage: Int?
    public let hasNextPage: Bool
    public let hasPrevPage: Bool?
    public let prevPage: Int?
    public let totalDocs: Int?
    public let limit: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case nextPage
        case hasNextPage
        case hasPrevPage
        case prevPage
        case totalDocs
        case limit
    }
}
