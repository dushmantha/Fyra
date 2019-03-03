//
//  MPointViewController.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/17/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MPointViewController: UIViewController {
    var count :Float = 0.001
    var timer  :NSTimer!
    @IBOutlet var pointView: MPointView!
    @IBOutlet var imgProfileView: UIImageView!
    
    @IBOutlet var imgTime: UIImageView!
    @IBOutlet var imgScore: UIImageView!
    @IBOutlet var imgLife: UIImageView!
    
    
    @IBOutlet var lblLife: UILabel!
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblScoreValue: UILabel!
    @IBOutlet var lblNeedPointValue: UILabel!
    
    @IBOutlet var btnRefreshButton: UIButton!
    
    @IBAction func btnRefreshButton(sender: AnyObject) {
    }
    
    var time : Int = 0
    var score : Int = 0
    var life : Int = 0
    var gameType : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblScoreValue.text = String(score)
        self.scoreCardConfig()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func scoreCardConfig(){
        if(time < 60 && score < 10 && life == 0){
             imgProfileView.image = UIImage(named: "icons-53")
            imgLife.image = UIImage(named: "")
            lblLife.textColor = UIColor.grayColor()
            imgScore.image = UIImage(named: "")
            lblScore.textColor = UIColor.grayColor()
            imgTime.image = UIImage(named: "")
            lblTime.textColor = UIColor.grayColor()

        }
        else{
        if(gameType == "junior"){
            imgProfileView.image = UIImage(named: "junior_pic")
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
        }
        
        else{
            imgProfileView.image = UIImage(named: "senior_pic")
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
        }
    }
        self.startTimer()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Timer Configuration.
    //Timer Starting.
    func startTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector ("update"), userInfo: nil, repeats: true)
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
        
        if(count >= 0.7){
           self.timer.invalidate()
            self.timer = nil
            println("print over")
        }
    }

  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
