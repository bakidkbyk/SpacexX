//
//  Animator.swift
//  SpacexX
//
//  Created by Baki on 31.10.2025.
//

import Foundation

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
