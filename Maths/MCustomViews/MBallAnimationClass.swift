//
//  MBallAnimationClass.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/19/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import Spring

class MBallAnimationClass: NSObject {
    var selectedRow: Int = 0
    var selectedEasing: Int = 0
    
    var selectedForce: CGFloat = 2.4
    var selectedDuration: CGFloat = 2.5
    var selectedDelay: CGFloat = 0
    
    var selectedDamping: CGFloat = 0.7
    var selectedVelocity: CGFloat = 1.0
    
    var selectedScale: CGFloat = 1
    var selectedX: CGFloat = 0.5
    var selectedY: CGFloat = 0.5
    
    var selectedRotate: CGFloat = 0
    var isBall = true
    
    var ballViewNo: SpringView!
    
    // MARK :- Ball Animation Configuration.
    
    // First Ball Animation.
    func configBallAnimationHide(ballView : SpringView)->SpringView{
        
        self.ballSizeConfigarationFirstHide()
        
        ballViewNo = animateView("fadeOut", ballView: ballView)
        
        ballViewNo = changeBall(ballView)
        return ballViewNo
    }
    
    func configBallAnimationView(ballView : SpringView)->SpringView{
        
        self.ballSizeConfigarationFisrtView()
        
        ballViewNo = animateView("zoomIn", ballView: ballView)
        
        ballViewNo = changeBall(ballView)
        return ballViewNo
    }

    
    
    func configBallNumberOneView(ballView : SpringView)->SpringView{
        
        self.ballSizeConfigaration()
      
        ballViewNo = animateView("flipY", ballView: ballView)
        
        ballViewNo = changeBall(ballView)
        return ballViewNo
    }
    
    
    func canfingBallNumberOneHide(ballView : SpringView)->SpringView{
        self.ballSizeConfigaration()
        
        ballViewNo = animateView("flipY", ballView: ballView)
        
        ballViewNo = changeBall(ballView)
        return ballViewNo
    }
    
    // Second Ball Animation.
    func configBallNumberTwoView(ballView : SpringView)->SpringView{
        self.ballSizeConfigaration()
        
        ballViewNo = animateView("flipY", ballView: ballView)
        
        ballViewNo = changeBall(ballView)
        return ballViewNo
    }
    
    
    func canfingBallNumberTwoHide(ballView : SpringView)->SpringView{
        self.ballSizeConfigaration()
        
        ballViewNo = animateView("shake", ballView: ballView)
        
        ballViewNo = changeBall(ballView)
        return ballViewNo
    }
    
    // Third Ball Animation.
    
    func configBallNumberThreeView(ballView : SpringView)->SpringView{
        self.ballSizeConfigaration()
        
        ballViewNo = animateView("pop", ballView: ballView)
        
        ballViewNo = changeBall(ballView)
        return ballViewNo
    }
    
    
    func canfingBallNumberThreeHide(ballView : SpringView)->SpringView{
        self.ballSizeConfigaration()
        
        ballViewNo = animateView("slideLeft", ballView: ballView)
        
        ballViewNo = changeBall(ballView)
        return ballViewNo
    }
    func ballSizeConfigarationFirstHide(){
        selectedForce = 1.0 as CGFloat
        selectedDuration = 0.1 as CGFloat
        selectedDelay = 0.0 as CGFloat
        
        selectedDamping = 0.0 as CGFloat
        selectedVelocity = 1.0as CGFloat
        selectedRotate = 0.0 as CGFloat
        
        selectedX = 0.0 as CGFloat
        selectedY = 0.0 as CGFloat
        selectedScale = 0.01 as CGFloat
    }
    
    func ballSizeConfigarationFisrtView(){
        selectedForce = 2.4 as CGFloat
        selectedDuration = 0.5 as CGFloat
        selectedDelay = 0.5 as CGFloat
        
        selectedDamping = 0.7 as CGFloat
        selectedVelocity = 0.0as CGFloat
        selectedRotate = 0.0 as CGFloat
        
        selectedX = 0.0 as CGFloat
        selectedY = 0.0 as CGFloat
        selectedScale = 0.0 as CGFloat
    }
    
    func ballSizeConfigaration(){
        selectedForce = 2.0 as CGFloat
        selectedDuration = 1.5 as CGFloat
        selectedDelay = 0.0 as CGFloat
        
        selectedDamping = 0.7 as CGFloat
        selectedVelocity = 0.0as CGFloat
        selectedRotate = 0.0 as CGFloat
        
        selectedX = 0.0 as CGFloat
        selectedY = 0.0 as CGFloat
        selectedScale = 0.2 as CGFloat
    }
    
    // MARK :- Ball Animation.
    func animateView(animation : String , ballView : SpringView)->SpringView{
        setOptions(animation, ballView: ballView)
        ballView.animate()
        return ballView
    }
    
    func setOptions(animation : String , ballView : SpringView)->SpringView{
        ballView.force = selectedForce
        ballView.duration = selectedDuration
        ballView.delay = selectedDelay
        
        ballView.damping = selectedDamping
        ballView.velocity = selectedVelocity
        ballView.scaleX = selectedScale
        ballView.scaleY = selectedScale
        ballView.x = selectedX
        ballView.y = selectedY
        ballView.rotate = selectedRotate
        
        ballView.animation = animation
        ballView.curve = "easeInOutCubic"
        return ballView
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
    
    
    
    
    func changeBall(ballView : SpringView)->SpringView {
        isBall == true
        let animation = CABasicAnimation()
        let halfWidth = ballView.frame.width / 2
        let cornerRadius: CGFloat = isBall ? halfWidth : 10
        animation.keyPath = "cornerRadius"
        animation.fromValue = isBall ? 10 : halfWidth
        animation.toValue = cornerRadius
        animation.duration = 0.2
        ballView.layer.cornerRadius = cornerRadius
        ballView.layer.addAnimation(animation, forKey: "radius")
        return ballView
    }
}
