//
//  HomeViewModel.swift
//  SpacexX
//
//  Created by Baki on 1.11.2025.
//

import Foundation

protocol HomeViewDataSource {}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    var selectedSegmentIndex = 0
}
