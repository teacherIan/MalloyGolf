//
//  GameView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/22.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var game:Game
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Hole \(game.wrappedHoleArray.count + 1)")
        }

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game:Game())
    }
}
