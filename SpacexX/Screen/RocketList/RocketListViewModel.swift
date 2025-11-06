//
//  RocketListViewModel.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

protocol RocketListViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(_ IndexPath: IndexPath) -> RocketListCellProtocol}


protocol RocketListViewEventSource {}

protocol RocketListViewProtocol: RocketListViewDataSource, RocketListViewEventSource {}

final class RocketListViewModel: BaseViewModel<RocketListRouter>, RocketListViewProtocol {
    
    var rocketListCellItem: [RocketListCellProtocol] = []
    var getDataDidSuccess: VoidClosure?
    
    
    func numberOfItemsAt() -> Int {
        return rocketListCellItem.count
    }
    
    func cellItemAt(_ IndexPath: IndexPath) -> any RocketListCellProtocol {
        return rocketListCellItem[IndexPath.row]
    }
    
    let type: ListPageType
    
    init(type: ListPageType) {
        self.type = type
        super.init(router: RocketListRouter())
        rocketListRequest(for: type)
    }
}

// MARK: - Fetch Data
extension RocketListViewModel {}

// MARK: - Network
extension RocketListViewModel {
    
    func rocketListRequest(for type: ListPageType) {
        switch type {
        case .upcoming:
            showLoading?()
            let request = UpcomingRequest()
            dataProvider.request(for: request) { [weak self] result in
                guard let self = self else { return }
                self.hideLoading?()
                switch result {
                case .success(let response):
                    let cellItems = response.map { RocketListCellModel(rocketListReponse: $0) }
                    self.rocketListCellItem = cellItems
                    self.getDataDidSuccess?()
                case .failure(let error):
                    print("Error:", error.localizedDescription)
                }
            }
        case .past:
            showLoading?()
            let request = PastRequest()
            dataProvider.request(for: request) { [weak self] result in
                guard let self = self else { return }
                self.hideLoading?()
                switch result {
                case .success(let response):
                    let cellItems = response.map { RocketListCellModel(rocketListReponse: $0) }
                    self.rocketListCellItem = cellItems
                    self.getDataDidSuccess?()
                case .failure(let error):
                    print("Error:", error.localizedDescription)
                }
            }
        }
        
    }
    
}
