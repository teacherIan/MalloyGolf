//
//  UpdateHoleViewNameText.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/8/12.
//

import SwiftUI

struct UpdateHoleViewNameText: View {
    var name:String
    
    
    var body: some View {
        Text(name)
            .frame(width:80)
            .fontWeight(.bold)
            
    }
}

struct UpdateHoleViewNameText_Previews: PreviewProvider {
    static var previews: some View {
        UpdateHoleViewNameText(name:"Ian")
    }
}
