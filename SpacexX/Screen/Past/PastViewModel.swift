//
//  PastViewModel.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Foundation

protocol PastViewDataSource {}

protocol PastViewEventSource {}

protocol PastViewProtocol: PastViewDataSource, PastViewEventSource {}

final class PastViewModel: BaseViewModel<PastRouter>, PastViewProtocol {
    
}
