//
//  ServiceFilterCollectionViewCell.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 12/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class ServiceFilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var serviceIcon: UIImageView!
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    func select() {
        self.isSelected = true
        self.containerView.backgroundColor = UIColor.pink.sunset
        self.serviceIcon.changePngColorTo(color: .white)
        self.serviceNameLabel.textColor = .white
        self.quantityLabel.textColor = .white
        self.addBorderOnCell()
    }
    
    func deselect() {
        self.isSelected = false
        self.containerView.backgroundColor = .white
        serviceIcon.changePngColorTo(color: UIColor.orange.sunset)
        self.serviceNameLabel.textColor = UIColor.orange.sunset
        self.quantityLabel.textColor = UIColor.orange.sunset
        self.addBorderOnCell(color: UIColor.orange.sunset)
    }
    
    func configCell(service: Service) {
        var image = UIImage(named: "icon_others")
        self.serviceNameLabel.text = service.name
        
        guard let serviceType = service.serviceType else {
            self.serviceIcon.image = image
            self.serviceIcon.changePngColorTo(color: UIColor.orange.sunset)
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
        
        self.serviceIcon.image = image
        self.serviceIcon.changePngColorTo(color: UIColor.orange.sunset)
        
        let mariasForThis = marias.filter { $0.services.contains(serviceType) }
        quantityLabel.text = "\(mariasForThis.count) disponíveis"

    }
    
}
