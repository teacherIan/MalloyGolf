//
//  CreateNewGameView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/21.
//

import SwiftUI

struct CreateNewGameView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @State var showingGameCreatedAlert: Bool = false
    
    @State var courseName: String = ""
    @State var startTime: Date = Date.now
    @State var playersActive = 1
    @State var p1Name:String = "Ian"
    @State var p2Name:String = ""
    @State var p3Name:String = ""
    @State var p4Name:String = ""
    @State var notes: String = ""
    @State var isScreenGolf:Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Form {
                    Section {
                        LabeledContent {
                            TextField("", text: $courseName)
                        } label: {
                            Text("Name: ")
                        }

                        DatePicker("Start Time:", selection: $startTime)
                        
                        Toggle("Screen Golf:", isOn: $isScreenGolf)
                    } header: {
                        Text("Course Information")
                    }
                    
                    Section {
                        Picker("Number of Players:", selection: $playersActive) {
                            ForEach(1..<5, id: \.self){
                                Text(String($0))
                            }
                        }
                        
                        
                        LabeledContent {
                            TextField("Player One Name", text: $p1Name)
                        } label: {
                            Text("p1 Name:")
                        }
                        
                        if playersActive == 2 {
                            LabeledContent {
                                TextField("Player Two Name", text: $p2Name)
                            } label: {
                                Text("p2 Name:")
                            }
                        }
                        
                        if playersActive == 3 {
                            LabeledContent {
                                TextField("Player Two Name", text: $p2Name)
                            } label: {
                                Text("p2 Name:")
                            }
                            
                            LabeledContent {
                                TextField("Player Three Name", text: $p3Name)
                            } label: {
                                Text("p3 Name:")
                            }
                        }
                        
                        if playersActive == 4 {
                            LabeledContent {
                                TextField("Player Two Name", text: $p2Name)
                            } label: {
                                Text("p2 Name:")
                            }
                            
                            LabeledContent {
                                TextField("Player Three Name", text: $p3Name)
                            } label: {
                                Text("p3 Name:")
                            }
                            
                            LabeledContent {
                                TextField("Player Four Name", text: $p4Name)
                            } label: {
                                Text("p4 Name:")
                            }
                        }
                        
                        //MARK: - End Create Players
                        

                        
                    } header: {
                        Text("Player Information")

                    }
                    
                    Section {
                        TextEditor(text: $notes)
                            .frame(height:100)
                    } header: {
                        Text("Notes")
                    }
                }
                
                Button("Save") {
                    
                    let game = Game(context: moc)
                    game.courseName = courseName
                    game.startTime = startTime
                    game.date = Date.now
                    game.id = UUID()
                    game.gameNotes = notes
                    game.p1Name = p1Name
                    game.p2Name = p2Name
                    game.p3Name = p3Name
                    game.p4Name = p4Name
                    game.active = true
                    game.screenGolf = isScreenGolf
                    game.p1Score = 0
                    game.p2Score = 0
                    game.p3Score = 0
                    game.p4Score = 0
                    game.currentHole = 1
                    game.playersActive = Int16(playersActive)
                    
                    for i in 0..<18 {
                        let hole = Hole(context: moc)
                        hole.game = game
                        hole.id = UUID()
                        hole.number = Int16(i)
                        hole.par = Int16(3)
                        hole.p1Score = Int16(0)
                        hole.p2Score = Int16(0)
                        hole.p3Score = Int16(0)
                        hole.p3Score = Int16(0)
                        game.addToHole(hole)
                    }
                    
                    
                        do {
                            try moc.save()
                            showingGameCreatedAlert.toggle()
                            
                            
                        } catch {
                            print("Error")
                        }
                }
                .alert("Game Successfully Created", isPresented: $showingGameCreatedAlert) {
                    Button("OK") {
                        dismiss()
                    }
                }
            }.navigationTitle("Create New Game")
            
        }
    }
}

struct CreateNewGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewGameView()
    }
}
