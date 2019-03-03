//
//  MCoreDataAccess.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 8/2/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit
import CoreData
class MCoreDataAccess: NSObject {
   
    var appDelegate : AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    
    func insertAppDataFromGame( calculationType : String , gameStage : String , gameType : String , highScore : Int , jems : Int ,  points : Double , profileName : String) -> Bool{
        var gameId : String = calculationType + gameType
        var getGameMarkResult : NSArray = self.getProfileObjectFrom(gameId)
        
        var managaobjectContext : NSManagedObjectContext = appDelegate.managedObjectContext!
        var scoreCard: AnyObject!
        if(getGameMarkResult.count > 0){
            var result: AnyObject = getGameMarkResult[0] as AnyObject
            //var gameStage: String? = result.valueForKey("gameStage") as? String
            var highScorestr: String? = result.valueForKey("highScore") as? String
            var jemsstr: String? = result.valueForKey("jems") as? String
            var pointsstr: String? = result.valueForKey("points") as? String
            //var profileName: String? = result.valueForKey("profileName") as? String
            
            //scoreCard = NSEntityDescription.entityForName("ScoreCard", inManagedObjectContext: managaobjectContext)
             scoreCard = getGameMarkResult as AnyObject
            var highScoreIntegerValue : Int = highScorestr!.toInt()!
            var jemsIntegerValue : Int = jemsstr!.toInt()!
            var pointIntegerValue : Double =  NSString(string: pointsstr!).doubleValue
            
            var newPointValue : Double = pointIntegerValue + points
            var newjemsValue :  Int  = jems + jemsIntegerValue
            
            if(highScore > highScoreIntegerValue){
                scoreCard.setValue(String(highScore) , forKey: "highScore")
                scoreCard.setValue( String(newjemsValue) , forKey: "jems")
                scoreCard.setValue(String(stringInterpolationSegment: newPointValue), forKey: "points")
                managaobjectContext.save(nil)
            return true
            }
            else{
            println("score is low")
                scoreCard.setValue( String(newjemsValue) , forKey: "jems")
                scoreCard.setValue(String(stringInterpolationSegment: newPointValue), forKey: "points")
                managaobjectContext.save(nil)
                return false
            }
          
        }
        else{
         scoreCard = NSEntityDescription.insertNewObjectForEntityForName( "ScoreCard", inManagedObjectContext: managaobjectContext)
            scoreCard.setValue(gameId , forKey: "gameId")
            scoreCard.setValue(calculationType , forKey: "calculationType")
            scoreCard.setValue(gameStage , forKey: "gameStage")
            scoreCard.setValue(gameType , forKey: "gameType")
            scoreCard.setValue(String(highScore) , forKey: "highScore")
            scoreCard.setValue( String(jems) , forKey: "jems")
            scoreCard.setValue(String(stringInterpolationSegment: points), forKey: "points")
            scoreCard.setValue(profileName , forKey: "profileName")
            println(scoreCard)
            managaobjectContext.save(nil)
            return true
        }
        
    }
    
    func getProfileObjectFrom (gameId : String) -> NSArray {
        var managaobjectContext : NSManagedObjectContext = appDelegate.managedObjectContext!
        var request  = NSFetchRequest(entityName: "ScoreCard")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "gameId = %@",  gameId)
//        var sortDis : NSSortDescriptor = NSSortDescriptor(key: "gameType", ascending: true)
//        request.sortDescriptors = [sortDis]
//        request.fetchBatchSize = 10
        var result : NSArray = managaobjectContext.executeFetchRequest(request, error: nil)!
        println(result)
        return result
    }
    
    func upDateGameStage(calculationType : String , gameType : String , newGems : Int , newPoints : Double , upgateStage : String ) ->Bool {
        var gameId : String = calculationType + gameType
        var getGameMarkResult : NSArray = self.getProfileObjectFrom(gameId)
        var scoreCard: AnyObject!
        scoreCard = getGameMarkResult as AnyObject
        var managaobjectContext : NSManagedObjectContext = appDelegate.managedObjectContext!
//       scoreCard =  NSEntityDescription.entityForName("ScoreCard", inManagedObjectContext: managaobjectContext)
        scoreCard.setValue( String(newGems) , forKey: "jems")
        scoreCard.setValue(String(stringInterpolationSegment: newPoints), forKey: "points")
        scoreCard.setValue(upgateStage, forKey: "gameStage")
         managaobjectContext.save(nil)
        
        return true
    }
}
