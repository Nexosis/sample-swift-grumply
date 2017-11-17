//
//  RoundedButton.swift
//  Grumply
//
//  Created by Guy Royse on 11/16/17.
//  Copyright © 2017 Nexosis. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 0.5 * self.bounds.size.height
    }
}
