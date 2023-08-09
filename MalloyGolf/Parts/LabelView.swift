//
//  LabelView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/8/7.
//

import SwiftUI

struct LabelView: View {
    
    var color: Color
    var text:String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(maxWidth: .infinity, maxHeight:1)
                .foregroundColor(color)
            Text(text)
                .foregroundColor(color)
            RoundedRectangle(cornerRadius: 50)
                .frame(maxWidth: .infinity, maxHeight:1)
                .foregroundColor(color)

        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(color: Color.red, text: "Some Text")
    }
}
