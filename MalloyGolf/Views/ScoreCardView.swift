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
    
    
    
    
    
    var body: some View {
        
            List {
                
                ForEach(0..<18) {number in
                    
                    //header
                    if(number == 0) {

                            NavigationLink(destination: Text("Game")) {

                                HStack {


                                    Text("Hole")
                                        .frame(width: UIScreen.main.bounds.width / 7)
                                    Text("Par")
                                        .frame(width: UIScreen.main.bounds.width / 7)
                                    Text(game.wrappedP1Name)
                                        .frame(width: UIScreen.main.bounds.width / 7)
                                    Text(game.wrappedP2Name)
                                        .frame(width: UIScreen.main.bounds.width / 7)
                                    Text(game.wrappedP3Name)
                                        .frame(width: UIScreen.main.bounds.width / 7)
                                    Text(game.wrappedp4Name)
                                        .frame(width: UIScreen.main.bounds.width / 7)
                                }



                                .navigationTitle("Score Card")

                            }

                    }
                        

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

            }
            .listStyle(.grouped)
            
        
        }

}


//struct StatisticsView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        StatisticsView(game:Game())
//
//    }
//}
