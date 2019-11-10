//
//  OnboardingViewController.swift
//  finanx
//
//  Created by Rafael Villarreal on 11/7/19.
//  Copyright © 2019 Rafael Villarreal. All rights reserved.
//

import UIKit

struct OnboardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnboardingViewController: UIPageViewController {
    var pageControl: UIPageControl?
    
    fileprivate(set) lazy var items: [OnboardingItem] = {
        return [
            OnboardingItem(
                title: "Save money and reduce debt",
                description: "Press the start button",
                imageName: "Onboarding1"
            ),
            OnboardingItem(
                title: "You’ve finished your onboarding",
                description: "Press the start button",
                imageName: "Onboarding2"
            )
        ]
    }()
    
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        var items = [UIViewController]()
        for i in 0 ..< self.items.count {
            items.append(self.instantViewController(i))
        }
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        pageControl?.numberOfPages = items.count
        updateContainerView(stepNumber: 0)
    }
    
    func updateContainerView(stepNumber index: Int) {
        setViewControllers([contentViewController[index]], direction: .forward, animated: true, completion: nil)
    }
    
    func instantViewController (_ index: Int) -> UIViewController {
        guard let viewController = UIStoryboard(
            name: "Onboarding",
            bundle: Bundle.main
        ).instantiateViewController(withIdentifier: "OnboardingSteps") as? OnboardingStepsViewController else {
            return UIViewController()
        }
        
        viewController.item = items[index]
        return viewController
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = contentViewController.firstIndex(of: viewController)
        if index == 0 {
            return nil
        }
        return contentViewController[index! + 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.firstIndex(of: viewController)
        if index == contentViewController.count - 1 {
            return nil
        }
        return contentViewController[index! + 1]
    }
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        
        guard let index = contentViewController.firstIndex(of: viewControllers!.first!) else {
            return
        }
        
        pageControl?.currentPage = index
    }
}

