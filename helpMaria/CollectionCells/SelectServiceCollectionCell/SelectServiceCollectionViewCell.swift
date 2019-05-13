//
//  SelectServiceCollectionViewCell.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 11/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class SelectServiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var closeIcon: UIImageView! {
        didSet {
            closeIcon.changePngColorTo(color: .white)
        }
    }
}
