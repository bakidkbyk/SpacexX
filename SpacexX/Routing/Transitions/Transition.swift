//
//  Transition.swift
//  SpacexX
//
//  Created by Baki on 31.10.2025.
//

import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
