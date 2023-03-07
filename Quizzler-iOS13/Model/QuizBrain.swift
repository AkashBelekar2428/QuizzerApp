//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Akash Belekar on 07/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    var questionArray = [
        Question(q: "Two + Three is equal to Five", a: "True"),
        Question(q: "One + One is equal to Three", a: "False"),
        Question(q: "Ten - Five is equal to Five", a: "True")
    ]
    var questionNumber = 0
    var score = 0
    
    mutating func CheckAnswer(userAnswer:String) -> Bool{
        
        if userAnswer == questionArray[questionNumber].answer{
          score += 1
            return true
        }else{
            return false
        }
    }
    
    func getQuestionText() -> String{
        let question = questionArray[questionNumber].text
        return question
        
    }
    func getProgress() -> Float{
        let progess = Float(questionNumber) / Float(questionArray.count)
        return progess
        
    }
    mutating  func nextQuestion(){
        if questionNumber + 1 < questionArray.count{
            questionNumber += 1
        }
        else{
            questionNumber = 0
            score = 0
        }
    }
    func getScrore() -> Int{
        return score
        
    }
    
}
