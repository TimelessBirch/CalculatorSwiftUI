//
//  TextForButtons.swift
//  Calculator
//
//  Created by Brandon Trimm on 2020-08-14.
//  Copyright © 2020 BrandonTrimm. All rights reserved.
//

import SwiftUI

struct TextForButtons: View {
    
    @Binding var text:String
    
    var body: some View {
        Text("\(text)")
        .foregroundColor(.white)
        .padding(.all, 20)
        .padding([.leading, .trailing], 20)
        .background(Color.white.opacity(0.2))
        .cornerRadius(20)
        .font(.system(size: 20))
    }
}

struct TextForButtons_Previews: PreviewProvider {
    static var previews: some View {
        TextForButtons(text: Binding.constant("0"))
    }
}
