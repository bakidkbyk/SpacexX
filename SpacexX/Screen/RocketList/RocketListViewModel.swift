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
    
    private var page = 1
    private var hasNextPage = true
    private var isLoadingPage = false
    
    
    
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
        rocketListRequest(for: type, page: page)
    }
}

// MARK: - Fetch Data
extension RocketListViewModel {}

// MARK: - Network
extension RocketListViewModel {
    
    func rocketListRequest(for type: ListPageType, page: Int) {
        guard !isLoadingPage, hasNextPage else { return }
        isLoadingPage = true
        
        if page == 1 {
            showLoading?()
        } else {
            showActivityIndicatorBottomView?()
        }
        switch type {
        case .upcoming:
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
