//
//  DailyTableViewCell.swift
//  Forecast
//
//  Created by 백두산(DooSan Baek) on 05/08/2019.
//  Copyright © 2019 백두산(DooSan Baek). All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
