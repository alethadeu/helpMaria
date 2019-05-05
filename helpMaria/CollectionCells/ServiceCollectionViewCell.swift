//
//  ServiceCollectionViewCell.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var serviceIconImageView: UIImageView!
    @IBOutlet weak var serviceNameLabe: UILabel!
    
    func configCell(service: Service) {
        var image = UIImage(named: "icon_others")
        self.serviceNameLabe.text = service.name
        
        guard let serviceType = service.serviceType else {
            self.serviceIconImageView.image = image
            self.serviceIconImageView.changePngColorTo(color: UIColor.orange.sunset)
            return
        }
        
        
        switch serviceType {
        case .shower:
            image = #imageLiteral(resourceName: "icon_shower")
        case .eletric:
            image = #imageLiteral(resourceName: "icon_lamp")
        case .hydraulic:
            image = #imageLiteral(resourceName: "icon_pipe")
        case .furniture:
            image = #imageLiteral(resourceName: "icon_closet")
        case .paint:
            image = #imageLiteral(resourceName: "icon_paint")
        case .television:
            image = #imageLiteral(resourceName: "icon_television")
        default:
            image = #imageLiteral(resourceName: "icon_others")
        }
        
        self.serviceIconImageView.image = image
        self.serviceIconImageView.changePngColorTo(color: UIColor.orange.sunset)

    }
    
}
