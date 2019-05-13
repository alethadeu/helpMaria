//
//  ServiceDetailCollectionViewCell.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 12/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class ServiceDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var serviceIconImageView: UIImageView!
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var servicePriceLabel: UILabel!
    
    
    func configCell(service: Service) {
        var image = UIImage(named: "icon_others")
        self.serviceNameLabel.text = service.name
        
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
        
        descriptionLabel.text = service.description
        if let price = service.price, price > 0 {
            servicePriceLabel.text = String(format: "R$ %.2f", price).replacingOccurrences(of: ".", with: ",")
        } else {
            servicePriceLabel.text = "negociável"
        }

    }
}
