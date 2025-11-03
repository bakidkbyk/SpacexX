//
//  UpcomingViewModel.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

protocol UpcomingViewDataSource {}

protocol UpcomingViewEventSource {}

protocol UpcomingViewProtocol: UpcomingViewDataSource, UpcomingViewEventSource {}

final class UpcomingViewModel: BaseViewModel<UpcomingRouter>, UpcomingViewProtocol {
    
}
