//
//  RocketListCellModel.swift
//  SpacexX
//
//  Created by Baki on 4.11.2025.
//

import Foundation

public protocol RocketListCellDataSource: AnyObject {
    
}

public protocol RocketListCellEventSource: AnyObject {
    
}

public protocol RocketListCellProtocol: RocketListCellDataSource, RocketListCellEventSource {
    
}

public final class RocketListCellModel: RocketListCellProtocol {
    
}
