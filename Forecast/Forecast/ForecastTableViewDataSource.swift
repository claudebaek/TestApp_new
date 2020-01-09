//
//  ForecastTableViewDataSource.swift
//  Forecast
//
//  Created by 백두산(DooSan Baek) on 05/08/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class ForecastTableViewDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: C.ID.DailyTableViewCell, for: indexPath) as! DailyTableViewCell
        cell.dayLabel.text = "day"
        return cell
    }
    
}

class ForecastPageViewDataSource : NSObject, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: C.ID.ForecastViewController)
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: C.ID.ForecastViewController)
        return vc
    }
}
