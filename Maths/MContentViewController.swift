//
//  MContentViewController.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/17/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import CoreData
import PKHUD
import GameKit
class MContentViewController: UIViewController  , UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet  var imgFaceView: UIImageView!
    @IBOutlet var clvCups: UICollectionView!
    
    @IBOutlet  weak var lblJems: UILabel!
    @IBOutlet  weak var lblPoints: UILabel!
    var pointsStr : String?
    var jemsStr : String?
    var coreDataScoreCard : MCoreDataAccess = MCoreDataAccess()
    var pageIndex: Int!
    var imageFile: String!
    var faceArray = [UIImage]()
    var faceBlurArray = [UIImage]()
    var selectGameType : String?
    var gameType : String?
    var gameStage : String?
    
    override func viewDidLoad() {
        self.authenticateLocalPlayer()
        super.viewDidLoad()
        self.clvCups.delegate = self
        self.clvCups.dataSource = self
        self.lblJems.text = jemsStr
        self.lblPoints.text = pointsStr
        println(pageIndex)
        self.imgFaceView.image = UIImage(named: self.imageFile)
        if(self.imageFile == "junior_pic"){
        self.faceArray = [UIImage(named: "junior-01")!, UIImage(named: "junior-02")!, UIImage(named: "junior-03")!, UIImage(named: "junior-04")!,UIImage(named: "junior-05")!,UIImage(named: "junior-06")!,UIImage(named: "junior-07")!,UIImage(named: "junior-08")!,UIImage(named: "junior-09")!]
            
            
             self.faceBlurArray = [UIImage(named: "junior-blur-01")!, UIImage(named: "junior-blur-02")!, UIImage(named: "junior-blur-03")!, UIImage(named: "junior-blur-04")!,UIImage(named: "junior-blur-05")!,UIImage(named: "junior-blur-06")!,UIImage(named: "junior-blur-07")!,UIImage(named: "junior-blur-08")!,UIImage(named: "junior-blur-09")!]
            
              gameType = "junior"
        }
        else if(self.imageFile == "teen_pic"){
            self.faceArray = [UIImage(named: "teen-01")!, UIImage(named: "teen-02")!, UIImage(named: "teen-03")!, UIImage(named: "teen-04")!,UIImage(named: "teen-05")!,UIImage(named: "teen-06")!,UIImage(named: "teen-07")!,UIImage(named: "teen-08")!,UIImage(named: "teen-09")!]
            
            self.faceBlurArray = [UIImage(named: "teen-blur-01")!, UIImage(named: "teen-blur-02")!, UIImage(named: "teen-blur-03")!, UIImage(named: "teen-blur-04")!,UIImage(named: "teen-blur-05")!,UIImage(named: "teen-blur-06")!,UIImage(named: "teen-blur-07")!,UIImage(named: "teen-blur-08")!,UIImage(named: "teen-blur-09")!]
             gameType = "teen"
        }
        
        else if(self.imageFile == "senior_pic"){
             self.faceArray = [UIImage(named: "senior-01")!, UIImage(named: "senior-02")!, UIImage(named: "senior-03")!, UIImage(named: "senior-04")!,UIImage(named: "senior-05")!,UIImage(named: "senior-06")!,UIImage(named: "senior-07")!,UIImage(named: "senior-08")!,UIImage(named: "senior-09")!]
            
            self.faceBlurArray = [UIImage(named: "senior-blur-01")!, UIImage(named: "senior-blur-02")!, UIImage(named: "senior-blur-03")!, UIImage(named: "senior-blur-04")!,UIImage(named: "senior-blur-05")!,UIImage(named: "senior-blur-06")!,UIImage(named: "senior-blur-07")!,UIImage(named: "senior-blur-08")!,UIImage(named: "senior-blur-09")!]
            gameType = "senior"

        }
        dispatch_async(dispatch_get_main_queue(), {
            // Do any additional setup after loading the view, typically from a nib.
            self.accessDB()
        });
    }
    
    //======================== Get data From Db And set Data for Lable.=====================================
    func accessDB(){
        var gameId : String = selectGameType! + gameType!
        var getGameMarkResult : NSArray =  coreDataScoreCard.getProfileObjectFrom(gameId)
        clvCups.reloadData()
        if(getGameMarkResult.count > 0){
            println(getGameMarkResult)
            var result: AnyObject = getGameMarkResult[0] as AnyObject
            var calculationType: AnyObject? = result.valueForKey("calculationType")
            var gameStage: AnyObject? = result.valueForKey("gameStage")
            var gameType: AnyObject? = result.valueForKey("gameType")
            var highScore: AnyObject? = result.valueForKey("highScore")
            var jems: String? = result.valueForKey("jems") as? String
            var points: String? = result.valueForKey("points") as? String
            var profileName: AnyObject? = result.valueForKey("profileName")
            jemsStr = jems
            pointsStr = NSString(format: "%.1f", (stringInterpolationSegment: NSString(string: points!).floatValue)) as String
            self.gameStage = gameStage as? String
            self.lblJems.text = jemsStr
            self.lblPoints.text = pointsStr
            
            // Do any additional setup after loading the view.
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //================= Collectoin View Data Souse and Delegate ==================================
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.faceArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! MCupCollectionViewCell
        if(gameStage == "notstSage"){
            cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
        }
        else if(gameStage == "one"){
            if(indexPath.row < 1){
                println(indexPath.row )
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }
        
        else if(gameStage == "two"){
            if(indexPath.row < 2){
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }

        else if(gameStage == "three"){
            if(indexPath.row < 3){
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }

        else if(gameStage == "four"){
            if(indexPath.row < 4){
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }
        else if(gameStage == "five"){
            if(indexPath.row < 5){
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }
        else if(gameStage == "six"){
            if(indexPath.row < 6){
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }
        
        else if(gameStage == "seven"){
            if(indexPath.row < 7){
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }
        
        else if(gameStage == "eight"){
            if(indexPath.row < 8){
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }
        else if(gameStage == "nine"){
            if(indexPath.row < 9){
                cell.imgCupView?.image = self.faceArray[indexPath.row]
            }
            else{
                cell.imgCupView?.image = self.faceBlurArray[indexPath.row]
            }
        }
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! MCupCollectionViewCell
        if(jemsStr  == nil){
            jemsStr = "0"
        }
        if(pointsStr == nil){
            pointsStr = "0"
        }
       var pointInt : Double = NSString(string: pointsStr!).doubleValue
        var jemsInt : Int = jemsStr!.toInt()!
        
        if(indexPath.row == 0){
        if(gameStage == "notstSage"){
            
            if(jemsInt > 5){
                coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 5), newPoints: pointInt , upgateStage: "one")
            }
            else if(pointInt > 20 ){
                 coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 20) , upgateStage: "one")
            }
            else{
                PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit", image: PKHUDAssets.checkmarkImage)
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 2.0)
            }
            self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054037")
        }
    }
        if(indexPath.row == 1){
         if(gameStage == "one"){
            if(jemsInt > 10){
            coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 10), newPoints: pointInt , upgateStage: "two")
            }
            else if(pointInt > 50 ){
                coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 50) , upgateStage: "two")
            }
            else{
                PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit", image: PKHUDAssets.checkmarkImage)
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 2.0)
            }
            self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054038")
        }
    }
        if(indexPath.row == 2){
         if(gameStage == "two"){
            if(jemsInt > 20){
              coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 20), newPoints: pointInt , upgateStage: "three")
            }
            else if(pointInt > 80 ){
                coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 80) , upgateStage: "three")
            }
            else{
                PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit", image: PKHUDAssets.checkmarkImage)
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 2.0)
            }
            self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054039")
        }
    }
        if(indexPath.row == 3){
         if(gameStage == "three"){
            if(jemsInt > 30){
                coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 30), newPoints: pointInt , upgateStage: "four")
            }
            else if(pointInt > 150 ){
                coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 150) , upgateStage: "four")
            }
            else{
                PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit", image: PKHUDAssets.checkmarkImage)
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 2.0)
            }
            self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054040")
        }
    }
    if(indexPath.row == 4){
         if(gameStage == "four"){
            if(jemsInt > 40){
                coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 40), newPoints: pointInt , upgateStage: "five")
            }
            else if(pointInt > 170 ){
                coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 170) , upgateStage: "five")
            }
            else{
                PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit", image: PKHUDAssets.checkmarkImage)
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 2.0)
            }
            self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054041")
        }
    }

        if(indexPath.row == 5){
            if(gameStage == "five"){
                if(jemsInt > 45){
                    coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 45), newPoints: pointInt , upgateStage: "six")
                }
                else if(pointInt > 190 ){
                    coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 190) , upgateStage: "six")
                }
                else{
                    PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit", image: PKHUDAssets.checkmarkImage)
                    PKHUD.sharedHUD.show()
                    PKHUD.sharedHUD.hide(afterDelay: 2.0)
                }
                self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054042")
            }
        }

        if(indexPath.row == 6){
            if(gameStage == "six"){
                if(jemsInt > 50){
                    coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 50), newPoints: pointInt , upgateStage: "seven")
                }
                else if(pointInt > 200 ){
                    coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 200) , upgateStage: "seven")
                }
                else{
                    PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit", image: PKHUDAssets.checkmarkImage)
                    PKHUD.sharedHUD.show()
                    PKHUD.sharedHUD.hide(afterDelay: 2.0)
                }
                self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054043")
            }
        }
        
        if(indexPath.row == 7){
            if(gameStage == "seven"){
                if(jemsInt > 55){
                    coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 55), newPoints: pointInt , upgateStage: "eight")
                }
                else if(pointInt > 210 ){
                    coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 210) , upgateStage: "eight")
                }
                else{
                    PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit", image: PKHUDAssets.checkmarkImage)
                    PKHUD.sharedHUD.show()
                    PKHUD.sharedHUD.hide(afterDelay: 2.0)
                }
                self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054044")
            }
        }
        
        if(indexPath.row == 8){
            if(gameStage == "eight"){
                if(jemsInt > 50){
                    coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: (jemsInt - 50), newPoints: pointInt , upgateStage: "nine")
                }
                else if(pointInt > 220 ){
                    coreDataScoreCard.upDateGameStage(selectGameType!, gameType: gameType!, newGems: jemsInt , newPoints: (pointInt - 220) , upgateStage: "nine")
                }
                PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Get More Credit.", image: PKHUDAssets.checkmarkImage)
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 2.0)
                self.gameCenterAddProgressToAnAchievement(100.00, achievementID: "70054045")
            }
        }
        dispatch_async(dispatch_get_main_queue(), {
            // Do any additional setup after loading the view, typically from a nib.
            self.accessDB()
            self.clvCups.reloadData()
        });

    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.size.width/3) - 10, height: (self.view.frame.size.width/3) - 10) // The size of one cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //=================== Close Button  Action Set ==================================================
    @IBAction func btnClose(sender: AnyObject) {
        let seniorViewController : ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("strbMainView") as! ViewController
        self.presentViewController(seniorViewController, animated: true, completion: nil)
    }
    
    
    
    //==================== Game Center Achivement configuration.=====================================
    let gameCenterPlayer=GKLocalPlayer.localPlayer()
    var canUseGameCenter:Bool = false {
        didSet{if canUseGameCenter == true {// load prev. achievments form Game Center
            gameCenterLoadAchievements()}
        }}
    var gameCenterAchievements=[String:GKAchievement]()
    
    /**
    builder
    */
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                // 1 Show login if player is not logged in
                self.presentViewController(ViewController, animated: true, completion: nil)
            } else if (localPlayer.authenticated) {
                // 2 Player is already euthenticated & logged in, load game center
                // Get the default leaderboard ID
                self.gameCenterLoadAchievements()
            } else {
                // 3 Game center is not enabled on the users device
                println("Local player could not be authenticated, disabling game center")
                println(error)
            }
        }
    }
    
    
    /**
    Load prev achievement granted to the player
    */
    func gameCenterLoadAchievements(){
        // load all prev. achievements for GameCenter for the user to progress can be added
        var allAchievements=[GKAchievement]()
        GKAchievement.loadAchievementsWithCompletionHandler({ (allAchievements, error:NSError!) -> Void in
            if error != nil{
                println("Game Center: could not load achievements, error: \(error)")
            } else {
                for anAchievement in allAchievements  {
                    if let oneAchievement = anAchievement as? GKAchievement {
                        self.gameCenterAchievements[oneAchievement.identifier]=oneAchievement}
                }
            }
        })
    }
    
    
    /**
    Add progress to an achievement
    
    :param: Progress achievement Double
    :param: ID Achievement
    */
    func gameCenterAddProgressToAnAchievement(progress:Double,achievementID:String) {
        if canUseGameCenter == true { // only update progress if user opt-in to use Game Center
            // lookup if prev progress is logged for this achievement = achievement is already know (and loaded) form Game Center for this user
            var lookupAchievement:GKAchievement? = gameCenterAchievements[achievementID]
            if let achievement = lookupAchievement {
                // found the achievement with the given achievementID, check if it already 100% done
                if achievement.percentComplete != 100 {
                    // set new progress
                    achievement.percentComplete = progress
                    if progress == 100.0  {achievement.showsCompletionBanner=true}  // show banner only if achievement is fully granted (progress is 100%)
                      // try to report the progress to the Game Center
                    GKAchievement.reportAchievements([achievement], withCompletionHandler:  {(var error:NSError!) -> Void in
                        if error != nil {
                            println("Couldn't save achievement (\(achievementID)) progress to \(progress) %")
                        }
                    })
                }
                else {// achievemnt already granted, nothing to do
                    println("DEBUG: Achievement (\(achievementID)) already granted")}
            } else { // never added  progress for this achievement, create achievement now, recall to add progress
                println("No achievement with ID (\(achievementID)) was found, no progress for this one was recoreded yet. Create achievement now.")
                gameCenterAchievements[achievementID] = GKAchievement(identifier: achievementID)
                // recursive recall this func now that the achievement exist
                gameCenterAddProgressToAnAchievement(progress, achievementID: achievementID)
            }
        }
    }
    /**
    Remove One Achievements
    
    :param: ID Achievement
    */
    func resetAchievements(achievementID:String) {
        
        var lookupAchievement:GKAchievement? = gameCenterAchievements[achievementID]
        
        if let achievement = lookupAchievement {
            GKAchievement.resetAchievementsWithCompletionHandler({ (var error:NSError!) -> Void in
                if error != nil {
                    //   ToolKit.log("Couldn't Reset achievement (\(achievementID))")
                } else {
                    ///   ToolKit.log("Reset achievement (\(achievementID))")
                }
            })
            
        } else {
            println("No achievement with ID (\(achievementID)) was found, no progress for this one was recoreded yet. Create achievement now.")
            
            gameCenterAchievements[achievementID] = GKAchievement(identifier: achievementID)
            // recursive recall this func now that the achievement exist
            self.resetAchievements(achievementID)
        }
    }
}
