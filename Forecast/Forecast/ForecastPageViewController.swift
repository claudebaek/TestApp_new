//
//  ForecastPageViewController.swift
//  Forecast
//
//  Created by 백두산(DooSan Baek) on 05/08/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class ForecastPageViewController: UIPageViewController {
    
    lazy var orderedViewControllers: [UIViewController] = {
        
        return [self.newViewController(C.ID.ForecastViewController),
                self.newViewController(C.ID.ForecastViewController)
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(viewController: initialViewController)
        }
    }
    
    func newViewController(_ order: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(order)")
    }
    
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            
        })
    }
    
}
