//
//  RoundedLabel.swift
//  Grumply
//
//  Created by Guy Royse on 11/16/17.
//  Copyright © 2017 Nexosis. All rights reserved.
//

import UIKit

class RoundedLabel: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 0.5 * self.bounds.size.height
    }
}
