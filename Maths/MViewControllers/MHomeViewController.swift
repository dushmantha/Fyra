//
//  MHomeViewController.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/12/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MHomeViewController: UIViewController {

    var pageViewController: UIPageViewController!
    var pageTitles = [String]()
    var pageImages = [String]()
    
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var btnMinus: UIButton!
    @IBOutlet var btnMultiple: UIButton!
    @IBOutlet var btnDivided: UIButton!
    @IBOutlet var btnCup: UIButton!
    
    
    
    @IBOutlet var lblPlus: UILabel!
    
    @IBOutlet var lblMinus: UILabel!
    
    @IBOutlet var lblMultiple: UILabel!
    
    @IBOutlet var lblDivided: UILabel!
    
    @IBOutlet var lblGameName: UILabel!
    
    var calculationType : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK:- Button Implimetation.
    
    @IBAction func btnPlus(sender: AnyObject) {
        calculationType = "+"
        self.loadGameType()
    }
    
    
    @IBAction func btnMinus(sender: AnyObject) {
        calculationType = "-"
        self.loadGameType()
    }
    
    @IBAction func btnMultiple(sender: AnyObject) {
        calculationType = "*"
        self.loadGameType()
    }
    
    @IBAction func btnDivided(sender: AnyObject) {
        calculationType = "/"
        self.loadGameType()
    }
    
    @IBAction func btnCup(sender: AnyObject) {
    }
    
    func loadGameType(){
        let gameTypeViewController : MGameTypeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("strbGameType") as! MGameTypeViewController
            gameTypeViewController.calculationType = calculationType
        self.presentViewController(gameTypeViewController, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
