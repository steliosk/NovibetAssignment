//
//  UIView+AppAdditions.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import UIKit

extension UIView {
    
    // MARK: - Rounded corners
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
