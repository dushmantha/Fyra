//
//  MMarksLoadView.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/26/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import GameKit
protocol marksLoadDelegate{
    func getMarksWithFace(marks : String)
    func gameRetry()
    func loadLeaderBord(marks : Int , gameType : String , calculationType : String)
    
}

class MMarksLoadView: UIView {
    //===================== Point View =========================
    @IBOutlet var pointView: MPointView!
    
    //===================== Image View ========================
    @IBOutlet var imgProfileView: UIImageView!
    @IBOutlet var imgTime: UIImageView!
    @IBOutlet var imgScore: UIImageView!
    @IBOutlet var imgLife: UIImageView!
    
    //====================Lable =============================
    @IBOutlet var lblLife: UILabel!
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblScoreValue: UILabel!
    @IBOutlet var lblNeedPointValue: UILabel!
    //=================== Button ============================
    @IBOutlet var btnRefreshButton: UIButton!
    
    //================== Delegate Property ====================
     var delegate : marksLoadDelegate?
    @IBAction func btnRefreshButton(sender: AnyObject) {
        self.hideView()
      self.delegate?.gameRetry()
        
    }
    
    @IBAction func btnHome(sender: AnyObject) {
        self.hideView()
        self.delegate?.getMarksWithFace("marks")

    }
    
    
    //================== Spring View =========================
    @IBOutlet var hudSpringView: SpringView!
    @IBOutlet var bottomSpringView: SpringView!
    @IBOutlet var mainSpringView: SpringView!
    @IBOutlet var topSpringView: SpringView!
    @IBOutlet var lifeSpringView: SpringView!
    @IBOutlet var timeSpringView: SpringView!
    @IBOutlet var scoreSpringView: SpringView!
    
   //================== Varible ============================
    var time : Int = 0
    var score : Int = 0
    var life : Int = 0
    var gameType : String?
    var calculationType : String?

    //=============== Timer Property ========================
    var startCount :Float = 0.001
    var startTimer  :NSTimer!
    var endCount :Float = 0.001
    var endTimer  :NSTimer!
    var count :Float = 0.001
    var timer  :NSTimer!
    var prograssValue : Float = 0.0;

    //============= Class Instance =========================
    var animationView : MAnimationViews = MAnimationViews()
    var accessDB : MCoreDataAccess = MCoreDataAccess()
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    //=================== Drow Play Game View =============
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required internal init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func loadNib() -> MMarksLoadView {
        let bundle = NSBundle.mainBundle()
        let hv = bundle.loadNibNamed(self.nibName(), owner: nil, options: nil)[0] as! MMarksLoadView
        hv.frame = UIScreen.mainScreen().bounds
        return hv
    }
    
    internal func nibName() -> String {
        return "MMarksLoadView"
    }
    
    func  initWithData() ->AnyObject{
        
        return self.loadNib();
    }

