//
//  CommentActionsAlertRoute.swift
//  SpacexX
//
//  Created by Baki on 31.10.2025.
//

import Foundation

protocol CommentActionsAlertRoute {
    func commentActions(editAction: VoidClosure?, deleteAction: VoidClosure?)
}

extension CommentActionsAlertRoute where Self: RouterProtocol {
    
    func commentActions(editAction: VoidClosure?, deleteAction: VoidClosure?) {
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let edit = UIAlertAction(title: L10n.CommentList.edit, style: .destructive) { _ in
            editAction?()
        }
        let delete = UIAlertAction(title: L10n.CommentList.delete, style: .destructive) { _ in
            deleteAction?()
        }
        let cancel = UIAlertAction(title: L10n.CommentList.cancel, style: .cancel)
        let transition = ModalTransition()
        
        alertController.addAction(edit)
        alertController.addAction(delete)
        alertController.addAction(cancel)
    
        open(alertController, transition: transition)
    }
}
