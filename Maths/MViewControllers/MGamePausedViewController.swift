//
//  MGamePausedViewController.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/15/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MGamePausedViewController: UIViewController {

    @IBOutlet var btnRetry: UIButton!
    @IBOutlet var btnQuit: UIButton!
    @IBOutlet var btnReume: UIButton!
    
    var gameType : String?
    var calculationType : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnReume(sender: AnyObject) {
      self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btnQuit(sender: AnyObject) {
        let homeViewController = self.storyboard!.instantiateViewControllerWithIdentifier("strbHome") as! MHomeViewController
       self.presentViewController(homeViewController, animated: true, completion: nil)
    }
    
    @IBAction func btnRetry(sender: AnyObject) {

        if(gameType == "junior"){
            let juniorViewController : MJuniorViewController = self.storyboard!.instantiateViewControllerWithIdentifier("strbJunior") as! MJuniorViewController
            juniorViewController.gameType = gameType
            juniorViewController.calculationType = calculationType
            self.presentViewController(juniorViewController, animated: true, completion: nil)
        }
            
        else if(gameType == "teen"){
            let teenViewController :MTeenViewController = self.storyboard?.instantiateViewControllerWithIdentifier("strbTeen") as! MTeenViewController
            teenViewController.gameType = gameType
            teenViewController.calculationType = calculationType

            self.presentViewController(teenViewController, animated: true, completion: nil)
        }
            
        else if(gameType == "senior"){
            let seniorViewController : MSeniorViewController = self.storyboard?.instantiateViewControllerWithIdentifier("StrbSenior") as! MSeniorViewController
            seniorViewController.gameType = gameType
            seniorViewController.calculationType = calculationType
            self.presentViewController(seniorViewController, animated: true, completion: nil)
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
