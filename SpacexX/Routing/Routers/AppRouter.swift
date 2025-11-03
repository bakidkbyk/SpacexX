//
//  AppRouter.swift
//  SpacexX
//
//  Created by Baki on 31.10.2025.
//

import UIKit

protocol AppRouterRoutes: HomeRoute {
    func startApp()
    
}

final class AppRouter: Router, AppRouterRoutes  {

    static let shared = AppRouter()
    
    func startApp() {
        presentHome()
    }
}
