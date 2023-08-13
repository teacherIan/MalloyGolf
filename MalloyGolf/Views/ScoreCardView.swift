//
//  StatisticsView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/21.
//

import SwiftUI

struct ScoreCardView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var game: Game
    
    
    
    var p1Score = 0
    
    
    var body: some View {
        
        
        Section {
            List {
                
                ForEach(0..<9, id: \.self) {number in
                    
                    NavigationLink(destination: UpdateHoleView(hole: game.wrappedHoleArray[number], game: game, p1Name: game.wrappedP1Name, p2Name: game.wrappedP2Name, p3Name: game.wrappedP3Name, p4Name: game.wrappedp4Name, p1Score: Int(game.wrappedHoleArray[number].p1Score), p2Score: Int(game.wrappedHoleArray[number].p2Score), p3Score: Int(game.wrappedHoleArray[number].p3Score), p4Score: Int(game.wrappedHoleArray[number].p4Score), par: Int(game.wrappedHoleArray[number].par)))
                    {
                        
                        
                        
                        HStack {
                            Text(String(number + 1))
                                .frame(width: UIScreen.main.bounds.width / 7)
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                            
                            Text(String(game.wrappedHoleArray[number].par))
                                .frame(width: UIScreen.main.bounds.width / 7)
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                            
                            PlayerScoreHoleView(mulligan: false, pScore: Int(game.wrappedHoleArray[number].p1Score), par: Int(game.wrappedHoleArray[number].par))
                            
                            PlayerScoreHoleView(mulligan: false, pScore: Int(game.wrappedHoleArray[number].p2Score), par: Int(game.wrappedHoleArray[number].par))
                            
                            PlayerScoreHoleView(mulligan: false, pScore: Int(game.wrappedHoleArray[number].p3Score), par: Int(game.wrappedHoleArray[number].par))
                            
                            PlayerScoreHoleView(mulligan: false, pScore: Int(game.wrappedHoleArray[number].p4Score), par: Int(game.wrappedHoleArray[number].par))
                        }
                        
                        .navigationTitle("Score Card")
                        
                        
                        
                    }
                    
                } // loop front 9
                
                HStack {
                    
                    NavigationLink(destination: Text("Game")) {
                        Text("1 - 9")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(String(game.parFrontNine))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(String(game.p1FrontNine))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(String(game.playersActive > 1 ? String(game.p2FrontNine) : " "))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(game.playersActive > 2 ? String(game.p3FrontNine) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(game.playersActive > 3 ? String(game.p4FrontNine) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Spacer(minLength: 2)
                    }
                } // front 9 end
                
                HStack {
                    
                    NavigationLink(destination: Text("Game")) {
                        Text("+/-")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text("--")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text( String(game.p1Total - game.parTotal ))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text(game.playersActive > 1 ? String(game.p2Total - game.parTotal ) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text(game.playersActive > 2 ? String(game.p3Total - game.parTotal ) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text(game.playersActive > 3 ? String(game.p3Total - game.parTotal ) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Spacer(minLength: 2)
                    }
                }
                
                
                
                
                ForEach(9..<18, id: \.self) {number in
                    
                    NavigationLink(destination: UpdateHoleView(hole: game.wrappedHoleArray[number], game: game, p1Name: game.wrappedP1Name, p2Name: game.wrappedP2Name, p3Name: game.wrappedP3Name, p4Name: game.wrappedp4Name, p1Score: Int(game.wrappedHoleArray[number].p1Score), p2Score: Int(game.wrappedHoleArray[number].p2Score), p3Score: Int(game.wrappedHoleArray[number].p3Score), p4Score: Int(game.wrappedHoleArray[number].p4Score), par: Int(game.wrappedHoleArray[number].par)))
                    {
                        
                        
                        
                        HStack {
                            Text(String(number + 1))
                                .frame(width: UIScreen.main.bounds.width / 7)
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                            
                            Text(String(game.wrappedHoleArray[number].par))
                                .frame(width: UIScreen.main.bounds.width / 7)
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                            
                            PlayerScoreHoleView(mulligan: false, pScore: Int(game.wrappedHoleArray[number].p1Score), par: Int(game.wrappedHoleArray[number].par))
                            
                            PlayerScoreHoleView(mulligan: false, pScore: Int(game.wrappedHoleArray[number].p2Score), par: Int(game.wrappedHoleArray[number].par))
                            
                            PlayerScoreHoleView(mulligan: false, pScore: Int(game.wrappedHoleArray[number].p3Score), par: Int(game.wrappedHoleArray[number].par))
                            
                            PlayerScoreHoleView(mulligan: false, pScore: Int(game.wrappedHoleArray[number].p4Score), par: Int(game.wrappedHoleArray[number].par))
                        }
                        
                        .navigationTitle("Score Card")
                        
                        
                        
                    }
                    
                }
                
                
                
                HStack {
                    
                    NavigationLink(destination: Text("Game")) {
                        Text("10 - 18")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(String(game.parTotal - game.parFrontNine))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(String(game.p1Total - game.p1FrontNine))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(game.playersActive > 1 ?  String(game.p2Total - game.p2FrontNine) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(game.playersActive > 2 ? String( game.p3Total - game.p3FrontNine) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(game.playersActive > 3 ? String(game.p4Total - game.p4FrontNine) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Spacer(minLength: 2)
                    }
                }
                
                
                HStack {
                    
                    NavigationLink(destination: Text("Game")) {
                        Text("Total")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(String(game.parTotal))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(String(game.p1Total))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(game.playersActive > 1 ? String(game.p2Total) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(game.playersActive > 2 ?  String(game.p3Total) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Text(game.playersActive > 3 ?  String(game.p4Total) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                                                                .font(.system(size: 30))
                        Spacer(minLength: 2)
                    }
                }
                
                HStack {
                    
                    NavigationLink(destination: Text("Game")) {
                        Text("+/-")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text("--")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text( String(game.p1Total - game.parTotal ))
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text(game.playersActive > 1 ? String(game.p2Total - game.parTotal ) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text(game.playersActive > 2 ? String(game.p3Total - game.parTotal ) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Text(game.playersActive > 3 ? String(game.p3Total - game.parTotal ) : " ")
                            .frame(width: UIScreen.main.bounds.width / 7)
                            .fontWeight(.bold)
                        //                            .font(.system(size: 30))
                        Spacer(minLength: 2)
                    }
                }
                
                
            }.listStyle(.inset) // list 1 - 9
            
        }
        
    header: {
            HStack {
                
                NavigationLink(destination: Text("Game")) {
                    Text("Hole")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .fontWeight(.bold)
                    
                    Text("Par")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .fontWeight(.bold)
                    Text(game.wrappedP1Name)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text(game.wrappedP2Name)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text(game.wrappedP3Name)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text(game.wrappedp4Name)
                        .frame(width: UIScreen.main.bounds.width / 6)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer(minLength: 2)
                    
                }
            }
        }footer: {
            HStack {
                
                NavigationLink(destination: Text("Game")) {
                    Text("Hole")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .fontWeight(.bold)
                    
                    Text("Par")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .fontWeight(.bold)
                    Text(game.wrappedP1Name)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text(game.wrappedP2Name)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text(game.wrappedP3Name)
                        .frame(width: UIScreen.main.bounds.width / 7)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Text(game.wrappedp4Name)
                        .frame(width: UIScreen.main.bounds.width / 6)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer(minLength: 2)
                    
                }
            }
        }
        
        
        
        
        
    }
    
    
}
