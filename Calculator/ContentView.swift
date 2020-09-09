//
//  ContentView.swift
//  Calculator
//
//  Created by Brandon Trimm on 2020-08-14.
//  Copyright © 2020 BrandonTrimm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numsAndOperators = ["                      0                      ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "-", "x", "/", ".", "=", "   Cancel   "]
    @State private var opers = ["plus.slash.minus", "divide", "multiply", "minus", "plus", "equal"]
    @State private var answer = 0
    @State private var curNum = ""
    @State private var nums = [String]()
    @State private var oper = ""
    
    var body: some View {
        
        ZStack {
            
            // Black background
            Rectangle().foregroundColor(.black)
            .edgesIgnoringSafeArea(.all)
            
            
            VStack (spacing: 5) {

                // Answer text
                Text("\(answer)")
                .foregroundColor(.white)
                .padding(.all, 10)
                .padding([.leading, .trailing], 40)
                .background(Color.white.opacity(0.1))
                .cornerRadius(10)
                .font(.custom("", size: 40))
                
                Spacer().frame(height: 10)
                
                
                HStack {
                    
                    Spacer()
                    
                    // Cancel button
                    Button(action: {
                        
                        // Reset everything
                        self.nums = []
                        self.curNum = ""
                        self.answer = 0
                        self.oper = ""
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[16])
                    }
                    
                    Spacer()
                    
                    // Negate button
                    Button(action: {
                        
                        self.negateNum()

                    }) {
                        ImageForButtons(text: $opers[0])
                    }
                    
                    // Division button
                    Button(action: {
                        
                        self.oper = "/"
                        self.curNum = ""

                    }) {
                        ImageForButtons(text: $opers[1])
                    }
                
                    Spacer()
                    
                }
                
                HStack {
                    
                    Button(action: {
                        
                        self.addToCurNum("7")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[7])
                    }
                    
                    Button(action: {
                        
                        self.addToCurNum("8")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[8])
                    }
                    
                    Button(action: {
                        
                        self.addToCurNum("9")
                        
                    }) {
                        TextForButtons(text: $numsAndOperators[9])
                    }
                    
                    // Multiplication button
                    Button(action: {
                        
                        self.oper = "x"
                        self.curNum = ""

                    }) {
                        ImageForButtons(text: $opers[2])
                    }
                    
                }
                
                HStack {
                    
                    Button(action: {
                        
                        self.addToCurNum("4")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[4])
                    }
                    
                    Button(action: {
                        
                        self.addToCurNum("5")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[5])
                    }
                    
                    Button(action: {
                        
                        self.addToCurNum("6")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[6])
                    }
                    
                    // Subtraction button
                    Button(action: {
                        
                        self.oper = "-"
                        self.curNum = ""
                         
                    }) {
                        ImageForButtons(text: $opers[3])
                    }
                    
                }

                HStack {
                    
                    Button(action: {
                        
                        self.addToCurNum("1")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[1])
                    }
                    
                    Button(action: {
                        
                        self.addToCurNum("2")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[2])
                    }
                    
                    Button(action: {
                        
                        self.addToCurNum("3")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[3])
                    }
                    
                    // Addition button
                    Button(action: {
                        
                        self.oper = "+"
                        self.curNum = ""
                        
                    }) {
                        ImageForButtons(text: $opers[4])
                    }
                    
                }

                HStack {
                    
                    Button(action: {
                        
                        self.addToCurNum("0")
                         
                    }) {
                        TextForButtons(text: $numsAndOperators[0])
                    }
                    
                    // Equals button
                    Button(action: {
                        
                        self.equalsPressed()
                         
                    }) {
                        ImageForButtons(text: $opers[5])
                    }
                    
                }
                
            }
            
        }
        
    }
    
    // Add the button pressed to the operation
    func addToCurNum(_ num: String) {
        //print("ADD")
        // TODO: Implement decimal numbers
        if num == "." {
            if curNum.contains(".") {
                curNum += num
            }
            else {
                return
            }
        }
        // Checks that current number does not exceed 16 characters
        else if curNum.count > 17{
            return
        }
        else {
            curNum += String(num)
            //print(curNum)
        }
        
        addToNums()
        
    }
    
    // Negates the current number
    func negateNum() {
        
        // Checks whether or not the current number is negated already or not
        if curNum.contains("-") {
            curNum.remove(at: curNum.startIndex)
        }
        else {
            curNum = "-" + curNum
        }

        addToNums()
        
    }
    
    // Adds pressed number to current number
    func addToNums() {
        
        //print(curNum)
        if oper == "" && nums.count == 0 {
            nums.append(curNum)
        }
        else if oper == "" {
            nums[0] = curNum
        }
        else if oper != "" && nums.count == 1{
            nums.append(curNum)
        }
        else {
            nums[1] = curNum
        }
        
        // Sets number being shown to the current number
        answer = Int(curNum)!
    }
    
    // Equals button was pressed
    func equalsPressed() {
        
        //print(nums)
        
        // Checks what operator has been pressed, if any
        if oper == "+" {
            answer = Int(nums[0])! + Int(nums[1])!
        }
        else if oper == "-" {
            answer = Int(nums[0])! - Int(nums[1])!
        }
        else if oper == "x" {
            answer = Int(nums[0])! * Int(nums[1])!
        }
        else if oper == "/" {
            answer = Int(nums[0])! / Int(nums[1])!
        }
        else {
            answer = Int(curNum)!
            return
        }
        
        // Allows for continuation of calculations
        //print(nums)
        nums[0] = String(answer)
        oper = ""
        nums[1] = ""
        curNum = ""
        //print(nums)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
