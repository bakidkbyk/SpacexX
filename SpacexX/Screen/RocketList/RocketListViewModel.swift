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
    var endRefreshing: VoidClosure?

    
    private var page = 1
    private var hasNextPage = true
    private var isLoadingPage = false
    
    let type: ListPageType

    func numberOfItemsAt() -> Int {
        return rocketListCellItem.count
    }
    
    func cellItemAt(_ IndexPath: IndexPath) -> any RocketListCellProtocol {
        return rocketListCellItem[IndexPath.row]
    }
    
    init(type: ListPageType) {
        self.type = type
        super.init(router: RocketListRouter())
    }
    
    override func tryAgainButtonTapped() {
        self.hideTryAgainButton?()
        rocketListRequest(isRefReshing: false)
    }
    
    func refreshData() {
        guard !isLoadingPage else { return }

        page = 1
        hasNextPage = true
        isLoadingPage = false

        rocketListRequest(isRefReshing: true)
    }
}

// MARK: - Fetch Data
extension RocketListViewModel {

    func rocketListRequest(isRefReshing: Bool) {

        guard !isLoadingPage, hasNextPage else { return }
        isLoadingPage = true
        
        if isRefReshing == true {
            if page == 1 {
                showLoading?()
            } else {
                showActivityIndicatorBottomView?()
            }
        }

        let isUpcoming: Bool
        switch type {
        case .upcoming:
            isUpcoming = true
        case .past:
            isUpcoming = false
        }
        
        let request = RocketListRequest(page: page, upcoming: isUpcoming)

        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            
            if isRefReshing {
                self.hideLoading?()
            } else {
                self.endRefreshing?()
            }
            
            self.isLoadingPage = false

            switch result {
            case .success(let response):
                
                let cellItems = response.docs.map {
                    RocketListCellModel(rocketListReponse: $0)
                }

                if self.page == 1 {
                    self.rocketListCellItem = cellItems
                } else {
                    self.rocketListCellItem.append(contentsOf: cellItems)
                }

                self.hasNextPage = response.hasNextPage
                self.page = response.nextPage ?? self.page
                self.getDataDidSuccess?()

            case .failure(let error):
                self.showTryAgainButton?(error.localizedDescription)
                print("ERROR:", error.localizedDescription)
            }
        }
    }
}

