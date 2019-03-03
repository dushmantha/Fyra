//
//  MTeenViewController.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/12/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import Spring
import AudioToolbox

class MTeenViewController: UIViewController {
    
    @IBOutlet var ballViewNumberOne: SpringView!
    @IBOutlet var ballViewNumberTwo: SpringView!
    @IBOutlet var ballViewAnswer: SpringView!

    @IBOutlet var lblMarks: UILabel!
    @IBOutlet var lblNumberOne: UILabel!
    @IBOutlet var lblNumberTwo: UILabel!
    @IBOutlet var lblnumberThree: UILabel!
    
    @IBOutlet var imgLifeOne: UIImageView!
    @IBOutlet var imgLifeTwo: UIImageView!
    @IBOutlet var imgLifeThree: UIImageView!
    @IBOutlet var imgArithMatic: UIImageView!
    
    @IBOutlet var btnPuased: UIButton!
    @IBOutlet var btnWrong: UIButton!
    @IBOutlet var btnRight: UIButton!
    
    var ballAnimation :MBallAnimationClass = MBallAnimationClass()
   var randomNumberGen : MGenarateRandomNumber = MGenarateRandomNumber()

    
    var isRightAnswer : Int = 2
    var marks : Int = 0
    var countGameLife : Int = 3
    var calculationType : String?
    var gameType : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setClaculationTypeArithmaticOperatorForGame()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        //        ballAnimation.configBallAnimationHide(ballViewNumberOne)
        //        ballAnimation.configBallAnimationHide(ballViewNumberTwo)
        //        ballAnimation.configBallAnimationHide(ballViewAnswer)
    }
    
    //MARK:- Set Arithmatic Operator.
    func setClaculationTypeArithmaticOperatorForGame(){
        var arithmaticOperation : MSetArithmaticOperation = MSetArithmaticOperation()
        var image : UIImage = arithmaticOperation.setClaculationTypeArithmaticOperatorForGame(calculationType!)
        imgArithMatic.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    //ScoreCardView
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    
    @IBAction func btnCorrect(sender: AnyObject) {
        if(isRightAnswer == 1){
            marks = marks + 1
        }
        else if(isRightAnswer == 2){
            
        }
            
        else{
            self.detectWrongAnswer()
        }
        self.ballViewsAnimation()
        self.genareteRandomNumber()
    }
    
    @IBAction func btnWrong(sender: AnyObject) {
        if(isRightAnswer == 0){
            marks = marks + 1
        }
        else if(isRightAnswer == 2){
            
        }
            
        else{
            self.detectWrongAnswer()
        }
        self.ballViewsAnimation()
        self.genareteRandomNumber()
    }
    
    func ballViewsAnimation(){
        ballViewNumberOne = ballAnimation.configBallNumberOneView(ballViewNumberOne)
        ballViewNumberTwo = ballAnimation.configBallNumberTwoView(ballViewNumberTwo)
        ballViewAnswer = ballAnimation.configBallNumberThreeView(ballViewAnswer)
    }
    
    func genareteRandomNumber(){
        var genRandomNumber = randomNumberGen.genareteRandomNumber(calculationType! , gameType: gameType!)
        self.lblNumberOne.text = genRandomNumber.numberOneValue
        self.lblNumberTwo.text = genRandomNumber.numberTwoValue
        self.lblnumberThree.text = genRandomNumber.numberThreeValue
        isRightAnswer = genRandomNumber.checkRightAnswer
        self.lblMarks.text = String(marks)
    }
    
    func detectWrongAnswer(){
        countGameLife = countGameLife - 1
        var shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        var from_point:CGPoint = CGPointMake(self.view.center.x - 5, self.view.center.y)
        var from_value:NSValue = NSValue(CGPoint: from_point)
        var to_point:CGPoint = CGPointMake(self.view.center.x + 5, self.view.center.y)
        var to_value:NSValue = NSValue(CGPoint: to_point)
        shake.fromValue = from_value
        shake.toValue = to_value
        self.view.layer.addAnimation(shake, forKey: "position")
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        if(countGameLife == 2){
            imgLifeOne.image = UIImage(named: "inactive_life")
        }
            
        else if (countGameLife == 1){
        imgLifeTwo.image = UIImage(named: "inactive_life")
        }
            
        else if (countGameLife == 0){
            imgLifeThree.image = UIImage(named: "inactive_life")
            self.gameOver()
           
        }
    }
    
    func gameOver(){
        var scoreCard : MPointViewController = self.storyboard?.instantiateViewControllerWithIdentifier("strbScoreCardView") as! MPointViewController
        scoreCard.life = countGameLife
        scoreCard.time = 45
        scoreCard.score = marks
        scoreCard.gameType = "teen"
        self.presentViewController(scoreCard, animated: true, completion: nil)
        
    }
    //strbGamePaused
    @IBAction func btnPuased(sender: AnyObject) {
        var gamePuased :MGamePausedViewController = self.storyboard?.instantiateViewControllerWithIdentifier("strbGamePaused") as! MGamePausedViewController
        gamePuased.gameType = "teen"
        gamePuased.calculationType = calculationType
        self.presentViewController(gamePuased, animated: true, completion: nil)

    }
}
