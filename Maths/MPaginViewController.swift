//
//  MPaginViewController.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/17/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MPaginViewController: UIViewController, UIPageViewControllerDataSource ,UITabBarDelegate , UIPageViewControllerDelegate {
    var pageViewController: UIPageViewController!
   // var pageTitles = [String]()
    var pageImages = [String]()
    @IBOutlet var btnPlus: UITabBarItem!
    @IBOutlet var btnMinus: UITabBarItem!
    @IBOutlet var btnMultiple: UITabBarItem!
    @IBOutlet var btnDevited: UITabBarItem!
    @IBOutlet var tabBarView: UITabBar!
    var calculationType : String?
    var gameType : String?
    var isAnimate : Bool = true


    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.pageImages = ["junior_pic", "teen_pic", "senior_pic"]
        calculationType = "+"
        gameType = "junior"
        tabBarView.delegate = self
        tabBarView.tintColor = UIColor.whiteColor()
        tabBarView.backgroundColor = UIColor.blackColor()
        tabBarView.selectedItem = btnPlus
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        self.setPageViewDisplay()
    }
    
    //================ Page View Display=========================
    func setPageViewDisplay(){
        var startVC : MContentViewController = self.viewControllerAtIndex(0)
        var viewControllers = [startVC]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: isAnimate, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 80)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //================TabBar Delegate ==========================
     func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
          var vc: MContentViewController =  MContentViewController()
        isAnimate = false
         println(item.tag)
        switch item.tag  {
        case 1:
            gameType = vc.gameType
            calculationType = "+"
            self.setPageViewDisplay()
           
            break
        case 2:
             gameType = vc.gameType
            calculationType = "-"
            self.setPageViewDisplay()

            break
        case 3:
            gameType = vc.gameType
            calculationType = "*"
            self.setPageViewDisplay()
            break
            
        case 4:
         gameType = vc.gameType
         calculationType = "/"
         self.setPageViewDisplay()

            break
        default:

            break
        }
       
    }
    
    @IBAction func btnReset(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //================== Pageview Controller Delegate ===============================
    func viewControllerAtIndex(index: Int) -> MContentViewController{
        if ((self.pageImages.count == 0) || (index >= self.pageImages.count)) {
            return MContentViewController()
        }
        var vc: MContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MContentViewController") as! MContentViewController
        vc.imageFile = self.pageImages[index] as String
        vc.pageIndex = index
        vc.selectGameType = calculationType
        vc.gameType = gameType
        return vc
        
        
    }
    
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        var vc = viewController as! MContentViewController
        var index = vc.pageIndex as Int
        
     
        if (index == 0 || index == NSNotFound)
        {
            
            return nil
        }
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var vc = viewController as! MContentViewController
        var index = vc.pageIndex as Int

        if (index == NSNotFound)
        {
            return nil
        }
        index++
        if (index == self.pageImages.count)
        {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int{
        return self.pageImages.count
    }
    
   func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int{
        return 0
    }
    
  
}
