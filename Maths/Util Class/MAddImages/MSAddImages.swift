//
//  MSAddImages.swift
//  Math Speed
//
//  Created by Tharaka Dushmantha on 7/10/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MSAddImages: NSObject {
   
    // ======================================Add Image Icon For Number.=====================================
    func addImagesForNumbers()-> Dictionary <String, UIImage> {
        
        let img0 : UIImage = UIImage(named: "img0")!
        let img1 : UIImage = UIImage(named: "img1")!
        let img2 : UIImage = UIImage(named: "img2")!
        let img3 : UIImage = UIImage(named: "img3")!
        let img4 : UIImage = UIImage(named: "img4")!
        let img5 : UIImage = UIImage(named: "img5")!
        let img6 : UIImage = UIImage(named: "img6")!
        let img7 : UIImage = UIImage(named: "img7")!
        let img8 : UIImage = UIImage(named: "img8")!
        let img9 : UIImage = UIImage(named: "img9")!
        var    numberDictionary :Dictionary = ["0" : img0 , "1" : img1 , "2" : img2 , "3" : img3 , "4" : img4 , "5" : img5 , "6" : img6 , "7" : img7 , "8" : img8 , "9" : img9 ]
        
        return numberDictionary;
        
    }
    
    // ================================Add Image Icon For Arithmetic Operator.===================================
    func addImagesForArithmetic() ->Dictionary<String, UIImage>{
        
        let imgDivision : UIImage = UIImage(named:"icons-34")!
        let imgMinus : UIImage = UIImage(named:"icons-32")!
        let imgMultiple : UIImage = UIImage(named:"icons-33")!
        let imgPlus : UIImage = UIImage(named:"icons-31")!
        let   arithmeticOperator =  ["imgDivision" : imgDivision , "imgMinus" : imgMinus , "imgMultiple" : imgMultiple , "imgPlus" : imgPlus]
        
        return arithmeticOperator;
    }
    
    
}