    //============== Score Card Configuration ================
    func scoreCardConfig(){
        if(time < 60 && score < 10 && life == 0){
            imgProfileView.image = UIImage(named: "icons-53")
            imgLife.image = UIImage(named: "")
            lblLife.textColor = UIColor.grayColor()
            imgScore.image = UIImage(named: "")
            lblScore.textColor = UIColor.grayColor()
            imgTime.image = UIImage(named: "")
            lblTime.textColor = UIColor.grayColor()
            lblScoreValue.text = String(score)
            if(gameType == "junior"){
                self.scoreSpringView.hidden = false
            }
            else{
            self.scoreSpringView.hidden = false
            self.timeSpringView.hidden = false
            self.lifeSpringView.hidden = false
            }
        }
        else{
            if(gameType == "junior"){
                imgProfileView.image = UIImage(named: "junior_pic")
                if(score < 10){
                    imgScore.image = UIImage(named: "")
                    lblScore.textColor = UIColor.grayColor()
                }
                self.scoreSpringView.hidden = false
                 self.scoreSpringView = self.animationView.configAnimationView(self.scoreSpringView , animation: "pop" , curve: "easeOutSine", delay: 0.0)
                lblScoreValue.text = String(score)
                prograssValue = Float(score)/20
            }
                
            else if(gameType == "teen"){
                imgProfileView.image = UIImage(named: "teen_pic")
                if(time < 60){
                    imgTime.image = UIImage(named: "")
                    lblTime.textColor = UIColor.grayColor()
                }
                if(score < 10){
                    imgScore.image = UIImage(named: "")
                    lblScore.textColor = UIColor.grayColor()
                }
                if(life < 3){
                    imgLife.image = UIImage(named: "")
                    lblLife.textColor = UIColor.grayColor()
                }
                var lifeFloat : Float = Float(life) + 0.1;
                var scoreFloat : Float = Float(score) + 0.1
                prograssValue  = Float((lifeFloat/4 + scoreFloat/50 + Float(time)/60)/3)
                self.scoreSpringView.hidden = false
                self.timeSpringView.hidden = false
                self.lifeSpringView.hidden = false
                self.scoreSpringView = self.animationView.configAnimationView(self.scoreSpringView , animation: "pop" , curve: "easeOutSine", delay: 0.0)
                 self.timeSpringView = self.animationView.configAnimationView(self.timeSpringView , animation: "pop" , curve: "easeOutSine", delay: 0.0)
                 self.lifeSpringView = self.animationView.configAnimationView(self.lifeSpringView , animation: "pop" , curve: "easeOutSine", delay: 0.0)
                lblScoreValue.text = String(score)
            }
                
            else{
                imgProfileView.image = UIImage(named: "senior_pic")
                if(time < 60){
                    imgTime.image = UIImage(named: "")
                    lblTime.textColor = UIColor.grayColor()
                }
                
                if(score < 100){
                    imgScore.image = UIImage(named: "")
                    lblScore.textColor = UIColor.grayColor()
                }
                if(life < 3){
                    imgLife.image = UIImage(named: "")
                    lblLife.textColor = UIColor.grayColor()
                }
                var lifeFloat : Float = Float(life) + 0.1;
                var scoreFloat : Float = Float(score) + 0.1
                prograssValue  = Float((lifeFloat/4 + scoreFloat/500 + Float(time)/60)/3)
                self.scoreSpringView.hidden = false
                self.timeSpringView.hidden = false
                self.lifeSpringView.hidden = false
                self.scoreSpringView = self.animationView.configAnimationView(self.scoreSpringView , animation: "pop" , curve: "easeOutSine", delay: 0.0)
                self.timeSpringView = self.animationView.configAnimationView(self.timeSpringView , animation: "pop" , curve: "easeOutSine", delay: 0.0)
                self.lifeSpringView = self.animationView.configAnimationView(self.lifeSpringView , animation: "pop" , curve: "easeOutSine", delay: 0.0)
                lblScoreValue.text = String(score)
            }
        }

        var arnPoints = Double(prograssValue)
        var jemsCount : Int = 0
        if((arnPoints > 0.6)&&(arnPoints < 0.8)){
            jemsCount = 1
        }
        else if(arnPoints > 0.8){
            jemsCount = 2
        }
      var isHightScore =  accessDB.insertAppDataFromGame(self.calculationType!, gameStage: "notstSage", gameType: gameType!, highScore: score, jems: jemsCount , points: arnPoints*10, profileName: "tharaka")
        self.startTimerLoadFace()
        
        var pointsStr = NSString(format: "%.1f", arnPoints*10) as String
        self.lblNeedPointValue.text = "You won \(pointsStr)  Points and \(jemsCount) Jems"
       
        if(isHightScore){
         self.delegate?.loadLeaderBord(score, gameType: gameType!, calculationType: calculationType!)
        }
    }
    
    
    //MARK:- Timer Configuration.
    //=============================Timer Starting.==============================
    func startTimerLoadFace(){
        self.pointView.layer.cornerRadius = 10.0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector ("update"), userInfo: nil, repeats: true)
    }
    
    //Update Timer.
    func update(){
        if(count < 1)
        {
            count = count + 0.001
            //var doble = Double(count)
            var floatValue = CGFloat(count)
            pointView.fraction = floatValue
            pointView.setNeedsDisplay()
            
        }
        
        if(count >= prograssValue){
            self.timer.invalidate()
            println("print over")
        }
    }
    
    
    //================= Show Game View ====================================
    func showInView (sView :UIView , delegate : marksLoadDelegate){       
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
    
    //================ Show Hidden View ===================================
    func showGameTypeView(){
        self.hudSpringView.hidden = false
        self.scoreCardConfig()
    }
    
    
    
    
    //============== View Hidden ==========================================
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
    
    //================= Set Timer Configuration ===============================
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
                    self.hudSpringView = self.animationView.configAnimationView(self.hudSpringView , animation: "fadeIn" , curve: "easeOutSine", delay: 0.0)
                });
            });
        }
    }
    
    
    //================== End Timer =====================================
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
