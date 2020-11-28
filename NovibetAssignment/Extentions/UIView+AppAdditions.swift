//
//  UIView+AppAdditions.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import UIKit

extension UIView {
    
    // MARK: - Convenience methods
    
    func removeSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
    
    // MARK: - Rounded corners
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    // MARK: - Shadow
    
    func addShadow(color: UIColor, offset: CGSize, radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = 1.0
    }
    
}
