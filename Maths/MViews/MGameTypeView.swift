//
//  MGameTypeView.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/26/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import Spring

protocol gameTypeDelegate{
    func getGameType (gameType : String)
}
class MGameTypeView: UIView {

    //######### ---------- Timer Varialble --------################
    var startCount :Float = 0.001
    var startTimer  :NSTimer!
    var endCount :Float = 0.001
    var endTimer  :NSTimer!
    
    //######### --------- Animation View Instance --- ###########
    var animationView : MAnimationViews = MAnimationViews()
    
    //######## ---------- Delegate property ------###############
    var delegate : gameTypeDelegate?
    
    //######## ---------- Spring View ---------##################
    @IBOutlet var mainSpringView: SpringView!
    @IBOutlet var hudSpringView: SpringView!
    

    @IBAction func btnJunior(sender: AnyObject) {
        self.hideView()
        self.delegate?.getGameType("junior")
        
    }
    @IBAction func btnBack(sender: AnyObject) {
        
        self.hideView()
        self.delegate?.getGameType("home")
    }

    @IBAction func btnTeen(sender: AnyObject) {
        self.hideView()
        self.delegate?.getGameType("teen")
        
    }
    
    @IBAction func btnSenior(sender: AnyObject) {
        self.hideView()
        self.delegate?.getGameType("senior")

    }
    
    //####### ------------ Drow Game Type -----###############
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required internal init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func loadNib() -> MGameTypeView {
        let bundle = NSBundle.mainBundle()
        let hv = bundle.loadNibNamed(self.nibName(), owner: nil, options: nil)[0] as! MGameTypeView
        hv.frame = UIScreen.mainScreen().bounds
        return hv
    }
    
    internal func nibName() -> String {
        return "MGameTypeView"
    }
    
    func  initWithData() ->AnyObject{
        
        return self.loadNib();
    }
    
    //######### ------- Show View -------###############################
    func showInView (sView :UIView , delegate : gameTypeDelegate){
        self.delegate = delegate
        sView.addSubview(self)
        sView.layoutSubviews()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // do some task
            dispatch_async(dispatch_get_main_queue(), {
                // update some UI
                self.startTimerConfig()
               self.mainSpringView = self.animationView.configAnimationView(self.mainSpringView , animation: "fadeIn" , curve: "easeOutSine", delay: 0.0)
            });
        });
    }
    
    //########### ---------- Show Hidden View -------###############################
    func showGameTypeView(){
        self.hudSpringView.hidden = false
    }
    
    //#################### ----------- Hide View ------#############################
    func hideView(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // do some task
            
            dispatch_async(dispatch_get_main_queue(), {
                // update some UI
                self.endTimerConfig()
                self.mainSpringView = self.animationView.configAnimationView(self.mainSpringView , animation: "fadeOut" , curve: "easeOutSine", delay: 0.0)
            });
        });
    }
    
    //################### ------------- Start Timer --------###########################
    func startTimerConfig(){
        startTimer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector ("startTimerConfigUpdate"), userInfo: nil, repeats: true)
    }
    
    //Update Timer.
    func startTimerConfigUpdate(){
        if(startCount < 1){
            startCount = startCount + 0.001
        }
        
        if(startCount >= 0.5){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                // do some task
                self.startTimer.invalidate()
                println("print over")
                dispatch_async(dispatch_get_main_queue(), {
                    // update some UI
                    self.showGameTypeView()
                    self.hudSpringView = self.animationView.configAnimationView(self.hudSpringView , animation: "slideUp" , curve: "easeOutSine", delay: 0.0)
                });
            });
        }
    }
    
  
    //####################### ----------- End Timer -------############################
    func endTimerConfig(){
        endTimer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector ("endTimerConfigUpdate"), userInfo: nil, repeats: true)
    }
    
    
    //Update Timer.
    func endTimerConfigUpdate(){
        if(endCount < 1){
            endCount = endCount + 0.001
        }
        
        if(endCount >= 0.5){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                // do some task
                self.endTimer.invalidate()
                println("print over")
                dispatch_async(dispatch_get_main_queue(), {
                    // update some UI
                    self.removeFromSuperview()
                });
            });
        }
    }
}
