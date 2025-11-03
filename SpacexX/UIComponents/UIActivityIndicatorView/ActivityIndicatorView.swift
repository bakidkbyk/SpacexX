//
//  ActivityIndicatorView.swift
//  SpacexX
//
//  Created by Baki on 1.11.2025.
//

import UIKit

public class ActivityIndicatorView: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        style = .gray
        tintColor = .gray
        hidesWhenStopped = true
    }
    
}
