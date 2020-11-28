//
//  CustomCView.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import UIKit

@IBDesignable class RoundedView: UIView {
    
    // MARK: - Attributes
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0.0 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 3) {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var roundCornerRadius: CGFloat = 0.0 {
        didSet {
            setup()
        }
    }
    @IBInspectable var roundTopLeftCorner: Bool = false {
        didSet {
            setup()
        }
    }
    @IBInspectable var roundTopRightCorner: Bool = false {
        didSet {
            setup()
        }
    }
    @IBInspectable var roundBottomLeftCorner: Bool = false {
        didSet {
            setup()
        }
    }
    @IBInspectable var roundBottomRightCorner: Bool = false {
        didSet {
            setup()
        }
    }
    
    // MARK: - Setup
    
    func setup() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        
        var corners: UIRectCorner = []
        if roundTopLeftCorner {
            corners.insert(.topLeft)
        }
        if roundTopRightCorner {
            corners.insert(.topRight)
        }
        if roundBottomLeftCorner {
            corners.insert(.bottomLeft)
        }
        if roundBottomRightCorner {
            corners.insert(.bottomRight)
        }
        if !corners.isEmpty {
            roundCorners(corners, radius: roundCornerRadius)
        }
    
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
}
