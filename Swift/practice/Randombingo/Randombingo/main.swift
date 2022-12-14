//
//  main.swift
//  Randombingo
//
//  Created by 강동현 on 2022/12/04.
//

import Foundation




var computerChoice = Int.random(in: 1...100)


var myChoice: Int = 0


while true {
    var userInput = readLine()
    
    
    if let input = userInput{
        if let number = Int(input) {
            myChoice = number
        }
    }
    
    if (myChoice == computerChoice){
        
        print("정답 \(myChoice)")
        break
    } else if (myChoice > computerChoice) {
        print("다운")
        
    } else {
        print("업")
    }
    
}



