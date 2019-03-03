//
//  ViewController.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/12/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import AVFoundation
import GameKit

class ViewController: UIViewController ,homeDelegate ,gameTypeDelegate , playGameDelegate , gamePuasedDelegate , marksLoadDelegate ,GKGameCenterControllerDelegate{
    var calCulationType : String?
    var gameType : String?
    var marks : Int?
    var time : Int?
    var life : Int?
    var audioPlayer:AVAudioPlayer!
    var friends : [GKPlayer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load Background Music.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
       // self.SetBackGroundMusic()
            dispatch_async(dispatch_get_main_queue(), {
                //Load Home View.
                // Do any additional setup after loading the view, typically from a nib.
                self.moveHomeScreen()
                self.authenticateLocalPlayer()
            });

        });
      
    }

    //############ --------- Load Back Ground Music ------################
    func SetBackGroundMusic(){
        var audioFilePath = NSBundle.mainBundle().pathForResource("BackGroundMusic", ofType: "mp4")
        
        if audioFilePath != nil {
            
            var audioFileUrl = NSURL.fileURLWithPath(audioFilePath!)
            
            audioPlayer = AVAudioPlayer(contentsOfURL: audioFileUrl, error: nil)
            audioPlayer.play()
            
        } else {
            println("audio file is not found")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //############ --------- Load Home View ------- #####################
    func moveHomeScreen(){
        var homeView : MHomeView = MHomeView()
        homeView.delegate = self
        var hViews: MHomeView =   homeView.initWithData() as! MHomeView
        hViews.showInView(self.view, delegate: self)
    }
    
    //########### ----------- Home Delegate and load Calculation Type View ----- ###########
    func getCalculationName(calCulationType : String){
        self.calCulationType = calCulationType
        var gameTypeView : MGameTypeView = MGameTypeView()
        gameTypeView.delegate = self
        var gtViews: MGameTypeView =   gameTypeView.initWithData() as! MGameTypeView
        gtViews.showInView(self.view, delegate: self)

        
    }
    
    //########## ---------- Load Cup View -------#######################
    func clickOnCup(){
        println("cup")
        var gameCupsView :MPaginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("strbCups") as! MPaginViewController
        self.presentViewController(gameCupsView, animated: true, completion: nil)
    }
   //########## --------- Set game type --------########################
    func getGameType (gameType : String){
        if(gameType == "home"){
            self.moveHomeScreen()
        }
        else{
        self.gameType = gameType
        self.loadGameView(true)
        }
    }
    
    //######## -----------Load Game Result View ---########################
    func getGameresultWithMarks(marks : Int , lifeCout : Int , timeCount : Int){
        var gameMarks : MMarksLoadView = MMarksLoadView()
        gameMarks.delegate = self
        var mmViews: MMarksLoadView =   gameMarks.initWithData() as! MMarksLoadView
        mmViews.time = timeCount
        mmViews.life = lifeCout
        mmViews.score = marks
        mmViews.gameType = self.gameType
        mmViews.calculationType = self.calCulationType
        mmViews.showInView(self.view, delegate: self)
      

    }
    
    
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                // 1 Show login if player is not logged in
                self.presentViewController(ViewController, animated: true, completion: nil)
            } else if (localPlayer.authenticated) {
                // 2 Player is already euthenticated & logged in, load game center
                // Get the default leaderboard ID
                localPlayer.loadDefaultLeaderboardIdentifierWithCompletionHandler({ (leaderboardIdentifer: String!, error: NSError!) -> Void in
                    if error != nil {
                        println(error)
                    } else {
                    }
                })
                self.playerAuthenticated(localPlayer)
            } else {
                // 3 Game center is not enabled on the users device
                println("Local player could not be authenticated, disabling game center")
                println(error)
            }
        }
    }
    
    func playerAuthenticated( player : GKLocalPlayer) {
        // BEGIN player_info
       // self.usernameLabel.text = player.alias
        
        player.loadPhotoForSize(GKPhotoSizeSmall, withCompletionHandler: {
            (image, error) -> Void in
            
            if let theError = error {
                println("Can't load image: \(error)")
            } else if let theImage = image {
                //self.imageView.image = image
            }
        })
        // END player_info
        
        // BEGIN loading_friends
        player.loadFriendPlayersWithCompletionHandler {
            (friends, error) -> Void in
            // Log out info about each friend
            for friend in friends as! [GKPlayer] {
                println("Friend: \(friend.displayName)")
            }
            
            // Store friends in a property
            self.friends = friends as! [GKPlayer]
            
        }
        // END loading_friends
    }
    
    
    func loadLeaderBord(marks : Int , gameType : String , calculationType : String){
        if(gameType == "junior"){
            if(calculationType == "+"){
                self.setLeaderBordIdWithName("JuniorPlus", marks: marks)
            }
            
            else if(calculationType == "-"){
                self.setLeaderBordIdWithName("JuniorMinus", marks: marks)
            }
            
            else if(calculationType == "*"){
               self.setLeaderBordIdWithName("JuniorMultiple", marks: marks)
            }
            else if(calculationType == "/"){
                self.setLeaderBordIdWithName("JuniorDivided", marks: marks)
            }
        }
        
    else  if(gameType == "teen"){
            if(calculationType == "+"){
                self.setLeaderBordIdWithName("TeenPlus", marks: marks)
            }
                
            else if(calculationType == "-"){
                self.setLeaderBordIdWithName("TeenMinus", marks: marks)
            }
                
            else if(calculationType == "*"){
                self.setLeaderBordIdWithName("TeenMultiple", marks: marks)
            }
            else if(calculationType == "/"){
                self.setLeaderBordIdWithName("JuniorDivided", marks: marks)
            }
        }
        
        else  if(gameType == "senior"){
            if(calculationType == "+"){
                self.setLeaderBordIdWithName("SeniorPlus", marks: marks)
            }
                
            else if(calculationType == "-"){
                self.setLeaderBordIdWithName("SeniorMinus", marks: marks)
            }
                
            else if(calculationType == "*"){
                self.setLeaderBordIdWithName("SeniorMultiple", marks: marks)
            }
            else if(calculationType == "/"){
                self.setLeaderBordIdWithName("SeniorDivided", marks: marks)
            }
        }
        
       
    }
    
    
    func setLeaderBordIdWithName(leaderBordName : String , marks : Int){
        var leaderboardID = leaderBordName
        var sScore = GKScore(leaderboardIdentifier: leaderboardID)
        sScore.value = Int64(marks)
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        GKScore.reportScores([sScore], withCompletionHandler: { (error: NSError!) -> Void in
            if error != nil {
                println(error.localizedDescription)
            } else {
                println("Score submitted")
                var gcVC: GKGameCenterViewController = GKGameCenterViewController()
                gcVC.gameCenterDelegate = self
                gcVC.viewState = GKGameCenterViewControllerState.Leaderboards
                gcVC.leaderboardIdentifier = leaderBordName
                self.presentViewController(gcVC, animated: true, completion: nil)
                localPlayer.setDefaultLeaderboardIdentifier(leaderboardID, completionHandler: { (NSError) -> Void in
                    
                })
            }
        })
    }
    
    
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController!) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //######## ---------- Delegate method and  Move Home Screen -----##########
    func getMarksWithFace(marks : String){
       self.moveHomeScreen()
    }
    
    //######## --------- Game Puased -----#################################
    func puasedGameResultWithMarks(marks : Int , lifeCout : Int , timeCount : Int){
        self.marks = marks
        self.time = timeCount
        self.life = lifeCout
        
        var puasedGameView : MGamePuasedView = MGamePuasedView()
        puasedGameView.delegate = self
        var gpViews: MGamePuasedView =   puasedGameView.initWithData() as! MGamePuasedView
        gpViews.showInView(self.view, delegate: self)
    }
    
    
    func hideViewWithMoveType(moveType : String){
        if(moveType == "resume"){
            self.loadGameView(false)
        }
        else if(moveType == "retry"){
            self.loadGameView(true)
        }
       else if(moveType == "quite"){
            self.moveHomeScreen()
        }
    }

    func gameRetry(){
         self.loadGameView(true)
    }
    
    //############---------- Chek First time play ------########################################
    func loadGameView(isFirst : Bool){
        if(isFirst == true){
            var playGameView : MPlayGameView = MPlayGameView()
            playGameView.delegate = self
            var pViews: MPlayGameView =   playGameView.initWithData() as! MPlayGameView
            pViews.calculationType = self.calCulationType
            pViews.gameType  = self.gameType
            pViews.showInView(self.view, delegate: self)
        }
        
        else{
            var playGameView : MPlayGameView = MPlayGameView()
            playGameView.delegate = self
            var pViews: MPlayGameView =   playGameView.initWithData() as! MPlayGameView
            pViews.calculationType = self.calCulationType
            pViews.gameType  = self.gameType
            pViews.marks = self.marks!
            pViews.countGameLife = self.life!
            pViews.clockCount = self.time!
            pViews.showInView(self.view, delegate: self)
        }
    }
    func clickBackButton(){
        self.gameType = ""
        var gameTypeView : MGameTypeView = MGameTypeView()
        gameTypeView.delegate = self
        var gtViews: MGameTypeView =   gameTypeView.initWithData() as! MGameTypeView
        gtViews.showInView(self.view, delegate: self)
    }
}

