//
//  Extension.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addBorder(width: CGFloat, radius: CGFloat, color: UIColor) {
        layer.cornerRadius = radius
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func addShadow() {
        addShadow(radius: 1.5, width: 1.5, height: 1.5, opacity: 0.2)
    }
    
    func addBorder(color: UIColor = .clear) {
        addBorder(width: 1, radius: 5, color: color)
    }
    
    func addShadow(radius: CGFloat, width: CGFloat, height: CGFloat, opacity: Float ) {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: width, height: height);
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UICollectionViewCell {
    
    func addBorderOnCell(color: UIColor = .clear) {
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = color.cgColor
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
    }
    
    func addShadowOnCell(color: UIColor = UIColor.groupTableViewBackground) {
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1.5, height: 1.5);
        layer.shadowRadius = 1.5
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
        
    }
}

extension UIColor {
    struct orange {
        static let sunset = UIColor(red:0.97, green:0.69, blue:0.58, alpha:1.0)
    }
}
extension UIImageView {
    func changePngColorTo(color: UIColor){
        guard let image =  self.image else {return}
        self.image = image.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
}
}
