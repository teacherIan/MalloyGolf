//
//  ContentView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var games: FetchedResults<Game>
    
    @State var myDate: Date = Date.now
    
    
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
            let game = games[offset]
            moc.delete(game)
        }
        try? moc.save()
    }
    
    
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                // Games
                List {
                    Section {
                        ForEach(games, id: \.self){ game in
                            if(game.active) {
//                                NavigationLink( destination:
//                                                    AddHoleView(game: game, p1BaseScore: game.p1Score, p2BaseScore: game.p2Score, p3BaseScore: game.p3Score, p4BaseScore: game.p4Score, p1Name: game.wrappedP1Name, p2Name: game.wrappedP2Name, p3Name: game.wrappedP3Name, p4Name: game.wrappedp4Name, currentHole: game.currentHole)) {
//                                    Text(game.wrappedCourseName)
//                                }
                                
                                NavigationLink(destination: StatisticsView(game:game)){
                                    Text(game.wrappedCourseName)
                                        
                                }
                                
                                
                            }
                            
                        }.onDelete(perform: deleteItem)
                        
                    } header: {
                        Text("Active Games")
                    }
                    
                    
                    Section {
                        
                        
                        NavigationLink(destination: CreateNewGameView()) {
                            Text("Create New Game")
                        }
                        
                        
                        NavigationLink(destination: HistoryView()) {
                            Text("View History")
                        }
                        
//                        NavigationLink(destination: StatisticsView(game:game)) {
//                            Text("View Statistics")
//                        }
                        
                        NavigationLink(destination: GolfTipsView()) {
                            Text("View Tips")
                        }
                    } header: {
                        Text("Options")
                    }
                }
                
                
                
            }
            .navigationTitle("Main Menu")
            
            

            
        }
        

    }
    

    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
