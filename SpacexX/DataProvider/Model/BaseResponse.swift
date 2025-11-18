//
//  BaseResponse.swift
//  SpacexX
//
//  Created by Baki on 12.11.2025.
//

import Foundation

public struct BaseResponse<T: Decodable>: Decodable {
    
    public let docs: T
    public let pagination: PaginationResponse
    
}
