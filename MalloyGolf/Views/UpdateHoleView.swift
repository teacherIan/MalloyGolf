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
    
    
    
    @State var p1Score: Int = 0
    @State var p2Score: Int = 0
    @State var p3Score: Int = 0
    @State var p4Score: Int = 0
    @State var par: Int = 3
    
    
    
    func updateDB(player:Int16) {
        
    }
    
    
    
    
    var body: some View {
        
        NavigationView {
            
            
            
            VStack {
                
                Text("Par")
                Picker("Par Picker", selection: $par) {
                    ForEach(possibleParArray, id:\.self) { number in
                        Text(String(number))

                        
                        
                    }

                    
                }
                .onChange(of: par) { newValue in
                    hole.par = Int16(par)
                    try? moc.save()
                    game.objectWillChange.send()
                    
                }
    
                HStack {
                    VStack {
                        
                        Text(p1Name)
                        Picker(selection: $p1Score) {
                            Text(String(hole.p1Score)).tag(hole.p1Score)
                            ForEach(possibleScoreArray, id:\.self) {
                                Text(String($0))
                                
                                
                            }
                        } label: {
                            Text("Select p1 score")
                        }
                        .pickerStyle(.automatic)
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
                    
                    
                    VStack {
                        
                        Text(p2Name)
                        Picker(selection: $p2Score) {
                            Text(String(hole.p2Score)).tag(hole.p2Score)
                            ForEach(possibleScoreArray, id:\.self) {
                                Text(String($0))
                                
                                
                            }
                        } label: {
                            Text("Select p2 score")
                        }
                        .pickerStyle(.automatic)
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
                    
                    VStack {
                        
                        Text(p3Name)
                        Picker(selection: $p3Score) {
                            Text(String(hole.p3Score)).tag(hole.p3Score)
                            ForEach(possibleScoreArray, id:\.self) {
                                Text(String($0))
                                
                                
                            }
                        } label: {
                            Text("Select p3 score")
                        }
                        .pickerStyle(.automatic)
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
                    
                    VStack {
                        
                        Text(p4Name)
                        Picker(selection: $p4Score) {
                            Text(String(hole.p4Score)).tag(hole.p4Score)
                            ForEach(possibleScoreArray, id:\.self) {
                                Text(String($0))
                                
                                
                            }
                        } label: {
                            Text("Select p1 score")
                        }
                        .pickerStyle(.automatic)
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
                
                .navigationTitle("Hole \(hole.number + 1)")
                Spacer()
            }
            
        }
    }
    
}

//struct UpdateHoleView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateHoleView()
//    }
//}
