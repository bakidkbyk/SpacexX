//
//  RocketListCell.swift
//  SpacexX
//
//  Created by Baki on 4.11.2025.
//

import UIKit
import TinyConstraints


public class RocketListCell: UICollectionViewCell, ReusableView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.height(40)
        imageView.width(40)
        imageView.backgroundColor = .clear
        imageView.tintColor = .label
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .label
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let chevronImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .systemGray3
        image.contentMode = .scaleAspectFit
        image.width(20)
        return image
    }()
    
    private let seperator: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.height(0.5)
        return view
    }()
    
    weak var viewModel: RocketListCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public func set(viewModel: RocketListCellProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Configure Contents
extension RocketListCell {
    
    private func configureContents() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(imageView)
        imageView.leadingToSuperview().constant = 16
        imageView.centerYToSuperview()
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        
        stackView.leadingToTrailing(of: imageView).constant = 12
        stackView.centerYToSuperview()
        
        contentView.addSubview(chevronImage)
        chevronImage.trailingToSuperview().constant = -16
        chevronImage.centerYToSuperview()
        
        stackView.trailingToLeading(of: chevronImage).constant = -12
        
        contentView.addSubview(seperator)
        seperator.leadingToSuperview().constant = 16
        seperator.trailingToSuperview().constant = -16
        seperator.bottomToSuperview()
    }
}
