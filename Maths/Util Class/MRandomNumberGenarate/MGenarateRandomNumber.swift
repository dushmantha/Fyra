//
//  MGenarateRandomNumber.swift
//  Maths
//
//  Created by Tharaka Dushmantha on 7/24/15.
//  Copyright (c) 2015 Tharaka Dushmantha. All rights reserved.
//

import UIKit

class MGenarateRandomNumber: NSObject {
       var randomNumberGen : MRandomNumberGenerator = MRandomNumberGenerator()
       var isRightAnswer : Int = 2
    
    func genareteRandomNumber(calculationType : String , gameType : String , gameStage : String)->(numberOneValue : String , numberTwoValue : String , numberThreeValue : String , checkRightAnswer : Int){
        var noOneValue : String!
        var noTwoValue : String!
        var answerValue : String!
        isRightAnswer = randomNumberGen.genRandomAnswerForDivided()
        var answer : Int
        if(isRightAnswer == 0){
            if(gameType  == "junior"){
                var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 20, numberTwoParameeterOne: 1, calculationType: calculationType)
                noOneValue = getRandomNumberValue.numberOneValue
                noTwoValue = getRandomNumberValue.numberTwoValue
                answerValue = String(randomNumberGen.genRandomAnswer(80))
            }
            
            else if(gameType == "teen"){
                var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 40, numberTwoParameeterOne: 1, calculationType: calculationType)
                noOneValue = getRandomNumberValue.numberOneValue
                noTwoValue = getRandomNumberValue.numberTwoValue
                answerValue = String(randomNumberGen.genRandomAnswer(200))
            }
            
            else if(gameType == "senior"){
                var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 60, numberTwoParameeterOne: 1, calculationType: calculationType)
                noOneValue = getRandomNumberValue.numberOneValue
                noTwoValue = getRandomNumberValue.numberTwoValue
                answerValue = String(randomNumberGen.genRandomAnswer(100))
            }

        }
        else{
            if(gameType  == "junior"){
                 if ((calculationType == "*") || (calculationType == "/")){
                    var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 10, numberTwoParameeterOne: 1, calculationType: calculationType)
                    noOneValue = getRandomNumberValue.numberOneValue
                    noTwoValue = getRandomNumberValue.numberTwoValue
                    answerValue = getRandomNumberValue.numberThreeValue
                }
                 else{
                    var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 50, numberTwoParameeterOne: 1, calculationType: calculationType)
                    noOneValue = getRandomNumberValue.numberOneValue
                    noTwoValue = getRandomNumberValue.numberTwoValue
                    answerValue = getRandomNumberValue.numberThreeValue
                }
            }
                
            else if(gameType == "teen"){
            if ((calculationType == "*") || (calculationType == "/")){
                var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 15, numberTwoParameeterOne: 1, calculationType: calculationType)
                noOneValue = getRandomNumberValue.numberOneValue
                noTwoValue = getRandomNumberValue.numberTwoValue
                answerValue = getRandomNumberValue.numberThreeValue
                }
            else{
                var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 80, numberTwoParameeterOne: 1, calculationType: calculationType)
                noOneValue = getRandomNumberValue.numberOneValue
                noTwoValue = getRandomNumberValue.numberTwoValue
                answerValue = getRandomNumberValue.numberThreeValue
                }
            }
                
            else if(gameType == "senior"){
            if ((calculationType == "*") || (calculationType == "/")){
                var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 10, numberTwoParameeterOne: 1, calculationType: calculationType)
                noOneValue = getRandomNumberValue.numberOneValue
                noTwoValue = getRandomNumberValue.numberTwoValue
                answerValue = getRandomNumberValue.numberThreeValue
                }
                else{
                var getRandomNumberValue  = self.genRandomNumber(1, numberOneParameeterTwo: 80, numberTwoParameeterOne: 1, calculationType: calculationType)
                noOneValue = getRandomNumberValue.numberOneValue
                noTwoValue = getRandomNumberValue.numberTwoValue
                answerValue = getRandomNumberValue.numberThreeValue
                }
            }
      }
        return ( noOneValue, noTwoValue, answerValue , isRightAnswer)
    }
    
    func genRandomNumber(numberOneParameeterOne : Int , numberOneParameeterTwo : Int , numberTwoParameeterOne : Int  , calculationType : String) ->(numberOneValue : String , numberTwoValue : String , numberThreeValue : String){
        var noOneValue : String!
        var noTwoValue : String!
        var answerValue : String!
       var answer : Int = 0
        
        if(calculationType == "/"){
            answer = randomNumberGen.genRandomNumber(UInt32(numberOneParameeterOne), numberTwo: UInt32(numberOneParameeterTwo))
            var numberTwo : Int = randomNumberGen.genRandomNumber(UInt32(numberTwoParameeterOne), numberTwo: UInt32(answer))
            var numberOne : Int = numberTwo * answer
            noOneValue = String(numberOne)
            noTwoValue = String(numberTwo)
            answerValue = String(answer)
        }
        else{
            var numberOne : Int = randomNumberGen.genRandomNumber(UInt32(numberOneParameeterOne), numberTwo: UInt32(numberOneParameeterTwo))
            var numberTwo : Int = randomNumberGen.genRandomNumber(UInt32(numberTwoParameeterOne), numberTwo: UInt32(numberOne))
                if(calculationType == "+"){
                    answer = numberOne + numberTwo
            }
            else if (calculationType == "-"){
                    answer = numberOne - numberTwo
            }
                else if (calculationType == "*"){
                    answer = numberOne * numberTwo
            }
            noOneValue = String(numberOne)
            noTwoValue = String(numberTwo)
            answerValue = String(answer)
        }
        return ( noOneValue, noTwoValue, answerValue )
    }
    
}
