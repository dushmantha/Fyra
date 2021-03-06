//
//  MClockTimer.swift
//  MClockTimer
//
//  Created by Maths on 8/1/15.
//  Copyright (c) 2015 Maths. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class MClockTimer : NSObject {

    //// Drawing Methods

    public class func drawClock(#numbersColor: UIColor, darkHandsColor: UIColor, lightHandColor: UIColor, rimColor: UIColor, tickColor: UIColor, faceColor: UIColor, hours: CGFloat, minutes: CGFloat, seconds: CGFloat) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()


        //// Variable Declarations
        let expression = hours > 12 ? "" : ""
        let secondsAngle: CGFloat = -seconds / 60.0 * 360
        let minuteAngle: CGFloat = -(minutes / 60.0 * 360 - secondsAngle / 60.0)
        let hourAngle: CGFloat = -hours / 12.0 * 360 + minuteAngle / 12.0

        //// Oval 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)

        var oval2Path = UIBezierPath(ovalInRect: CGRectMake(-116, -116, 232, 232))
        rimColor.setFill()
        oval2Path.fill()

        CGContextRestoreGState(context)


        //// Oval Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)

        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(-110, -110, 220, 220))
        faceColor.setFill()
        ovalPath.fill()

        CGContextRestoreGState(context)


        //// Text Drawing
        var textPath = UIBezierPath()
        textPath.moveToPoint(CGPointMake(123.72, 38.95))
        textPath.addLineToPoint(CGPointMake(120.22, 41.82))
        textPath.addLineToPoint(CGPointMake(118.47, 39.75))
        textPath.addLineToPoint(CGPointMake(124, 35.3))
        textPath.addLineToPoint(CGPointMake(126.72, 35.3))
        textPath.addLineToPoint(CGPointMake(126.72, 53))
        textPath.addLineToPoint(CGPointMake(123.72, 53))
        textPath.addLineToPoint(CGPointMake(123.72, 38.95))
        textPath.closePath()
        textPath.moveToPoint(CGPointMake(130.72, 50.25))
        textPath.addLineToPoint(CGPointMake(137.55, 43.55))
        textPath.addCurveToPoint(CGPointMake(138.86, 41.94), controlPoint1: CGPointMake(138.1, 43.02), controlPoint2: CGPointMake(138.54, 42.48))
        textPath.addCurveToPoint(CGPointMake(139.35, 40.07), controlPoint1: CGPointMake(139.19, 41.4), controlPoint2: CGPointMake(139.35, 40.78))
        textPath.addCurveToPoint(CGPointMake(138.54, 38.09), controlPoint1: CGPointMake(139.35, 39.24), controlPoint2: CGPointMake(139.08, 38.58))
        textPath.addCurveToPoint(CGPointMake(136.53, 37.35), controlPoint1: CGPointMake(138, 37.6), controlPoint2: CGPointMake(137.33, 37.35))
        textPath.addCurveToPoint(CGPointMake(134.47, 38.21), controlPoint1: CGPointMake(135.67, 37.35), controlPoint2: CGPointMake(134.99, 37.64))
        textPath.addCurveToPoint(CGPointMake(133.53, 40.38), controlPoint1: CGPointMake(133.96, 38.79), controlPoint2: CGPointMake(133.64, 39.51))
        textPath.addLineToPoint(CGPointMake(130.6, 39.93))
        textPath.addCurveToPoint(CGPointMake(131.22, 37.9), controlPoint1: CGPointMake(130.68, 39.19), controlPoint2: CGPointMake(130.89, 38.52))
        textPath.addCurveToPoint(CGPointMake(132.5, 36.3), controlPoint1: CGPointMake(131.56, 37.28), controlPoint2: CGPointMake(131.98, 36.75))
        textPath.addCurveToPoint(CGPointMake(134.31, 35.24), controlPoint1: CGPointMake(133.02, 35.85), controlPoint2: CGPointMake(133.62, 35.5))
        textPath.addCurveToPoint(CGPointMake(136.57, 34.85), controlPoint1: CGPointMake(135, 34.98), controlPoint2: CGPointMake(135.76, 34.85))
        textPath.addCurveToPoint(CGPointMake(138.79, 35.18), controlPoint1: CGPointMake(137.34, 34.85), controlPoint2: CGPointMake(138.08, 34.96))
        textPath.addCurveToPoint(CGPointMake(140.68, 36.16), controlPoint1: CGPointMake(139.5, 35.39), controlPoint2: CGPointMake(140.12, 35.72))
        textPath.addCurveToPoint(CGPointMake(141.99, 37.79), controlPoint1: CGPointMake(141.23, 36.6), controlPoint2: CGPointMake(141.66, 37.15))
        textPath.addCurveToPoint(CGPointMake(142.47, 40.03), controlPoint1: CGPointMake(142.31, 38.43), controlPoint2: CGPointMake(142.47, 39.17))
        textPath.addCurveToPoint(CGPointMake(142.25, 41.61), controlPoint1: CGPointMake(142.47, 40.59), controlPoint2: CGPointMake(142.4, 41.12))
        textPath.addCurveToPoint(CGPointMake(141.64, 43), controlPoint1: CGPointMake(142.1, 42.1), controlPoint2: CGPointMake(141.9, 42.57))
        textPath.addCurveToPoint(CGPointMake(140.74, 44.24), controlPoint1: CGPointMake(141.38, 43.43), controlPoint2: CGPointMake(141.08, 43.85))
        textPath.addCurveToPoint(CGPointMake(139.62, 45.38), controlPoint1: CGPointMake(140.4, 44.63), controlPoint2: CGPointMake(140.03, 45.01))
        textPath.addLineToPoint(CGPointMake(134.53, 50.25))
        textPath.addLineToPoint(CGPointMake(142.5, 50.25))
        textPath.addLineToPoint(CGPointMake(142.5, 53))
        textPath.addLineToPoint(CGPointMake(130.72, 53))
        textPath.addLineToPoint(CGPointMake(130.72, 50.25))
        textPath.closePath()
        numbersColor.setFill()
        textPath.fill()


        //// Bezier Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)
        CGContextRotateCTM(context, -(minuteAngle + 90) * CGFloat(M_PI) / 180)

        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(7.07, -7.07))
        bezierPath.addCurveToPoint(CGPointMake(9.54, -3), controlPoint1: CGPointMake(8.25, -5.89), controlPoint2: CGPointMake(9.07, -4.49))
        bezierPath.addLineToPoint(CGPointMake(95, -3))
        bezierPath.addLineToPoint(CGPointMake(95, 3))
        bezierPath.addLineToPoint(CGPointMake(9.54, 3))
        bezierPath.addCurveToPoint(CGPointMake(7.07, 7.07), controlPoint1: CGPointMake(9.07, 4.49), controlPoint2: CGPointMake(8.25, 5.89))
        bezierPath.addCurveToPoint(CGPointMake(-7.07, 7.07), controlPoint1: CGPointMake(3.17, 10.98), controlPoint2: CGPointMake(-3.17, 10.98))
        bezierPath.addCurveToPoint(CGPointMake(-7.07, -7.07), controlPoint1: CGPointMake(-10.98, 3.17), controlPoint2: CGPointMake(-10.98, -3.17))
        bezierPath.addCurveToPoint(CGPointMake(7.07, -7.07), controlPoint1: CGPointMake(-3.17, -10.98), controlPoint2: CGPointMake(3.17, -10.98))
        bezierPath.closePath()
        darkHandsColor.setFill()
        bezierPath.fill()

        CGContextRestoreGState(context)


        //// Bezier 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)
        CGContextRotateCTM(context, -(hourAngle + 90) * CGFloat(M_PI) / 180)

        var bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(7.07, -7.07))
        bezier2Path.addCurveToPoint(CGPointMake(8.66, -5), controlPoint1: CGPointMake(7.7, -6.44), controlPoint2: CGPointMake(8.24, -5.74))
        bezier2Path.addLineToPoint(CGPointMake(56, -5))
        bezier2Path.addLineToPoint(CGPointMake(56, 5))
        bezier2Path.addLineToPoint(CGPointMake(8.66, 5))
        bezier2Path.addCurveToPoint(CGPointMake(7.07, 7.07), controlPoint1: CGPointMake(8.24, 5.74), controlPoint2: CGPointMake(7.7, 6.44))
        bezier2Path.addCurveToPoint(CGPointMake(-7.07, 7.07), controlPoint1: CGPointMake(3.17, 10.98), controlPoint2: CGPointMake(-3.17, 10.98))
        bezier2Path.addCurveToPoint(CGPointMake(-7.07, -7.07), controlPoint1: CGPointMake(-10.98, 3.17), controlPoint2: CGPointMake(-10.98, -3.17))
        bezier2Path.addCurveToPoint(CGPointMake(7.07, -7.07), controlPoint1: CGPointMake(-3.17, -10.98), controlPoint2: CGPointMake(3.17, -10.98))
        bezier2Path.closePath()
        darkHandsColor.setFill()
        bezier2Path.fill()

        CGContextRestoreGState(context)


        //// Bezier 3 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)
        CGContextRotateCTM(context, -(secondsAngle + 90) * CGFloat(M_PI) / 180)

        var bezier3Path = UIBezierPath()
        bezier3Path.moveToPoint(CGPointMake(4.24, -4.24))
        bezier3Path.addCurveToPoint(CGPointMake(5.92, -1), controlPoint1: CGPointMake(5.16, -3.33), controlPoint2: CGPointMake(5.72, -2.19))
        bezier3Path.addLineToPoint(CGPointMake(99, -1))
        bezier3Path.addLineToPoint(CGPointMake(99, 1))
        bezier3Path.addLineToPoint(CGPointMake(5.92, 1))
        bezier3Path.addCurveToPoint(CGPointMake(4.24, 4.24), controlPoint1: CGPointMake(5.72, 2.19), controlPoint2: CGPointMake(5.16, 3.33))
        bezier3Path.addCurveToPoint(CGPointMake(-4.24, 4.24), controlPoint1: CGPointMake(1.9, 6.59), controlPoint2: CGPointMake(-1.9, 6.59))
        bezier3Path.addCurveToPoint(CGPointMake(-4.24, -4.24), controlPoint1: CGPointMake(-6.59, 1.9), controlPoint2: CGPointMake(-6.59, -1.9))
        bezier3Path.addCurveToPoint(CGPointMake(4.24, -4.24), controlPoint1: CGPointMake(-1.9, -6.59), controlPoint2: CGPointMake(1.9, -6.59))
        bezier3Path.closePath()
        lightHandColor.setFill()
        bezier3Path.fill()

        CGContextRestoreGState(context)


        //// Group
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRectMake(127, 20, 6, 8))
        tickColor.setFill()
        rectanglePath.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRectMake(127, 232, 6, 8))
        tickColor.setFill()
        rectangle2Path.fill()




        //// Group 2
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)
        CGContextRotateCTM(context, 90 * CGFloat(M_PI) / 180)



        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRectMake(-3, -110, 6, 8))
        tickColor.setFill()
        rectangle3Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRectMake(-3, 102, 6, 8))
        tickColor.setFill()
        rectangle4Path.fill()



        CGContextRestoreGState(context)


        //// Group 3
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)
        CGContextRotateCTM(context, -30 * CGFloat(M_PI) / 180)



        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(rect: CGRectMake(-3, -110, 6, 8))
        tickColor.setFill()
        rectangle5Path.fill()


        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(rect: CGRectMake(-3, 102, 6, 8))
        tickColor.setFill()
        rectangle6Path.fill()



        CGContextRestoreGState(context)


        //// Group 4
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)
        CGContextRotateCTM(context, -60 * CGFloat(M_PI) / 180)



        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(rect: CGRectMake(-3, -110, 6, 8))
        tickColor.setFill()
        rectangle7Path.fill()


        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(rect: CGRectMake(-3, 102, 6, 8))
        tickColor.setFill()
        rectangle8Path.fill()



        CGContextRestoreGState(context)


        //// Group 5
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)
        CGContextRotateCTM(context, -120 * CGFloat(M_PI) / 180)



        //// Rectangle 9 Drawing
        let rectangle9Path = UIBezierPath(rect: CGRectMake(-3, -110, 6, 8))
        tickColor.setFill()
        rectangle9Path.fill()


        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(rect: CGRectMake(-3, 102, 6, 8))
        tickColor.setFill()
        rectangle10Path.fill()



        CGContextRestoreGState(context)


        //// Group 6
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 130, 130)
        CGContextRotateCTM(context, -150 * CGFloat(M_PI) / 180)



        //// Rectangle 11 Drawing
        let rectangle11Path = UIBezierPath(rect: CGRectMake(-3, -110, 6, 8))
        tickColor.setFill()
        rectangle11Path.fill()


        //// Rectangle 12 Drawing
        let rectangle12Path = UIBezierPath(rect: CGRectMake(-3, 102, 6, 8))
        tickColor.setFill()
        rectangle12Path.fill()



        CGContextRestoreGState(context)


        //// Text 2 Drawing
        let text2Rect = CGRectMake(111, 198, 38, 40)
        var text2TextContent = NSString(string: "6")
        let text2Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        text2Style.alignment = NSTextAlignment.Center

        let text2FontAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 25)!, NSForegroundColorAttributeName: numbersColor, NSParagraphStyleAttributeName: text2Style]

        let text2TextHeight: CGFloat = text2TextContent.boundingRectWithSize(CGSizeMake(text2Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: text2FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, text2Rect);
        text2TextContent.drawInRect(CGRectMake(text2Rect.minX, text2Rect.minY + (text2Rect.height - text2TextHeight) / 2, text2Rect.width, text2TextHeight), withAttributes: text2FontAttributes)
        CGContextRestoreGState(context)


        //// Text 3 Drawing
        let text3Rect = CGRectMake(201, 110, 38, 40)
        var text3TextContent = NSString(string: "3")
        let text3Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        text3Style.alignment = NSTextAlignment.Center

        let text3FontAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 25)!, NSForegroundColorAttributeName: numbersColor, NSParagraphStyleAttributeName: text3Style]

        let text3TextHeight: CGFloat = text3TextContent.boundingRectWithSize(CGSizeMake(text3Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: text3FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, text3Rect);
        text3TextContent.drawInRect(CGRectMake(text3Rect.minX, text3Rect.minY + (text3Rect.height - text3TextHeight) / 2, text3Rect.width, text3TextHeight), withAttributes: text3FontAttributes)
        CGContextRestoreGState(context)


        //// Text 4 Drawing
        let text4Rect = CGRectMake(22, 110, 38, 40)
        var text4TextContent = NSString(string: "9")
        let text4Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        text4Style.alignment = NSTextAlignment.Center

        let text4FontAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 25)!, NSForegroundColorAttributeName: numbersColor, NSParagraphStyleAttributeName: text4Style]

        let text4TextHeight: CGFloat = text4TextContent.boundingRectWithSize(CGSizeMake(text4Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: text4FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, text4Rect);
        text4TextContent.drawInRect(CGRectMake(text4Rect.minX, text4Rect.minY + (text4Rect.height - text4TextHeight) / 2, text4Rect.width, text4TextHeight), withAttributes: text4FontAttributes)
        CGContextRestoreGState(context)


        //// Text 13 Drawing
        let text13Rect = CGRectMake(99, 144, 62, 34)
        let text13Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        text13Style.alignment = NSTextAlignment.Center

        let text13FontAttributes = [NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!, NSForegroundColorAttributeName: numbersColor, NSParagraphStyleAttributeName: text13Style]

        let text13TextHeight: CGFloat = NSString(string: expression).boundingRectWithSize(CGSizeMake(text13Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: text13FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, text13Rect);
        NSString(string: expression).drawInRect(CGRectMake(text13Rect.minX, text13Rect.minY + (text13Rect.height - text13TextHeight) / 2, text13Rect.width, text13TextHeight), withAttributes: text13FontAttributes)
        CGContextRestoreGState(context)
    }

    public class func drawClockPlayground(#hours: CGFloat, minutes: CGFloat, seconds: CGFloat ,color : UIColor ,color2 : UIColor ,color3 : UIColor , color4 : UIColor , color5 : UIColor) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

      

        //// Symbol 3 Drawing
        let symbol3Rect = CGRectMake(0, 0, 100, 100)
        CGContextSaveGState(context)
        UIRectClip(symbol3Rect)
        CGContextTranslateCTM(context, symbol3Rect.origin.x, symbol3Rect.origin.y)
        CGContextScaleCTM(context, symbol3Rect.size.width / 260, symbol3Rect.size.height / 260)

        MClockTimer.drawClock(numbersColor: color4, darkHandsColor: color, lightHandColor: color5, rimColor: color2, tickColor: color4, faceColor: color3, hours: hours, minutes: minutes, seconds: seconds)
        CGContextRestoreGState(context)
    }

}

//@objc protocol StyleKitSettableImage {
//    func setImage(image: UIImage!)
//}
//
//@objc protocol StyleKitSettableSelectedImage {
//    func setSelectedImage(image: UIImage!)
//}
