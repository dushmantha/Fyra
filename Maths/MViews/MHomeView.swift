//
//  MHomeView.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/26/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import Spring

protocol homeDelegate{
    func getCalculationName(calCulationType : String)
    func clickOnCup()
}

class MHomeView: UIView {
    //#####################----- Set Timer Varible ------- ####################
    var startCount :Float = 0.001
    var startTimer  :NSTimer!
    var endCount :Float = 0.001
    var endTimer  :NSTimer!

    //##################### ------ set delegation varible -----#################
    var delegate : homeDelegate?
    
    //#################### -------- set instance varible ------##################
    var animationView : MAnimationViews = MAnimationViews()
    
    
    //################### --------- set Spring Views ---------###################
    @IBOutlet var plusSpringView: SpringView!
    
    @IBOutlet var minusSpringView: SpringView!
    
    @IBOutlet var multipleSpringView: SpringView!
    
    @IBOutlet var devitedSpringView: SpringView!
    
    //@IBOutlet var cupViewSpringView: SpringView!
    
    @IBOutlet var mainSpringView: SpringView!
    
    //################## ---------- button action methord -----##################
    @IBAction func btnPlus(sender: AnyObject) {
        self.hideView()
        self.delegate?.getCalculationName("+")
        
    }
    
    @IBAction func btnMinus(sender: AnyObject) {
         self.hideView()
         self.delegate?.getCalculationName("-")
        
    }
    
    @IBAction func btnMultiple(sender: AnyObject) {
         self.hideView()
         self.delegate?.getCalculationName("*")
        
    }
    
    @IBAction func btnDivited(sender: AnyObject) {
        self.hideView()
         self.delegate?.getCalculationName("/")

    }
    
    
    @IBAction func btnCup(sender: AnyObject) {
        self.hideView()
        self.delegate?.clickOnCup()
        
    }
    
    
    //############ ----------- Drow View -------- ##########################
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
    
    private func loadNib() -> MHomeView {
        let bundle = NSBundle.mainBundle()
        let hv = bundle.loadNibNamed(self.nibName(), owner: nil, options: nil)[0] as! MHomeView
        hv.frame = UIScreen.mainScreen().bounds
        return hv
    }
    
    internal func nibName() -> String {
        return "MHomeView"
    }
    
    func  initWithData() ->AnyObject{
        
        return self.loadNib();
    }
    
    func showInView (sView :UIView , delegate : homeDelegate){
        self.delegate = delegate
        sView.addSubview(self)
        sView.layoutSubviews()

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // do some task
            
            dispatch_async(dispatch_get_main_queue(), {
                // update some UI
               self.startTimerConfig()
              self.mainSpringView = self.animationView.configAnimationView(self.mainSpringView, animation: "fadeIn", curve: "easeOutSine", delay: 0.0)
            });
        });
    }
   //#######################################################################################################
    
    
    //############ ----------- Show Claculation Views  ------ #############################
    
    func showClaculationViews(){
        self.plusSpringView.hidden = false
        self.minusSpringView.hidden = false
        self.multipleSpringView.hidden = false
        self.devitedSpringView.hidden = false
        //self.cupViewSpringView.hidden = false
    }
    
    //########### ----------- Hide View -------- ##############################
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
    
    //############### -------------- Start Timer ----------###########################################
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
                   self.showClaculationViews()
                    self.plusSpringView = self.animationView.configAnimationView(self.plusSpringView , animation: "slideRight" , curve: "easeOutSine" , delay: 0.0)
                    self.minusSpringView = self.animationView.configAnimationView(self.minusSpringView , animation: "slideLeft" , curve: "easeOutSine", delay: 0.0)
                    self.multipleSpringView = self.animationView.configAnimationView(self.multipleSpringView , animation: "slideRight" , curve: "easeOutSine", delay: 0.0)
                    self.devitedSpringView = self.animationView.configAnimationView(self.devitedSpringView , animation: "slideLeft" , curve: "easeOutSine", delay: 0.0)
                    //self.cupViewSpringView = self.animationView.configAnimationView(self.cupViewSpringView , animation: "slideUp" , curve: "easeOutSine", delay: 0.0)
                });
            });
        }
    }
    
    
    //################## ---------- End Timer ------ ###########################################
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
