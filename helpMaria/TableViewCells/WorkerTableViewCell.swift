//
//  WorkerTableViewCell.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class WorkerTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var workerName: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var favIconImageView: UIImageView!
    
    @IBOutlet weak var otherIconImageView: UIImageView!
    @IBOutlet weak var paintIconImageView: UIImageView!
    @IBOutlet weak var hydraulicIconImageView: UIImageView!
    @IBOutlet weak var showerIconImageView: UIImageView!
    @IBOutlet weak var televisionIconImageView: UIImageView!
    @IBOutlet weak var eletricIconImageView: UIImageView!
    @IBOutlet weak var furnitureIconImageView: UIImageView!
    @IBOutlet var servicesIcons: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favouriteAction(_ sender: Any) {
        favIconImageView.isHighlighted = !favIconImageView.isHighlighted
    }
    
    func configCell(worker: Worker) {
        workerName.text = worker.name
        ratingLabel.text = "\(worker.rate ?? 0.0) "
        
        self.defaultIconStyle()
        for serviceType in worker.services {
            if serviceType == .shower {
                showerIconImageView.alpha = 1
            }
            
            if serviceType == .hydraulic {
                hydraulicIconImageView.alpha = 1
            }
            
            if serviceType == .eletric {
                eletricIconImageView.alpha = 1
            }
            
            if serviceType == .furniture {
                furnitureIconImageView.alpha = 1
            }
            
            if serviceType == .paint {
                paintIconImageView.alpha = 1
            }
            
            if serviceType == .television {
                televisionIconImageView.alpha = 1
            }
            
            if serviceType == .others {
                otherIconImageView.alpha = 1
            }
        }
    }
    
    func defaultIconStyle() {
        for icon in servicesIcons {
            icon.changePngColorTo(color: UIColor.black)
            icon.alpha = 0.15
        }
    }
    
}
