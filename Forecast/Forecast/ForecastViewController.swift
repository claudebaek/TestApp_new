//
//  ForecastViewController.swift
//  Forecast
//
//  Created by 백두산(DooSan Baek) on 05/08/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    @IBOutlet var headerView: UIView!
    @IBOutlet var dataSource: ForecastTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ForecastViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return 300
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return headerView.frame.height
//
//    }
}
