//
//  MGameTypeViewController.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/12/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MGameTypeViewController: UIViewController {

    @IBOutlet var btnJunior: UIButton!
    
    @IBOutlet var btnTeen: UIButton!
    var calculationType : String?
    
    @IBOutlet var btnSenior: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Game Type.
    
    @IBAction func btnJunior(sender: AnyObject) {
        let juniorViewController : MJuniorViewController = self.storyboard?.instantiateViewControllerWithIdentifier("strbJunior") as! MJuniorViewController
        juniorViewController.gameType = "juniorType"
        juniorViewController.calculationType = calculationType
        self.presentViewController(juniorViewController, animated: true, completion: nil)
        
    }

    @IBAction func btnTeen(sender: AnyObject) {
        let teenViewController :MTeenViewController = self.storyboard?.instantiateViewControllerWithIdentifier("strbTeen") as! MTeenViewController
        teenViewController.gameType =  "teenType"
        teenViewController.calculationType = calculationType
        self.presentViewController(teenViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func btnSenior(sender: AnyObject) {

        let seniorViewController : MSeniorViewController = self.storyboard?.instantiateViewControllerWithIdentifier("StrbSenior") as! MSeniorViewController
        seniorViewController.gameType = "senoirType"
        seniorViewController.calculationType = calculationType
       self.presentViewController(seniorViewController, animated: true, completion: nil)

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
