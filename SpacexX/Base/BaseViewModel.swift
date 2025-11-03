//
//  BaseViewModel.swift
//  SpacexX
//
//  Created by Baki on 1.11.2025.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {
    var showActivityIndicatorView: VoidClosure? { get set }
    var showActivityIndicatorBottomView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    var showTryAgainButton: VoidClosure? { get set }
    var hideTryAgainButton: VoidClosure? { get set }
    
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func tryAgainButtonTapped()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    func tryAgainButtonTapped() {}
    
    var showActivityIndicatorView: VoidClosure?
    var showActivityIndicatorBottomView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    var showTryAgainButton: VoidClosure?
    var hideTryAgainButton: VoidClosure?
    
    
    let router: R
   
    init(router: R) {
        self.router = router
       }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
