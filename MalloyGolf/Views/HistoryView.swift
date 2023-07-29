//
//  HistoryView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/21.
//

import SwiftUI

struct HistoryView: View {
    
    @FetchRequest( sortDescriptors: []) var games: FetchedResults<Game>
    
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        NavigationView {
            List {
            ForEach(games, id:\.id){ game in
                
                    NavigationLink(destination: GameView(game: game)) {
                        Text(game.wrappedCourseName)
                        
                    }
            }.onDelete(perform: delete)
            }
        }
        
    }
    
    func delete(offsets: IndexSet) {
        for offset in offsets {
            let game = games[offset]
            moc.delete(game)
            
            try? moc.save()
        }
    }
    
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
