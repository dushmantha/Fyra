//
//  MSetArithmaticOperation.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/24/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MSetArithmaticOperation: NSObject {
    //MARK:- Set Arithmatic Operator.
    func setClaculationTypeArithmaticOperatorForGame(calculationType :String)->UIImage{
        let addImages = MSAddImages();
          var image : UIImage!
        var imageDict : Dictionary =  addImages.addImagesForArithmetic()
            if(calculationType == "+"){
             image  = imageDict["imgPlus"]!
        }
        else if (calculationType == "-"){
             image = imageDict["imgMinus"]!
        }
        else if (calculationType == "*"){
             image  = imageDict["imgMultiple"]!
        }
        else if (calculationType == "/"){
             image  = imageDict["imgDivision"]!
        }
        return image
    }
}
