//
//  DecodableResponseRequest.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
