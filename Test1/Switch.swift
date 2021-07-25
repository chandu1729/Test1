//
//  Switch.swift
//  Test1
//
//  Created by chandrasekhar yadavally on 7/24/21.
//

import UIKit

class Switch: UIControl {

    var onTintColor = UIColor.systemBlue
    var offTintColor = UIColor.systemGray2
    var cornerRadius: CGFloat = 0.5
    
    var thumbTintColor = UIColor.white
    var thumbCornerRadius: CGFloat = 0.5
    var thumbSize = CGSize.zero
    var iconSize = CGSize.zero
    
    var padding: CGFloat = 1
    
    var isOn = false
    var animationDuration: Double = 0.5
    
    
    private var thumbView = UIView(frame: .zero)
    private var iconView = UIImageView()
    private var onPoint = CGPoint.zero
    private var offPoint = CGPoint.zero
    private var isAnimating = false
    
    private func clearViews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    func setupUI() {
        clearViews()
        clipsToBounds = false
        thumbView.backgroundColor = self.thumbTintColor
        thumbView.isUserInteractionEnabled = false
        
        thumbView.layer.shadowColor = UIColor.black.cgColor
        thumbView.layer.shadowRadius = 1.5
        thumbView.layer.shadowOpacity = 0.9
        thumbView.layer.shadowOffset = CGSize(width: 0.75, height: 2)
        
        addSubview(thumbView)
        addSubview(iconView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        if !isAnimating {
            layer.cornerRadius = bounds.size.height * cornerRadius
            backgroundColor = isOn ? onTintColor : offTintColor
            
            let thumbSize = thumbSize != CGSize.zero ? thumbSize : CGSize(width: bounds.height-8, height: bounds.height-8)
            let iconSize = iconSize != CGSize.zero ? iconSize : CGSize(width: thumbSize.width * 0.75, height: thumbSize.height * 0.75)
            let yPosition = (bounds.size.height - thumbSize.height) / 2
            
            onPoint = CGPoint(x: bounds.size.width - thumbSize.width - padding * 3, y: yPosition)
            offPoint = CGPoint(x: padding * 3, y: yPosition)
            thumbView.frame = CGRect(origin: isOn ? onPoint : offPoint, size: thumbSize)
            thumbView.layer.cornerRadius = thumbSize.height * thumbCornerRadius
            
            iconView.frame = CGRect(origin: isOn ? offPoint : onPoint, size: iconSize)
            iconView.layer.cornerRadius = thumbSize.height * thumbCornerRadius
            iconView.image = UIImage(systemName: "checkmark")
            self.animate()
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
      super.beginTracking(touch, with: event)
      self.animate()
      return true
    }
    
    private func animate() {
       isOn = !self.isOn
       isAnimating = true
       UIView.animate(withDuration: self.animationDuration, delay: 0, usingSpringWithDamping: 0.7,
                      initialSpringVelocity: 0.5, options: [UIView.AnimationOptions.curveEaseOut,
                                                            UIView.AnimationOptions.beginFromCurrentState], animations: {
       self.thumbView.frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x
       self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
       self.iconView.frame.origin.x = self.isOn ? self.offPoint.x : self.onPoint.x
       self.iconView.image = UIImage(systemName: self.isOn ? "checkmark" :"xmark")
       self.iconView.tintColor = .white
      }, completion: { _ in
         self.isAnimating = false
        self.sendActions(for: UIControl.Event.valueChanged)
      })
    }
    
    
}
