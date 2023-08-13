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
                ScrollView {
                VStack {
                    // Games
                    
                    
                    Section {
                        ForEach(games, id: \.self){ game in
                            if(game.active) {
                                
                                
                                NavigationLink(destination:
                                                
                                                ScoreCardView(game:game)){
                                    TabView(courseName: game.wrappedCourseName, icon: "figure.golf", date: game.date ?? Date.now,isActiveGame: true)
                                    
                                }
                                
                                
                            }
                            
                        }.onDelete(perform: deleteItem)
                        
                    } header: {
                        LabelView(color: .blue, text: "Active Games")
                        
                    }
                    
                    
                    Section {
                        
                        
                        NavigationLink(destination: CreateNewGameView()) {
                            TabView(courseName: "Create New Game", icon: "plus.diamond.fill", date: Date.now, isActiveGame: false)
                        }
                        
                        
                        NavigationLink(destination: HistoryView()) {
                            TabView(courseName: "Manage/View Game History", icon: "fossil.shell.fill", date: Date.now, isActiveGame: false)
                        }
                        
                        
                        NavigationLink(destination: GolfTipsView()) {
                            TabView(courseName: "Tips & Tricks & Videos", icon: "brain.head.profile", date: Date.now, isActiveGame: false)
                        }
                    } header: {
                        LabelView(color: .red, text: "Options")
                    }
                    
                    
                    
                    
                }
                .navigationTitle("Main Menu")
                
                
                
                
            }
            
            
        }
    }

    
}




//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
