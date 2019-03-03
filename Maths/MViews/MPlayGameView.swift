//
//  MPlayGameView.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/26/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import AudioToolbox

protocol playGameDelegate{
    func getGameresultWithMarks(marks : Int , lifeCout : Int , timeCount : Int)
    func puasedGameResultWithMarks(marks : Int , lifeCout : Int , timeCount : Int)
    func clickBackButton()
}

class MPlayGameView: UIView {
    //------------- Set Timer Attribute -----------------------
    var startCount :Float = 0.001
    var startTimer  :NSTimer!
    var endCount :Float = 0.001
    var endTimer  :NSTimer!
    
    // ----------- Class Instance -----------------------
    var animationView : MAnimationViews = MAnimationViews()
    var ballAnimation :MBallAnimationClass = MBallAnimationClass()
    var randomNumberGen : MGenarateRandomNumber = MGenarateRandomNumber()
    var coreDataScoreCard : MCoreDataAccess = MCoreDataAccess()
    // ---------- Set Delegate --------------------------
    var delegate : playGameDelegate?
    
  
    // -------- Set Bool Value --------------------------
    var isGameOver : Bool = false
    var isClockStartStartValue : Bool = false;
    var isGamePrograssStartValue : Bool = false
    var isGamePuased : Bool = false

    // -------- Attribute ----------------------------------
    var isRightAnswer : Int = 2
    var marks : Int = 0
   // var gameTime : Int = 60
    var countGameLife : Int = 3
    var calculationType : String!
    var gameType : String!
    var quetionCount : Int = 0
    var clockCount :Int = 1
    var clockTimer  :NSTimer!
    var prograssCount :Float = 1
    var prograssTimer  :NSTimer!
    var gameStage : String!
    
    //---------------------------- Set Property ---------------------------
    @IBOutlet var clockView: MGamePlayClockView!
    
    //------------------------- Spring View Attibute --------------------
    @IBOutlet var mainSpringView: SpringView!
    @IBOutlet var puasedSpringView: SpringView!
    @IBOutlet var topBarSpringView: SpringView!
    @IBOutlet var scoreBarSpringView: SpringView!
    @IBOutlet var lifeSpeingView: SpringView!
    
    @IBOutlet var bottonSpringView: SpringView!
    @IBOutlet var lifeOneSpringView: SpringView!
    @IBOutlet var lifeTwoSpringView: SpringView!
    @IBOutlet var lifeThreeSpringView: SpringView!
    
    
    @IBOutlet var clockSpringView: SpringView!
    @IBOutlet var oneSpringView: SpringView!
    @IBOutlet var twoSpringView: SpringView!
    @IBOutlet var threeSpringView: SpringView!
    
    @IBOutlet var pointSpringView: SpringView!

    @IBOutlet var alertSpringView: SpringView!


    
    @IBOutlet var lblGameName: UILabel!
    
    @IBOutlet var imgProfImage: UIImageView!
    //============== Button Action ==================
    @IBAction func btnBack(sender: AnyObject) {
         self.startTimer.invalidate()
         self.hideView()
        delegate?.clickBackButton()
       
    }
    
    @IBOutlet var btnStart: UIButton!
    
