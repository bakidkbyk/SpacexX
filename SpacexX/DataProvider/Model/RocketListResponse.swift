//
//  RocketListResponse.swift
//  SpacexX
//
//  Created by Baki on 4.11.2025.
//

import UIKit

public struct RocketListResponse: Decodable {
    public let links: Links
    public let dateLocal: String
    public let upcoming: Bool
    public let id: String
    public let name: String
    
    enum CodingKeys: String, CodingKey {
        case links
        case dateLocal = "date_local"
        case upcoming
        case id
        case name
    }
}
