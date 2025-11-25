//
//  BaseViewController.swift
//  SpacexX
//
//  Created by Baki on 1.11.2025.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController, LoadingProtocol, ActivityIndicatorProtocol  {
    
    typealias LoadingProtocols = LoadingProtocol & ActivityIndicatorProtocol
    
    private let tryAgainButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
        button.setTitle("Error", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeLoading()
        subscribeActivityIndicator()
        addTryAgainButton()
        subscribeShowTryAgainButton()
        subscribeHideTryAgainButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTryAgainButton() {
        view.addSubview(tryAgainButton)
        tryAgainButton.centerInSuperview()
        tryAgainButton.titleLabel?.numberOfLines = 0
        tryAgainButton.titleLabel?.textAlignment = .center
        tryAgainButton.size(CGSize(width: 200, height: 60))
        tryAgainButton.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func tryAgainButtonTapped() {
        viewModel.tryAgainButtonTapped()
        print("Try Again button tapped")

    }
    
    func subscribeShowTryAgainButton() {
        viewModel.showTryAgainButton = { [weak self] errorMessage in
            guard let self = self else { return }
            self.tryAgainButton.setTitle("Try Again (\(errorMessage))", for: .normal)
            self.addTryAgainButton()
        }
    }
    
    func subscribeHideTryAgainButton() {
        viewModel.hideTryAgainButton = { [weak self] in
            self?.tryAgainButton.removeFromSuperview()
        }
    }
    
    private func subscribeActivityIndicator() {
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator(indicatorType: .center)
        }
        viewModel.showActivityIndicatorBottomView = { [weak self] in
            self?.showActivityIndicator(indicatorType: .bottom)
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
    }
    
    private func subscribeLoading() {
        viewModel.showLoading = { [weak self] in
            self?.presentLoading()
        }
        viewModel.hideLoading = { [weak self] in
            self?.dismissLoading()
        }
    }
    
}