    @IBAction func btnStart(sender: AnyObject) {
        self.ballViewsAnimation()
        self.genareteRandomNumber()
        self.hideAlertView()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // do some task
            dispatch_async(dispatch_get_main_queue(), {
                // update some UI
                if(self.gameType == "junior"){
                
                }
                    
                else if(self.gameType == "teen"){
                     self.clockStartTimer()
                }
                    
                else if(self.gameType == "senior"){
                    self.clockStartTimer()
                }
            });
        });
}
    
    func hideAlertView(){
    self.alertSpringView = self.animationView.configAnimationView(self.alertSpringView , animation: "fadeOut" , curve: "easeOutSine", delay: 0.0)
    }
    
    @IBAction func btnWrong(sender: AnyObject) {

        if(isRightAnswer == 0){
          self.addPonterMark()
        }
        else if(isRightAnswer == 2){
        }
        else{
            self.detectWrongAnswer()
        }
        self.ballViewsAnimation()
        self.genareteRandomNumber()
    }
    
    @IBAction func btnRight(sender: AnyObject) {
        if(isRightAnswer == 1){
           self.addPonterMark()
        }
        else if(isRightAnswer == 2){
        }
        else{
            self.detectWrongAnswer()
        }
        self.ballViewsAnimation()
        self.genareteRandomNumber()
    }
    
    @IBAction func btnPuased(sender: AnyObject) {
        isGamePuased = true
       self.gameOver()
    }

    
    //--------------------- Lable View ------------------------------
    @IBOutlet var lblPoints: UILabel!
    @IBOutlet var lblMarks: UILabel!
    @IBOutlet var lblAnswer: UILabel!
    @IBOutlet var lblnumberTwo: UILabel!
    @IBOutlet var lblNumberOne: UILabel!
    
    //------------------- Image View ------------------------------
    @IBOutlet var imgCalculationIcon: UIImageView!
    @IBOutlet var imgLifeThree: UIImageView!
    @IBOutlet var imgLifeTwo: UIImageView!
    @IBOutlet var imgLifeOne: UIImageView!
    @IBOutlet var imgMarksView: UIImageView!
    //----------------- Slider View --------------------------------
    @IBOutlet var prograssSliderView: UISlider!
    
    // --------------------- Set Mark Pointer -------------------
    func addPonterMark(){
        if((prograssCount > 0.8) && (prograssCount < 1)){
            lblPoints.text = "+20"
            self.pointSpringView = self.animationView.configAnimationView(self.pointSpringView , animation: "fadeIn" , curve: "easeOutSine", delay: 0.0)
            marks = marks + 20
            
        }
        else  if((prograssCount > 0.6) && (prograssCount <= 0.8)){
            lblPoints.text = "+10"
            self.pointSpringView = self.animationView.configAnimationView(self.pointSpringView , animation: "fadeIn" , curve: "easeOutSine", delay: 0.0)
            marks = marks + 10
        }
        else  if((prograssCount > 0.4) && (prograssCount <= 0.6)){
            lblPoints.text = "+5"
            self.pointSpringView = self.animationView.configAnimationView(self.pointSpringView , animation: "fadeIn" , curve: "easeOutSine", delay: 0.0)
            marks = marks + 5
        }
        marks = marks + 1
    }
    
    //===================== Start Timer ==========================
    func clockStartTimer(){
        isClockStartStartValue = true
        clockTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector ("ClockUpdate"), userInfo: nil, repeats: true)
    }
    
    func ClockUpdate(){
        if(clockCount < 60)
        {
            clockCount = clockCount + 1
            var floatValue = CGFloat(clockCount)
            clockView.fraction = floatValue
            clockView.setNeedsDisplay()
            
        }
        
        if(clockCount >= 60){
            self.clockTimer.invalidate()
            
            if(isGameOver == false){
                self.gameOver()

            }
            println("print over")
        }
    }

    //==================== Drow Play Game View=====================
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
    
    private func loadNib() -> MPlayGameView {
        let bundle = NSBundle.mainBundle()
        let hv = bundle.loadNibNamed(self.nibName(), owner: nil, options: nil)[0] as! MPlayGameView
        hv.frame = UIScreen.mainScreen().bounds
        return hv
    }
    
    internal func nibName() -> String {
        return "MPlayGameView"
    }
    
    func  initWithData( ) ->AnyObject{

        return self.loadNib()
    }
    
    //======================== Show Game View ==================================
    func showInView (sView :UIView , delegate : playGameDelegate){
        self.delegate = delegate
        sView.addSubview(self)
        sView.layoutSubviews()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // do some task
            dispatch_async(dispatch_get_main_queue(), {
                self.AccessDB()
                // update some UI
                 self.startTimerConfig()
                self.setClaculationTypeArithmaticOperatorForGame()
                self.mainSpringView = self.animationView.configAnimationView(self.mainSpringView , animation: "fadeIn" , curve: "easeOutSine", delay: 0.0)
            });
        });
    }
    
    //==================== Show Play Game Views==============================
    func showPlayGameViews(){
        if(gameType == "junior"){
            self.lblGameName.text = "Junior - Easy"
            self.imgProfImage.image = UIImage(named: "screen-01")
        }
        
        else if(gameType == "teen"){
            self.lblGameName.text = "Teen - Normal"
            self.imgProfImage.image = UIImage(named: "screen-02")
            self.clockSpringView.hidden = false
            self.lifeSpeingView.hidden = false
           
        }
        
        else if(gameType == "senior"){
            self.lblGameName.text = "Senior - Hard"
            self.imgProfImage.image = UIImage(named: "screen-03")
            self.clockSpringView.hidden = false
            self.lifeSpeingView.hidden = false
            self.prograssSliderView.hidden = false
            
        }
    }
    
    func AccessDB(){
        var gameId : String = calculationType! + gameType!
        var getGameMarkResult : NSArray =  coreDataScoreCard.getProfileObjectFrom(gameId)
       
        if(getGameMarkResult.count > 0){
            println(getGameMarkResult)
            var result: AnyObject = getGameMarkResult[0] as AnyObject
            var gameStage: String? = result.valueForKey("gameStage") as? String
            self.gameStage = gameStage
        }
        
        else{
            self.gameStage = "notstSage"
        }
    }
    
    //======================== Hide Views =====================================
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
    
    //================== Start Timer ======================================
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
                    self.showPlayGameViews()
                    self.clockSpringView = self.animationView.configAnimationView(self.clockSpringView , animation: "flash" , curve: "easeOutSine", delay: 0.0)
                    self.checkLifeCount()
                });
            });
        }
    }
    
    
    //=================== End Timer =================================
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

    //MARK:- Set Arithmatic Operator.
    func setClaculationTypeArithmaticOperatorForGame(){
        var arithmaticOperation : MSetArithmaticOperation = MSetArithmaticOperation()
        println(self.calculationType)
        var image : UIImage = arithmaticOperation.setClaculationTypeArithmaticOperatorForGame(self.calculationType!)
        imgCalculationIcon.image = image
        self.configViewColor()
        
        
    }
    
    //===================== Configaration View Color =====================================
    func configViewColor(){
        if(calculationType == "+"){
            self.oneSpringView.backgroundColor = UIColor(red:243/255.0, green:129/255.0, blue:25/255.0, alpha: 1.0)
          self.configGameTypeFromColor()
        }
        if(calculationType == "-"){
            self.oneSpringView.backgroundColor = UIColor(red:124/255.0, green:187/255.0, blue:50/255.0, alpha: 1.0)
            self.configGameTypeFromColor()
        }
        if(calculationType == "*"){
            self.oneSpringView.backgroundColor = UIColor(red:19/255.0, green:130/255.0, blue:87/255.0, alpha: 1.0)
          self.configGameTypeFromColor()
        }
        if(calculationType == "/"){
            self.oneSpringView.backgroundColor = UIColor(red:228/255.0, green:32/255.0, blue:28/255.0, alpha: 1.0)
            self.configGameTypeFromColor()
        }
    }
    
    // ==================== Configaration Game Type From Color ================================
    func configGameTypeFromColor(){
        if(gameType == "junior"){
            self.imgMarksView.image = UIImage(named: "junior_point")
            self.twoSpringView.backgroundColor = UIColor(red:178/255.0, green:37/255.0, blue:35/255.0, alpha: 1.0)
        }
        else if(gameType == "teen"){
            self.imgMarksView.image = UIImage(named: "teen_points")
            self.twoSpringView.backgroundColor = UIColor(red:223/255.0, green:0/255.0, blue:81/255.0, alpha: 1.0)
        }
        else if(gameType == "senior"){
            self.imgMarksView.image = UIImage(named: "senior_points")
            self.twoSpringView.backgroundColor = UIColor(red:123/255.0, green:41/255.0, blue:133/255.0, alpha: 1.0)
        }
    }
    
    //=================== Ball View Animation Configuration =================================
    func ballViewsAnimation(){
        oneSpringView = ballAnimation.configBallNumberOneView(oneSpringView)
        twoSpringView = ballAnimation.configBallNumberTwoView(twoSpringView)
        threeSpringView = ballAnimation.configBallNumberThreeView(threeSpringView)
    }
    
    //===================== Genarate Random Number ====================================
    func genareteRandomNumber(){
        println(self.gameStage)
        var genRandomNumber = randomNumberGen.genareteRandomNumber(calculationType! , gameType: gameType! , gameStage : self.gameStage)
        self.lblNumberOne.text = genRandomNumber.numberOneValue
        self.lblnumberTwo.text = genRandomNumber.numberTwoValue
        self.lblAnswer.text = genRandomNumber.numberThreeValue
        isRightAnswer = genRandomNumber.checkRightAnswer
        self.lblMarks.text = String(marks)
        quetionCount = quetionCount + 1
        if(gameType == "junior"){
            if(quetionCount == 20){
                if(isGameOver == false){
                    self.gameOver()
                }
            }
        }
        else if(gameType == "teen"){
            //  self.clockStartTimer()
        }
        else if(gameType == "senior"){
            if(isGamePrograssStartValue){
                prograssTimer.invalidate()
            }
             prograssCount = 1
            self.prograssStartTimer()
        }
    }
    
    //======================== Prograss Timer Update ===========================
    func prograssStartTimer(){
        isGamePrograssStartValue = true
        prograssTimer = NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: Selector ("prograssUpdate"), userInfo: nil, repeats: true)
    }
    
    func prograssUpdate(){
        
        if(prograssCount > 0.8){
            prograssCount = prograssCount - 0.01
            prograssSliderView.setValue(prograssCount, animated:true)
            prograssSliderView.thumbTintColor = UIColor.greenColor()
            prograssSliderView.minimumTrackTintColor = UIColor.greenColor()

        }
        
      else  if((prograssCount > 0.6) && (prograssCount <= 0.8)){
            prograssCount = prograssCount - 0.01
            prograssSliderView.setValue(prograssCount, animated:true)
            prograssSliderView.thumbTintColor = UIColor.yellowColor()
            prograssSliderView.minimumTrackTintColor = UIColor.yellowColor()
            
        }
        
        else  if((prograssCount > 0.4) && (prograssCount <= 0.6)){
            prograssCount = prograssCount - 0.01
            prograssSliderView.setValue(prograssCount, animated:true)
            prograssSliderView.thumbTintColor = UIColor.brownColor()
            prograssSliderView.minimumTrackTintColor = UIColor.brownColor()
            
        }
        else  if((prograssCount > 0.0) && (prograssCount <= 0.4)){
            prograssCount = prograssCount - 0.01
            prograssSliderView.setValue(prograssCount, animated:true)
            prograssSliderView.thumbTintColor = UIColor.redColor()
            prograssSliderView.minimumTrackTintColor = UIColor.redColor()
            
        }
        else{
            prograssSliderView.setValue(prograssCount, animated:true)
            prograssTimer.invalidate()
            if(isGameOver == false){
                self.gameOver()
                
            }
            println("print over")
        }
    }
    
    func checkLifeCount(){
        if(gameType == "junior"){
        }
        else{
            if(countGameLife == 2){
                imgLifeOne.image = UIImage(named: "inactive_life")
            }
            else if (countGameLife == 1){
                imgLifeOne.image = UIImage(named: "inactive_life")
                imgLifeTwo.image = UIImage(named: "inactive_life")
            }
        }
    }
    
    
    
    //==================== Detecting Wrong Answer ===============================
    func detectWrongAnswer(){
        if(gameType == "junior"){
        }
        else{
        countGameLife = countGameLife - 1
            if(countGameLife == 2){
                imgLifeOne.image = UIImage(named: "inactive_life")
            }
            else if (countGameLife == 1){
                imgLifeTwo.image = UIImage(named: "inactive_life")
            }
            else if (countGameLife == 0){
                imgLifeThree.image = UIImage(named: "inactive_life")

                if(isGameOver == false){
                    self.gameOver()
                }
            }
        }
        //main View Shake.
        var shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        var from_point:CGPoint = CGPointMake(self.center.x - 5, self.center.y)
        var from_value:NSValue = NSValue(CGPoint: from_point)
        var to_point:CGPoint = CGPointMake(self.center.x + 5, self.center.y)
        var to_value:NSValue = NSValue(CGPoint: to_point)
        shake.fromValue = from_value
        shake.toValue = to_value
        self.layer.addAnimation(shake, forKey: "position")
       // AudioServicesPlaySystemSound (1352);
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    //==================== Game Over ==============================
    func gameOver(){
        isGameOver  = true
        if(isGamePrograssStartValue == true){
            prograssTimer.invalidate()
            clockTimer.invalidate()
        }
        if(isClockStartStartValue == true){
        clockTimer.invalidate()
        }
        //self.clockTimer = nil
        //self.prograssTimer = nil
        self.hideView()
        if(isGamePuased){
        self.delegate?.puasedGameResultWithMarks(marks, lifeCout: countGameLife, timeCount: clockCount)
        }
        else{
        self.delegate?.getGameresultWithMarks(marks, lifeCout: countGameLife, timeCount: clockCount)
        }
    }
}
