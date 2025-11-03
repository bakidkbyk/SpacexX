//
//  RocketListViewModel.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

protocol RocketListViewDataSource {}

protocol RocketListViewEventSource {}

protocol RocketListViewProtocol: RocketListViewDataSource, RocketListViewEventSource {}

final class RocketListViewModel: BaseViewModel<RocketListRouter>, RocketListViewProtocol {
    
    private let type: ListPageType
    
    
    init(type: ListPageType) {
        self.type = type
        super.init(router: RocketListRouter())
    }
}
