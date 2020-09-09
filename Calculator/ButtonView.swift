//
//  ButtonView.swift
//  Calculator
//
//  Created by Brandon Trimm on 2020-08-14.
//  Copyright © 2020 BrandonTrimm. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var text:String
    
    var body: some View {
        
        Button(action: {
            
            self.addToNums("+")
             
        }) {
            Text("+")
            .foregroundColor(.white)
            .padding(.all, 20)
            .padding([.leading, .trailing], 20)
            .background(Color.white.opacity(0.2))
            .cornerRadius(20)
            .font(.system(size: 20))
        }
        
    }
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: Binding.constant("0"))
    }
}
