//
//  ScrollViewController.swift
//  TestApp
//
//  Created by 백두산(DooSan Baek) on 29/07/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset.right = 100
        tableView.contentInset.left = 200
        tableView.contentInset.bottom = 200
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

    }

}


extension ScrollViewController: UITableViewDelegate {
    
}

extension ScrollViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
