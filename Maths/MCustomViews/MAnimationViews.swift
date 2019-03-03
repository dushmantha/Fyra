//
//  MAnimationViews.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/26/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import Spring
class MAnimationViews: NSObject {
    var selectedRow: Int = 0
    var selectedEasing: Int = 0
    
    var selectedForce: CGFloat = 2.4
    var selectedDuration: CGFloat = 1.0
    var selectedDelay: CGFloat = 0
    
    var selectedDamping: CGFloat = 0.7
    var selectedVelocity: CGFloat = 1.0
    
    var selectedScale: CGFloat = 0.1
    var selectedX: CGFloat = 0.5
    var selectedY: CGFloat = 0.5
    
    var selectedRotate: CGFloat = 0
    var isBall = false
    var animateSpringView: SpringView!
    
    // MARK :- Ball Animation Configuration.
    
    // First Ball Animation.

    
    
    
    func configAnimationView(animationView : SpringView , animation : String , curve : String , delay : CGFloat)->SpringView{
        animateSpringView = animateView(animationView, animation: animation, curve: curve , delay: delay)
        
       // animateSpringView = changeBall(animationView)
        return animateSpringView
    }
    
    
    


    // MARK :- Ball Animation.
    func animateView( animationView : SpringView ,  animation : String , curve : String , delay : CGFloat)->SpringView{
        setOptions(animationView, animation: animation, curve: curve , delay: delay)
        animationView.animate()
        return animationView
    }
    
    func setOptions(animateView : SpringView , animation : String , curve : String , delay : CGFloat)->SpringView{
        animateView.force = selectedForce
        animateView.duration = selectedDuration
        animateView.delay = delay
        
        animateView.damping = selectedDamping
        animateView.velocity = selectedVelocity
        animateView.scaleX = selectedScale
        animateView.scaleY = selectedScale
        animateView.x = selectedX
        animateView.y = selectedY
        animateView.rotate = selectedRotate
        
        animateView.animation = animation
        animateView.curve = curve
        return animateView
    }
    
    var data = [[
        "shake",
        "pop",
        "morph",
        "squeeze",
        "wobble",
        "swing",
        "flipX",
        "flipY",
        "fall",
        "squeezeLeft",
        "squeezeRight",
        "squeezeDown",
        "squeezeUp",
        "slideLeft",
        "slideRight",
        "slideDown",
        "slideUp",
        "fadeIn",
        "fadeOut",
        "fadeInLeft",
        "fadeInRight",
        "fadeInDown",
        "fadeInUp",
        "zoomIn",
        "zoomOut",
        "flash",
        ], ["spring", "linear", "easeIn", "easeOut", "easeInOut","easeInSine","easeOutSine","easeInOutSine","easeInQuad","easeOutQuad","easeInOutQuad","easeInCubic","easeOutCubic","easeInOutCubic","easeInQuart","easeOutQuart","easeInOutQuart","easeInQuint","easeOutQuint","easeInOutQuint","easeInExpo","easeOutExpo","easeInOutExpo","easeInCirc","easeOutCirc","easeInOutCirc","easeInBack","easeOutBack","easeInOutBack"]]
    
    
    
    
//    func changeBall(animationView : SpringView)->SpringView {
//        isBall == false
//        let animation = CABasicAnimation()
//        let halfWidth = animationView.frame.width / 2
//        let cornerRadius: CGFloat = isBall ? halfWidth : 10
//        animation.keyPath = "cornerRadius"
//        animation.fromValue = isBall ? 10 : halfWidth
//        animation.toValue = cornerRadius
//        animation.duration = 0.2
//        animationView.layer.cornerRadius = cornerRadius
//        animationView.layer.addAnimation(animation, forKey: "radius")
//        return animationView
//    }
}
