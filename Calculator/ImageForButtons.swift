//
//  ImageForButtons.swift
//  Calculator
//
//  Created by Brandon Trimm on 2020-08-15.
//  Copyright © 2020 BrandonTrimm. All rights reserved.
//

import SwiftUI

struct ImageForButtons: View {
    
    @Binding var text:String
    
    var body: some View {
            Image(systemName: text)
            .foregroundColor(.black)
            .padding(.all, 25)
            .padding([.leading, .trailing], 13)
            .background(Color.orange.opacity(0.75))
            .cornerRadius(20)
            .font(.system(size: 20))
    }
}

struct ImageForButtons_Previews: PreviewProvider {
    static var previews: some View {
        ImageForButtons(text: Binding.constant("plus.slash.minus"))
    }
}
