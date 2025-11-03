//
//  HomeViewController.swift
//  SpacexX
//
//  Created by Baki on 1.11.2025.
//

import UIKit
import TinyConstraints

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configure()
        setLocalize()
    }
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private let segmentControl: UISegmentedControl = {
        let titles = ["Upcoming","Past"]
        let segmentControl = UISegmentedControl(items: titles)
        return segmentControl
    }()
    
    private lazy var subViewControllers: [UIViewController] = {
        return self.configureControllers()
    }()
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubviews() {
        view.addSubview(segmentControl)
        segmentControl.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
    }
    
    private func addPageViewController() {
        definesPresentationContext = true
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        
        pageViewController.view.edgesToSuperview(excluding: .top, usingSafeArea: true)
        pageViewController.view.topToBottom(of: segmentControl)
    }
}

// MARK: - Configure Contents
extension HomeViewController {
    
    private func configure() {
        view.backgroundColor = .white
        pageViewController.delegate = self
        pageViewController.dataSource = self
        segmentControl.height(40)
        
        pageViewController.setViewControllers([subViewControllers[viewModel.selectedSegmentIndex]], direction: .forward, animated: false)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action:
                                    #selector(segmentControlValueDidChange), for: .valueChanged)
    }
    
    private func setLocalize() {
        navigationItem.title = "Launches"
    }
}

// MARK: - Actions
extension HomeViewController {
    
    @objc
    private func segmentControlValueDidChange(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        let direction: UIPageViewController.NavigationDirection
        switch selectedIndex > viewModel.selectedSegmentIndex {
        case true:
            direction = .forward
        case false:
            direction = .reverse
        }
        viewModel.selectedSegmentIndex = selectedIndex
        
        self.pageViewController.setViewControllers([subViewControllers[selectedIndex]], direction: direction, animated: true)
    }
}

// MARK: - Configure Controllers
extension HomeViewController {
    
    private  func configureControllers() -> [UIViewController] {
        let upcomingRouter = GenericListRouter()
        let upcomingViewModel = GenericListViewModel(type: .upcoming)
        let upcomingViewController = GenericListViewController(viewModel: upcomingViewModel)
        upcomingRouter.viewController = upcomingViewController
        
        let pastRouter = GenericListRouter()
        let pastViewModel = GenericListViewModel(type: .past)
        let pastViewController = GenericListViewController(viewModel: pastViewModel)
        pastRouter.viewController = pastViewController
        
        return [upcomingViewController, pastViewController]
    }
}

// MARK: - Page View Controller Delegate
extension HomeViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard completed,
              let  currentViewController = pageViewController.viewControllers?.first,
              let index = subViewControllers.firstIndex(of: currentViewController) else { return
        }
        segmentControl.selectedSegmentIndex = index
    }
}

// MARK: - Page View Controller Data Source
extension HomeViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.subViewControllers.lastIndex(of: viewController) else { return nil }
        
        let previousIndex = index - 1
        guard previousIndex >= 0 else { return nil }
        guard previousIndex < subViewControllers.count else { return nil }
        return subViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.subViewControllers.lastIndex(of: viewController) else { return nil }
        
        let previousIndex = index + 1
        guard previousIndex >= 0 else { return nil }
        guard previousIndex < subViewControllers.count else { return nil }
        return subViewControllers[previousIndex]
    }
}
