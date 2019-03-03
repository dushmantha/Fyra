//
//  MGamePlayClockView.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/27/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MGamePlayClockView: UIView {
    var fraction :CGFloat?

    override func drawRect(rect: CGRect) {
        // Drawing code
        self.createClock()
    }
    
    func createClock(){
      MClockTimer.drawClockPlayground(hours: 3, minutes: 45, seconds: fraction!, color: UIColor.redColor(), color2: UIColor.blackColor(), color3: UIColor.redColor(), color4: UIColor.whiteColor(), color5: UIColor.blueColor())  }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required internal init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fraction = 1.0
    }
}
