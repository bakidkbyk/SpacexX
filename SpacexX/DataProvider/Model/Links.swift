//
//  Links.swift
//  SpacexX
//
//  Created by Baki on 4.11.2025.
//

import Foundation

public struct Links: Decodable {
    
    public let patch: ImageCount
    
    enum CodingKeys: String, CodingKey {
        case patch
    }
}
