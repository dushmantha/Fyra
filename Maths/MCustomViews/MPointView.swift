//
//  MPointView.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/18/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MPointView: UIView {
    var fraction :CGFloat?
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        self.createPrograss()
        // Drawing code
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    func createPrograss(){
        
        [MPrograssView .drawCanvas1(fraction: fraction!, rectangle: CGRectMake(0, 0, self.frame.size.width  , self.frame.size.height ), rectangle2: CGRectMake(2, 2, self.frame.size.width - 4 , self.frame.size.width - 4 ))]
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required internal init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fraction = 0.000001
    }
    

}
