//
//  MRandomNumberGenerator.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/20/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MRandomNumberGenerator: NSObject {
    
    func genRandomNumber(numberOne : UInt32 , numberTwo : UInt32)->Int{
        let ranNo : Int = Int(arc4random_uniform(numberTwo)+numberOne)
        return ranNo
    }
    
    func genRandomAnswerForDivided() -> Int {
        let propbilityIsAnswerCorrect : Int = Int(arc4random_uniform(2)+0)
        return propbilityIsAnswerCorrect
    }
    
    func genRandomAnswer(numberOne : UInt32)-> Int{
        let ranAnswer : Int = Int(arc4random_uniform(numberOne)+0)
        return ranAnswer
    }
    
}
