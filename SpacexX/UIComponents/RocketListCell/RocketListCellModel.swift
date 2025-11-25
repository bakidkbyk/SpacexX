//
//  RocketListCellModel.swift
//  SpacexX
//
//  Created by Baki on 4.11.2025.
//

import Foundation

public protocol RocketListCellDataSource: AnyObject {
    var imageUrl: String { get }
    var name: String { get }
    var date: String { get }
}

public protocol RocketListCellEventSource: AnyObject {}

public protocol RocketListCellProtocol: RocketListCellDataSource, RocketListCellEventSource {}

public final class RocketListCellModel: RocketListCellProtocol {
    
    public var imageUrl: String
    public var name: String
    public var date: String
    
    public init(imageUrl: String, name: String, date: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.date = date
    }
}
