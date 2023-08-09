//
//  AddHoleView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/22.
//

import SwiftUI

struct AddHoleView: View {
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var game:Game
    
    
    
    var p1BaseScore: Int16
    var p2BaseScore: Int16
    var p3BaseScore: Int16
    var p4BaseScore: Int16
    var p1Name: String
    var p2Name: String
    var p3Name: String
    var p4Name: String
    var currentHole: Int16
    
    
    @State var p1HoleScore: Int = 0
    @State var p2HoleScore: Int = 0
    @State var p3HoleScore: Int = 0
    @State var p4HoleScore: Int = 0
    @State var par:Int = 4
    @State var viewScoreCard: Bool = false
    

    var body: some View {
        
        
        
        NavigationStack {
            
            Form {
                Section {
                    Picker("Par", selection: $par) {
                        ForEach(3..<6) {
                            Text(String($0)).tag(game.wrappedHoleArray[Int(currentHole)].par)
                        }
                    }
                } header: {
                    Text("Select Par")
                }
            }
            


                Grid {
//                    Divider()
                    
                    Section {
                        
                        GridRow {
                            Text(p1Name)
                            Text(p2Name)
                            Text(p3Name)
                            Text(p4Name)
                            
                        }.frame(height: 50)
                        //                    .padding(.top, 10)
                        //                    .rotationEffect(.degrees(90))
                        
                        Divider()
                    }header: {
                        Text("Scores")
                            .fontWeight(.bold)
                    }
                    
                    GridRow {
                        Text(String(p1BaseScore + Int16(p1HoleScore)))
                        Text(String(p2BaseScore + Int16(p2HoleScore)))
                        Text(String(p3BaseScore + Int16(p3HoleScore)))
                        Text(String(p4BaseScore + Int16(p4HoleScore)))
                    }
                    Divider()
                    
                    Section {
                        Divider()
                        GridRow {
                            Picker(String(p1BaseScore),selection: $p1HoleScore) {
                                ForEach(0..<11, id:\.self) {
                                    Text(String($0))
                                }
                            }
                            
                            Picker("0",selection: $p2HoleScore) {
                                ForEach(0..<11, id:\.self) {
                                    Text(String($0))
                                }
                            }
                            
                            Picker("0",selection: $p3HoleScore) {
                                ForEach(0..<11, id:\.self) {
                                    Text(String($0))
                                }
                            }
                            
                            Picker("0",selection: $p4HoleScore) {
                                ForEach(0..<11, id:\.self) {
                                    Text(String($0))
                                }
                            }
                            
                        }
                        
                    }header: {
                        Text("Hole")
                            .fontWeight(.bold)
                    }
//                    Divider()
                    Spacer()
                    

//                    Button("Next Hole") {
//                        let hole = Hole(context: moc)
//                        hole.id = UUID()
//                        hole.number = currentHole
//                        hole.game = game
//                        hole.p1Score = Int16(p1HoleScore + Int(p1BaseScore))
//                        hole.p2Score = Int16(p2HoleScore + Int(p2BaseScore))
//                        hole.p3Score = Int16(p3HoleScore + Int(p3BaseScore))
//                        hole.p4Score = Int16(p3HoleScore + Int(p3BaseScore))
//                        hole.par = Int16(par)
//
//                        try? moc.save()
//
//                        NavigationLink(destination: AddHoleView(game: game, p1BaseScore: Int16(p1HoleScore + Int(p1BaseScore)), p2BaseScore: Int16(p2HoleScore + Int(p2BaseScore)), p3BaseScore: Int16(p3HoleScore + Int(p3BaseScore)), p4BaseScore: Int16(p3HoleScore + Int(p3BaseScore)), p1Name: p1Name, p2Name: p2Name, p3Name: p3Name, p4Name: p4Name, currentHole: currentHole + 1)) {
//                            Text("Next Hole")
//
//                        }
//
//
//
//
//                    }
                    
                    
                        
                        
                    
                    
                    
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("View Score Card") {
                                viewScoreCard.toggle()
                            }
                            
                        }
                        
                        ToolbarItem(placement: .bottomBar) {
                            
                            
                            NavigationLink(destination: AddHoleView(game: game, p1BaseScore: Int16(p1HoleScore + Int(p1BaseScore)), p2BaseScore: Int16(p2HoleScore + Int(p2BaseScore)), p3BaseScore: Int16(p3HoleScore + Int(p3BaseScore)), p4BaseScore: Int16(p3HoleScore + Int(p3BaseScore)), p1Name: p1Name, p2Name: p2Name, p3Name: p3Name, p4Name: p4Name, currentHole: currentHole + 1)) {
                             Text("Hello")
                                    
                            }
                            
//                            let hole = Hole(context: moc)
//                            hole.id = UUID()
//                            hole.number = currentHole
//                            hole.game = game
//                            hole.p1Score = Int16(p1HoleScore + Int(p1BaseScore))
//                            hole.p2Score = Int16(p2HoleScore + Int(p2BaseScore))
//                            hole.p3Score = Int16(p3HoleScore + Int(p3BaseScore))
//                            hole.p4Score = Int16(p3HoleScore + Int(p3BaseScore))
//                            hole.par = Int16(par)
//
//                            print("Saved")
//
//                            try? moc.save()
                            
                            }
                            
                
                            
                        }
                        
                        
                        
                    }
                    .sheet(isPresented: $viewScoreCard) {
                        
                    }
                    
                }.navigationTitle("Hole \(currentHole)")
        }
    }
    


struct AddHoleView_Previews: PreviewProvider {
    static var previews: some View {
        AddHoleView(game:Game(), p1BaseScore: 10, p2BaseScore: 20, p3BaseScore: 100, p4BaseScore: 120, p1Name: "Ian The Man", p2Name: "Corey", p3Name: "Steven", p4Name: "Allen", currentHole: 5)
    }
}
