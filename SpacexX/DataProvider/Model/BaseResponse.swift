//
//  BaseResponse.swift
//  SpacexX
//
//  Created by Baki on 12.11.2025.
//

import Foundation

public struct BaseResponse: Decodable {
    
    public let docs: [RocketListResponse]
    public let page: Int
    public let nextPage: Int?
    public let hasNextPage: Bool
    public let totalDocs: Int?
    public let limit: Int?
    
}
