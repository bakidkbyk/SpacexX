//
//  DataProviderResult.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
    
}
