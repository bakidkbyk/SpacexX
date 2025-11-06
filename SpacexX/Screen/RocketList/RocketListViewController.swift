//
//  RocketListViewController.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import UIKit
import TinyConstraints

final class RocketListViewController: BaseViewController<RocketListViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.borderWidth = 0.5
        collectionView.layer.borderColor = UIColor.separator.cgColor
        collectionView.layer.cornerRadius = 7
        collectionView.clipsToBounds = true
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModel()
        viewModel.rocketListRequest(for: viewModel.type)
    }
}

// MARK: - UILayout
extension RocketListViewController {
    
    private func addSubViews() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .top)
        collectionView.topToSuperview().constant = 20
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
    }
}

// MARK: - Configure Contents
extension RocketListViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RocketListCell.self)
    }
}

// MARK: - Subscribe View Model
extension RocketListViewController {
    
    private func subscribeViewModel() {
        viewModel.getDataDidSuccess = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: - Collection View Delegate
extension RocketListViewController: UICollectionViewDelegate {}

// MARK: - Collection View Data Source
extension RocketListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.numberOfItemsAt()
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RocketListCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RocketListViewController: UICollectionViewDelegateFlowLayout {
   
   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
       let cellWidth = view.frame.width
       return CGSize(width: cellWidth, height: 80)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 10
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
       return CGSize(width: collectionView.bounds.width, height: 50)
   }
}
