//
//  UpcomingRequest.swift
//  SpacexX
//
//  Created by Baki on 4.11.2025.
//

public struct UpcomingRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = [RocketListResponse]
    
    public let path: String = "launches/upcoming"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
}
