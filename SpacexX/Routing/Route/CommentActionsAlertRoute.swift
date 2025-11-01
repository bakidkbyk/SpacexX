//
//  CommentActionsAlertRoute.swift
//  SpacexX
//
//  Created by Baki on 31.10.2025.
//

import UIKit

protocol CommentActionsAlertRoute {
    func commentActions(editAction: VoidClosure?, deleteAction: VoidClosure?)
}

extension CommentActionsAlertRoute where Self: RouterProtocol {
    
    func commentActions(editAction: VoidClosure?, deleteAction: VoidClosure?) {
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let edit = UIAlertAction(title: "Edit", style: .destructive) { _ in
            editAction?()
        }
        let delete = UIAlertAction(title: "Delete", style: .destructive) { _ in
            deleteAction?()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let transition = ModalTransition()
        
        alertController.addAction(edit)
        alertController.addAction(delete)
        alertController.addAction(cancel)
    
        open(alertController, transition: transition)
    }
}
