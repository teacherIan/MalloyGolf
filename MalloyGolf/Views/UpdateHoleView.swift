//
//  UpdateHoleView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/26.
//

import SwiftUI






struct UpdateHoleView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var hole:Hole
    @ObservedObject var game:Game
    var p1Name:String
    var p2Name:String
    var p3Name:String
    var p4Name:String
    
    let possibleScoreArray = [0,1,2,3,4,5,6,7,8,9,10]
    
    let possibleParArray = [3,4,5]
    
    
    
    @State var p1Score: Int
    @State var p2Score: Int
    @State var p3Score: Int
    @State var p4Score: Int
    @State var par: Int
    
    
    
    
    
    var body: some View {
        
//        NavigationView {
            
            VStack {
                
                LabelView(color: .blue, text: "Par")
                Picker("Par Picker", selection: $par) {
                    ForEach(possibleParArray, id:\.self) { number in
                        Text(String(number))

                        
                        
                    }

                    
                }
                .pickerStyle(.segmented)
                .onChange(of: par) { newValue in
                    hole.par = Int16(par)
                    try? moc.save()
                    game.objectWillChange.send()
                    
                }
                
                
                
    
                VStack {
                    LabelView(color: .blue, text: "Scores")
                    HStack {
                        
                        UpdateHoleViewNameText(name: p1Name)
                        Picker(selection: $p1Score) {
//                            Text(String(hole.p1Score)).tag(hole.p1Score)
                            ForEach(possibleScoreArray, id:\.self) {
                                Text(String($0))
                                    .foregroundColor($0 > par ? .red : $0 == par ? .black : .blue)
                                
                                
                            }
                        } label: {
                            Text("Select p1 score")
                        }
                        .pickerStyle(.wheel)
                        .onChange(of: p1Score){ newValue in
                            hole.p1Score = Int16(newValue)
                            print(moc.hasChanges)
                            
                            do {
                                try moc.save()
                                print("Saved")
                                
                                game.objectWillChange.send()
                            }
                            catch {
                                print("error")
                            }
                            
                        }
                        
                        
                    }
                    
                    if(game.playersActive > 1) {
                        VStack {
                            HStack {
                                UpdateHoleViewNameText(name: p2Name)
                                Picker(selection: $p2Score) {
                                    //                            Text(String(hole.p2Score)).tag(hole.p2Score)
                                    ForEach(possibleScoreArray, id:\.self) {
                                        Text(String($0))
                                            .foregroundColor($0 > par ? .red : $0 == par ? .black : .blue)
                                        
                                        
                                    }
                                } label: {
                                    Text("Select p2 score")
                                }
                                .pickerStyle(.wheel)
                                .onChange(of: p2Score){ newValue in
                                    hole.p2Score = Int16(newValue)
                                    print(moc.hasChanges)
                                    
                                    do {
                                        try moc.save()
                                        print("Saved")
                                        
                                        game.objectWillChange.send()
                                    }
                                    catch {
                                        print("error")
                                    }
                                    
                                }
                            }
                            
                            
                        }
                    }
                    
                    if(game.playersActive > 2) {
                        
                        VStack {
                            HStack {
                                UpdateHoleViewNameText(name: p3Name)
                                
                                Picker(selection: $p3Score) {
                                    //                            Text(String(hole.p3Score)).tag(hole.p3Score)
                                    ForEach(possibleScoreArray, id:\.self) {
                                        Text(String($0))
                                            .foregroundColor($0 > par ? .red : $0 == par ? .black : .blue)
                                        
                                        
                                    }
                                } label: {
                                    Text("Select p3 score")
                                }
                                .pickerStyle(.wheel)
                                .onChange(of: p3Score){ newValue in
                                    hole.p3Score = Int16(newValue)
                                    print(moc.hasChanges)
                                    
                                    do {
                                        try moc.save()
                                        print("Saved")
                                        game.objectWillChange.send()
                                    }
                                    catch {
                                        print("error")
                                    }
                                    
                                }
                            }
                            
                            
                        }
                    }
                    
                    if(game.playersActive > 3) {
                        
                        VStack {
                            HStack {
                                UpdateHoleViewNameText(name: p4Name)
                                
                                Picker(selection: $p4Score) {
                                    //                            Text(String(hole.p4Score)).tag(hole.p4Score)
                                    ForEach(possibleScoreArray, id:\.self) {
                                        Text(String($0))
                                            .foregroundColor($0 > par ? .red : $0 == par ? .black : .blue)
                                        
                                        
                                    }
                                } label: {
                                    Text("Select p1 score")
                                }
                                .pickerStyle(.wheel)
                                .onChange(of: p4Score){ newValue in
                                    hole.p4Score = Int16(newValue)
                                    print(moc.hasChanges)
                                    
                                    do {
                                        try moc.save()
                                        print("Saved")
                                        game.objectWillChange.send()
                                    }
                                    catch {
                                        print("error")
                                    }
                                    
                                }
                            }
                            
                            
                        }
                    }
                    
                    
                }
                
                .navigationTitle("Hole \(hole.number + 1)")
//                Spacer()
            }
            
        }
    }
    
//}

//struct UpdateHoleView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateHoleView()
//    }
//}
