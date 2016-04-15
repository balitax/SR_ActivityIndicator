//
//  SR_ActivityIndicator.swift
//  SR_Activity_Indicator
//
//  Created by Saroj on 4/7/16.
//  Copyright © 2016 Saroj. All rights reserved.
//

import UIKit


@IBDesignable

class SR_ActivityIndicator: UIView {
    
    enum SpinnerStyle : Int{
        case None = 0
        case Light = 1
        case Dark = 2
    }
    
    var Style : SpinnerStyle = .None
    
    @IBInspectable var hidesWhenStopped : Bool = false
    @IBInspectable var outerFillColor : UIColor = UIColor.clearColor()
    @IBInspectable var outerStrokeColor : UIColor = UIColor.grayColor()
    @IBInspectable var outerLineWidth : CGFloat = 5.0
    @IBInspectable var outerEndStroke : CGFloat = 1.0
    @IBInspectable var outerAnimationDuration : CGFloat = 2.0
    @IBInspectable var enableInnerLayer : Bool = true
    @IBInspectable var innerFillColor : UIColor  = UIColor.clearColor()
    @IBInspectable var innerStrokeColor : UIColor = UIColor(red: 208/255, green: 154/255, blue: 35/255, alpha: 1)
    @IBInspectable var centerImageSize: CGFloat = 50
    @IBInspectable var centerImage: UIImage? = UIImage(named: "background-image-967820_960_720.jpg")
    @IBInspectable var innerLineWidth : CGFloat = 5.0
    @IBInspectable var innerEndStroke : CGFloat = 0.5
    @IBInspectable var innerAnimationDuration : CGFloat = 1.0
    
    
    
    var currentInnerRotation : CGFloat = 0
    var currentOuterRotation : CGFloat = 0
    
    var innerView : UIView = UIView()
    var outerView : UIView = UIView()
    var centerView : UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.commonInit()
    }
    
    func commonInit(){
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        
        self.addSubview(outerView)
        outerView.frame = CGRectMake(0 , 0, rect.size.width, rect.size.height)
        outerView.center = self.convertPoint(self.center, fromCoordinateSpace: self.superview!)
        
        let outerLayer = CAShapeLayer()
        outerLayer.path = UIBezierPath(ovalInRect: outerView.bounds).CGPath
        outerLayer.lineWidth = outerLineWidth
        outerLayer.strokeStart = 0.0
        outerLayer.strokeEnd = outerEndStroke
        outerLayer.lineCap = kCALineCapRound
        outerLayer.fillColor = outerFillColor.CGColor
        outerLayer.strokeColor = outerStrokeColor.CGColor
        outerView.layer.addSublayer(outerLayer)
        
        self.addSubview(centerView)
        centerView.frame = CGRectMake(0, 0, centerImageSize, centerImageSize)
        centerView.layer.cornerRadius = centerView.frame.width / 2
        centerView.clipsToBounds = true
        centerView.center = self.convertPoint(self.center, fromCoordinateSpace: self.superview!)
        centerView.image = centerImage
        
        
        if enableInnerLayer{
            
            self.addSubview(innerView)
            innerView.frame = CGRectMake(0 , 0, rect.size.width , rect.size.height)
            innerView.center =  self.convertPoint(self.center, fromCoordinateSpace: self.superview!)
            let innerLayer = CAShapeLayer()
            innerLayer.path = UIBezierPath(ovalInRect: innerView.bounds).CGPath
            innerLayer.lineWidth = innerLineWidth
            innerLayer.strokeStart = 0
            innerLayer.strokeEnd = innerEndStroke
            innerLayer.lineCap = kCALineCapRound
            innerLayer.fillColor = innerFillColor.CGColor
            innerLayer.strokeColor = innerStrokeColor.CGColor
            
            innerView.layer.addSublayer(innerLayer)
        }
        self.startAnimating()
    }
    
    func animateInnerRing(){
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0 * CGFloat(M_PI/180)
        rotationAnimation.toValue = 360 * CGFloat(M_PI/180)
        rotationAnimation.duration = Double(innerAnimationDuration)
        rotationAnimation.repeatCount = HUGE
        self.innerView.layer.addAnimation(rotationAnimation, forKey: "rotateInner")
    }
    
    func startAnimating(){
        
        self.hidden = false
        self.animateInnerRing()
    }
    
    func stopAnimating(){
        if hidesWhenStopped{
            self.hidden = true
        }
        self.outerView.layer.removeAllAnimations()
        self.innerView.layer.removeAllAnimations()
        
    }
}
