//
//  MGamePuasedView.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/26/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
protocol gamePuasedDelegate{
    func hideViewWithMoveType(moveType : String)
}

class MGamePuasedView: UIView {
//================ Button Configuration ============================
    @IBOutlet var btnResume: UIButton!
    @IBOutlet var btnQuite: UIButton!
    @IBOutlet var btnRetry: UIButton!
//================Spring View Configuration =========================
    @IBOutlet var hudSpringView: SpringView!
    @IBOutlet var bottomSpringView: SpringView!
    @IBOutlet var mainSpringView: SpringView!
    @IBOutlet var retrySpringView: SpringView!
    @IBOutlet var quiteSpringView: SpringView!
    @IBOutlet var resumeSpringView: SpringView!
//================== Start Timer ================================
    var startCount :Float = 0.001
    var startTimer  :NSTimer!
    var endCount :Float = 0.001
    var endTimer  :NSTimer!
    
//================== Class Intance ============================
    var animationView : MAnimationViews = MAnimationViews()
  
//================= Button Action =============================
    @IBAction func btnResume(sender: AnyObject) {
        self.hideView()
        self.delegate?.hideViewWithMoveType("resume")

    }
    @IBAction func btnRetry(sender: AnyObject) {
        self.hideView()
        self.delegate?.hideViewWithMoveType("retry")
        
    }
    @IBAction func btnQuite(sender: AnyObject) {
        self.hideView()
        self.delegate?.hideViewWithMoveType("quite")
        
    }
   
//================= Delegate property ==========================
    var delegate : gamePuasedDelegate?
    
//================ Drow View=================================
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
    
    private func loadNib() -> MGamePuasedView {
        let bundle = NSBundle.mainBundle()
        let hv = bundle.loadNibNamed(self.nibName(), owner: nil, options: nil)[0] as! MGamePuasedView
        hv.frame = UIScreen.mainScreen().bounds
        return hv
    }
    
    internal func nibName() -> String {
        return "MGamePuasedView"
    }
    
    func  initWithData() ->AnyObject{
        
        return self.loadNib();
    }

    //================== Show View ==============================
    func showInView (sView :UIView , delegate : gamePuasedDelegate){
        self.delegate = delegate
        sView.addSubview(self)
        sView.layoutSubviews()
         self.startTimerConfig()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // do some task
           
            dispatch_async(dispatch_get_main_queue(), {
                // update some UI
                self.mainSpringView = self.animationView.configAnimationView(self.mainSpringView , animation: "zoomIn" , curve: "easeIn", delay: 0.0)
            });
        });
    }
//================ Show Game Hidden Types =====================
    func showGameTypeView(){
        self.hudSpringView.hidden = false
        self.bottomSpringView.hidden = false
    }
    
//=============== Hide View ==================================
func hideView(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // do some task
            
            dispatch_async(dispatch_get_main_queue(), {
                self.endTimerConfig()
                // update some UI
                self.hudSpringView = self.animationView.configAnimationView(self.hudSpringView , animation: "zoomOut" , curve: "easeOut", delay: 0.0)
            });
        });
    }
    
//============== Start Timer ====================================
    func startTimerConfig(){
        startTimer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector ("startTimerConfigUpdate"), userInfo: nil, repeats: true)
    }
    
    //Update Timer.
    func startTimerConfigUpdate(){
        if(startCount < 0.5){
            startCount = startCount + 0.001
        }
        
       else if(startCount >= 0.5){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                // do some task
                self.startTimer.invalidate()
                println("print over")
                dispatch_async(dispatch_get_main_queue(), {
                    // update some UI
                    self.showGameTypeView()
                    self.hudSpringView = self.animationView.configAnimationView(self.hudSpringView , animation: "zoomIn" , curve: "easeIn", delay: 0.0)
                });
            });
        }
    }
    
//============== End Timer =========================
    
    func endTimerConfig(){
        endTimer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector ("endTimerConfigUpdate"), userInfo: nil, repeats: true)
        
    }
    
    
    //Update Timer.
    func endTimerConfigUpdate(){
        if(endCount < 0.5){
            endCount = endCount + 0.001
        }
       else if(endCount >= 0.5){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                // do some task
                self.endTimer.invalidate()
                println("print over")
                dispatch_async(dispatch_get_main_queue(), {
                    // update some UI
                     self.mainSpringView = self.animationView.configAnimationView(self.mainSpringView , animation: "zoomOut" , curve: "easeOut", delay: 0.0)
                    self.removeFromSuperview()
                });
            });
        }
    }
}


