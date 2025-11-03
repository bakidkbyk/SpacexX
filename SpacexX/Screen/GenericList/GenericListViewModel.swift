//
//  GenericListViewModel.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

protocol GenericListViewDataSource {}

protocol GenericListViewEventSource {}

protocol GenericListViewProtocol: GenericListViewDataSource, GenericListViewEventSource {}

final class GenericListViewModel: BaseViewModel<GenericListRouter>, GenericListViewProtocol {
    
    private let type: ListPageType
    
    
    init(type: ListPageType) {
        self.type = type
        super.init(router: GenericListRouter())
    }
}

enum ListPageType {
    case past
    case upcoming
}
