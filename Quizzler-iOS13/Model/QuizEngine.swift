//
//  QuizEngine.swift
//  Quizzler
//
//  Created by Prosper Evergreen on 24.06.2020.
//  Copyright © 2020 proSPEC. All rights reserved.
//

import Foundation

struct QuizEngine {
    let queArr = [
        Question(que: "Nigeria is the Capital of Africa", ans: "False"),
        Question(que: "Nigeria is in west of Africa", ans: "True"),
        Question(que: "Nigeria is the most populated country in Africa", ans: "True"),
        Question(que: "Nigeria has only two rivers", ans: "False"),
        Question(que: "Nigeria gained her independence in 1963", ans: "False"),
        Question(que: "Nnamdi Azikiwe was the first president of Nigeria", ans: "True"),
    ]
    var currentQue = 0
    var score = 0
    
    mutating func reset(){
        currentQue = 0
        score = 0
    }
    mutating func incScore(){
        score += 1
    }
    func getScore() -> String {
        return "Score: \(score)"
    }
    
    func getCurrent()->Question{
        return queArr[currentQue]
    }
    
    func getProgress() -> Float {
        return Float(currentQue+1)/Float(queArr.count)
    }
    
    mutating func canGoToNext()->Bool{
        if currentQue < queArr.count - 1{
            currentQue += 1
            return true
        }else{
            return false
        }
    }
}
