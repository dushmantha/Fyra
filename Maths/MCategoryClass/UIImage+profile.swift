//
//  UIImage+profile.swift
//  PrograssView
//
//  Created by Tharaka Dushmantha on 7/18/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    
    func cropToCircleImageWithBordeColor (color :UIColor , lineWidth :  CGFloat ) ->UIImage{
        
        let imageRect = CGRect( origin: CGPointZero, size: self.size)
        UIGraphicsBeginImageContext(imageRect.size)
        var context = UIGraphicsGetCurrentContext()
        
        CGContextAddEllipseInRect(context, imageRect)
        CGContextClip(context)
        
        self.drawAtPoint(CGPointZero)
        CGContextAddEllipseInRect(context, imageRect)
        color.setStroke()
        
        CGContextSetLineWidth(context, lineWidth)
        CGContextStrokePath(context)
        
        let newImage  = UIGraphicsGetImageFromCurrentImageContext()
        
        
        return newImage
    }
    
}